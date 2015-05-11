import socket
import sys
HOST = sys.argv[1]    # The remote host
try:
    PORT = int(sys.argv[2])
except:
    PORT = ''

def client():
    
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect((HOST, int(PORT)))
    s.settimeout(1)
    comment = raw_input("Escriu el que vols enviar: ")
    s.send(comment)
    while(True):
        try :
            data, addr = s.recvfrom(1024)
            print 'Received', repr(data) , 'From', repr(addr)
        except:

            comment = raw_input("Escriu el que vols enviar: ")
            if comment == "exit":
                s.close()
                break;
            s.send(comment)
        

def servidor():
    print "soc el servidor"
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    print HOST
    print PORT
    s.bind((HOST, int(PORT)))
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



if __name__ == "__main__":
    if PORT == '':
        PORT = HOST
        HOST = ''
        servidor()
    elif HOST != '' and PORT != '':
        client()
    else:
        print "ERROR"

