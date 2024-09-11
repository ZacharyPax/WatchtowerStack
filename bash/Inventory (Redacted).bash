#! /bin/bash
clear
echo ---
echo Watchtower Wazuh API Access Script Public Copy
echo This script locates all instances of a software package in your environment.
echo Powered by GNU Grep, GNU Awk, Wazuh API, syscollector, and OSSEC.
echo ---
echo Zachary Pax 2024 for Riverland Energy Cooperative.
echo ---
echo Generating a json web token to access the API...
echo ---
WATCHTOWERTOKEN=$(curl -u wazuh:REDACTED -k -X POST "https://syscollector-api.hezekiah.infra.wt.local:55000/security/user/authenticate?raw=true")
echo ---
echo Token Generated and stored in Bash as WATCHTOWERTOKEN.
echo ---
echo Connecting to API and accessing hosts...
sleep 5
watchtowerapiresult=$(curl -k -X GET "https://syscollector-api.hezekiah.infra.wt.local:55000/agents?pretty=true" -H "Authorization: Bearer $WATCHTOWERTOKEN")
echo ---
echo Hosts accessed, downloading API results...
echo ---
sleep 5
echo $watchtowerapiresult
ids=$(echo "$watchtowerapiresult" | grep '"id":' | awk -F'"' '{print $4}')
for id in $ids; do
    url="https://syscollector-api.hezekiah.infra.wt.local:55000/syscollector/$id/packages?pretty=true"
    echo "Downloading Watchtower API Results from: $url"
    curl -k "$url" -H "Authorization: Bearer $WATCHTOWERTOKEN" -o "output_$id.json"
done
echo ---
echo Downloading complete.
echo Waiting a few seconds then analyzing files...
echo ---
sleep 5
clear
search_package() {
    local query=$1
    local result_files=$(ls output_*.json)
    local found_computers=()
    for file in $result_files; do
        if grep -q "$query" "$file"; then
            local computer_id=$(echo "$file" | sed -e 's/output_//' -e 's/.json//')
            found_computers+=("$computer_id")
        fi
    done
    if [ ${#found_computers[@]} -eq 0 ]; then
        echo "No computers found with the package '$query'. Penguinie is closing the program..."
        sleep 2
        exit
    else
        echo "Computers with the package '$query' installed:"
        for computer in "${found_computers[@]}"; do
            echo "Computer ID: $computer"
        done
        read -p "Do you want to look up what these computers are called? (yes/no): " lookup_choice
        if [[ "$lookup_choice" == "yes" || "$lookup_choice" == "y" ]]; then
            echo ---
            echo "Fetching names for the computers with the package '$query' installed:"
            for computer in "${found_computers[@]}"; do
                agent_url="https://syscollector-api.hezekiah.infra.wt.local:55000/agents?agents_list=$computer"
                echo "Fetching details from: $agent_url"
                agent_result=$(curl -k -X GET "$agent_url" -H "Authorization: Bearer $WATCHTOWERTOKEN")
                echo "Agent Result: $agent_result" 
                computer_name=$(echo "$agent_result" | jq -r '.data.affected_items[-1].name' >> "penguinie")
                mapfile -t names_array < <(echo "$agent_result" | jq -r '.data.affected_items[].name')
                cat penguinie
                if [ -z "$computer_name" ]; then
                    computer_name="Name not found"
                fi
            done
        fi
    fi
}
read -p "Enter the package to search for: " package_query
search_package "$package_query"

echo ---
echo File created. Pengiunie is cleaning up...
echo ---
sleep 3
clear
echo ---
echo Computers with package installed:
echo ---
cat penguinie
rm penguinie
echo ---
echo Execution complete.
echo ---
