import sys, urllib.request
open(r"C:\marker.txt", "w").write("ran " + sys.version)

req = urllib.request.Request("https://example.com", headers={"User-Agent": "Mozilla/5.0"})
open(r"C:\marker.txt", "a").write("\nnet " + str(urllib.request.urlopen(req).status))
