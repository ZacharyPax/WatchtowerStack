The file structure of this repository is very intentional.

Put simply, changes committed directly to a file indicate a necessary or immediate fix on that file. An example is a critical bug fix. Changes committed directly to a file will not increase the "rev" counter. However, if a non-essential bug fix, improvement, new feature, etc. is added, I will increment the value of "rev" to indicate a new file revision.

The purpose of this is that I can just package all the configuration files, scripts, HTML, etc. on a rolling-release model, just like Arch Linux. "Watchtower 2.X.X" then isn’t a select subset of the configurations/source, it is a list of specific revisions of files from that period in time. 

This makes it extremely easy to revert to older operating states simply by uploading the old configuration files directly to the virtual machines and the services that they run.

This is a custom-built stack for a specific environment, you will not be able to just drop it in and have it magically work in your environment. Having said that, if you have a good understanding of Elastic, Prometheus, Wazuh, and Zeek/Suricata or Security Onion, you should be able to have similar levels of functionality in under 40 man hours of configuration, or 20 if you’re quite skilled and efficient. 
