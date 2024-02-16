Changelog 2-16-2024

Watchtower 2.0.0

All files not in the regex whitelist on Wazuh FIM now get their hashes automatically checked on VirusTotal.

An email with a URL to the result is automatically sent after the downloaded file alert goes off.

In other words, all files downloaded are now automatically scanned on VirusTotal.

In addition, various registry key FIM checks had to be whitelisted to prevent Wazuh from flooding VirusTotal with registry keys.

Result of changes:

Greatly improved endpoint security and additional visibility.
