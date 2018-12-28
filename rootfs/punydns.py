#!/usr/bin/python
import urllib2, socket, os, time

update = "https://services.sapo.pt/PunyUrl/DNS/UpdateDNs?domain=%(DOMAIN)s&record_type=A&ESBUsername=%(USERNAME)s&ESBPassword=%(PASSWORD)s" % os.environ

while True:
    try:
        response = urllib2.urlopen(update).read()
        if "<result>OK</result>" not in response:
            print "WARNING:", response
    except Exception as e:
        print "ERROR:", e
    time.sleep(30*60)
