3-6-2024 Changelog

Watchtower 2.1.0

Implemented Yara rule detection with Wazuh FIM parallel to VT API

New local rules override to accommodate this

New OSSEC configuration to accommodate this

Result of changes:

Malicious files can be detected based on behavior, instead of just based on reputation/cryptographic hashes. This allows for never-before-seen malware to be detected in some cases.
