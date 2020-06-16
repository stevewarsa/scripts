import random, time, sys, re, urllib2
baseURL = "https://www.biblegateway.com/audio/devotional/morning-and-evening/"
daysByMonth = {}
daysByMonth["01"] = 31
daysByMonth["02"] = 29
daysByMonth["03"] = 31
daysByMonth["04"] = 30
daysByMonth["05"] = 31
daysByMonth["06"] = 30
daysByMonth["07"] = 31
daysByMonth["08"] = 31
daysByMonth["09"] = 30
daysByMonth["10"] = 31
daysByMonth["11"] = 30
daysByMonth["12"] = 31
for key, value in daysByMonth.items():
	for i in range(1, value + 1):
		try:
			morningKey = key + str(i).rjust(2, '0') + "m"
			morningURL = baseURL + morningKey
			req = urllib2.Request(morningURL)
			req.add_unredirected_header('User-Agent', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31')
			source = urllib2.urlopen(req).read()
			matches = re.findall(r'https://stream.biblegateway.com/media/32/morning-and-evening/(.*).mp3', source)
			morningMp3URL = "https://stream.biblegateway.com/media/32/morning-and-evening/" + matches[0] + ".mp3"
			print morningMp3URL
			randSleep = random.randint(1, 20)
			print "sleeping for " + str(randSleep) + " seconds ...."
			time.sleep(randSleep)
			print "retrieving MP3 from " + morningMp3URL + "..."
			req = urllib2.Request(morningMp3URL)
			req.add_unredirected_header('User-Agent', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31')
			source = urllib2.urlopen(req).read()
			with open('c:/cygwin/home/swars/spurgeon/' + key + '/' + morningKey + '.mp3', 'wb') as f:
				f.write(source)
			randSleep = random.randint(1, 20)
			print "Morning MP3 downloaded as " + morningKey + ".mp3 - sleeping for " + str(randSleep) + " seconds ...."
			time.sleep(randSleep)
		except:
			print "[" + time.asctime(time.localtime(time.time())) + "] Error occurred while processing morning download:  " + \
                sys.exc_type, sys.exc_info()

		try:
			eveningKey = key + str(i).rjust(2, '0') + "e"
			eveningURL = baseURL + eveningKey
			req = urllib2.Request(eveningURL)
			req.add_unredirected_header('User-Agent', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31')
			source = urllib2.urlopen(req).read()
			matches = re.findall(r'https://stream.biblegateway.com/media/32/morning-and-evening/(.*).mp3', source)
			eveningMp3URL = "https://stream.biblegateway.com/media/32/morning-and-evening/" + matches[0] + ".mp3"
			print eveningMp3URL
			randSleep = random.randint(1, 20)
			print "sleeping for " + str(randSleep) + " seconds ...."
			time.sleep(randSleep)
			req = urllib2.Request(eveningMp3URL)
			req.add_unredirected_header('User-Agent', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31')
			source = urllib2.urlopen(req).read()
			with open('c:/cygwin/home/swars/spurgeon/' + key + '/' + eveningKey + '.mp3', 'wb') as f:
				f.write(source)
			randSleep = random.randint(1, 20)
			print "Evening MP3 downloaded as " + eveningKey + ".mp3 - sleeping for " + str(randSleep) + " seconds ...."
			time.sleep(randSleep)
		except:
			print "[" + time.asctime(time.localtime(time.time())) + "] Error occurred while processing evening download:  " + \
                sys.exc_type, sys.exc_info()
		