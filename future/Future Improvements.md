# Future improvements in consideration/development

## Completed Improvements

* Detection for lateral movement via SMB on any non-approved devices.
  * This really shouldn't be that hard and a working ETA would be no later than 2/18.

* VirusTotal integration on all files downloaded on our endpoints
  * This has a pretty clear path forward for development and would honestly not take very long to implement.

* YARA signature matching for malware detection
  
* Machine learning algorithm for endpoint data
  
* Move Watchtower Stack to its own dedicated VLAN

## Improvements still in development/consideration

* Move all Ubuntu VMs and Windows 10 VM to Oracle Linux or Rocky Linux.
  * In addition, the merger of Vashti, Jehoahaz, and Korah should be possible now.
  * It is probably wise to wait for additional hardware because I will want this to be high-availability so I can work on components without losing visibility in the mean time.

* Create a functional Strelka UI based on Strelka UI project
  * This has been completed but will not be moved to production because I don't think it's practical enough to justify the compute resources it needs.
  * The proof of concept already works, but there are some bugs. Probably because I'm firewalling Strelka through Security Onion.
  * Bugs continue, perhaps I'll spin up a parallel instance.
 
* Replace Dashy installation with all custom HTML

* Create something similar to the Sankey Generator, but that takes all inputs to generate a Sankey or perhaps something else. The Security Onion dashboard might make sense to me, but ultimately nobody is going to use it unless they know how to use Lucene query language and if I can make it easier than it will be useful for more people than just me.

* Create another Pihole as a secondary DNS and point it to the same DNS servers so we can have fully redundant Pihole and prevent another cybersecurity incident from malvertising lol
