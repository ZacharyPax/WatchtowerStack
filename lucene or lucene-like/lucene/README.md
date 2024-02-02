This directory contains Lucene queries that are used on Jehoahaz's installation of Grafana to provide alerting.
The queries can easily be copied, modified, and pasted into Grafana if you'd like to use any particular one.

For example, if you wanted to use the FTP intrusion query, but give 10.0.65.128 and exception, you can remove Riverland Energy's exceptions and add it like so:

tags:ftp AND !source.ip:192.168.0.8 AND !source.ip:10.27.2.118 AND !source.ip:192.168.0.16 AND !source.ip:192.168.0.36 -> tags:ftp AND !source.ip:10.0.65.128

