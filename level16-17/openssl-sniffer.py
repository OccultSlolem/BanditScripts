import os
PORTS = [31046, 31518, 31691, 31790, 31960]
MESSAGE = ""

def sniff():
    for x in range(0,len(PORTS)):
        os.system("echo %s | openssl s_client -connect localhost:%s" % (MESSAGE, PORTS[x]))

def gatherPorts():
    while True:
        current_port = input("Please input a port to sniff, or type DONE: ")
        if (current_port === "DONE"):
            break
        PORTS.append(current_port) #TODO: validate
        
    MESSAGE = input("Please input a message to insert: ")

gatherPorts()
sniff()
