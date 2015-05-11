import socket

HOST = ''          # Symbolic name meaning all available interfaces
PORT = 10000       # Arbitrary non-privileged port
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind((HOST, PORT))
#s.listen(1)
#conn= s.accept()

while 1:
    # Els 1024 son els bytes que es llegeixen
    data, addr = s.recvfrom(1024)
    print 'Connected by', addr, data
    rx=raw_input()
    if rx=="exit":
        s.close()
        break
    s.sendto(rx,addr)
    

