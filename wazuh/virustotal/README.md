Our Wazuh installation is different than most. I’ve configured this by setting email notifications on level 16, which is not used for any alerts, and then manually I overwrite the alerting level of various alerts to get the alerts I want. Other alerts are achieved by OpenSearch alerting with custom JSON.

The byproduct of this approach is that you need to know what you're doing. This is especially true with integrations, such as VirusTotal.

This file represents changes to the local_rules.xml file that need to be made after VirusTotal integration is completed to enable alerting. You may choose to deploy it differently but doing it this way gives me the most control over what gets alerted on.

In addition, syscheck is ignoring various registry keys so that their hashes do not get checked on VirusTotal.

