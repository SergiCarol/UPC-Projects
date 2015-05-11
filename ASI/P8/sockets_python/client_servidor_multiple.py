import socket
import sys
import select
import Queue
HOST = sys.argv[1]    # The remote host
try:
    PORT = int(sys.argv[2])
except:
    PORT = ''

def promp_me() :
    sys.stdout.write('<You> ')
    sys.stdout.flush()

def promp_him():
    sys.stdout.write('\t\t<Him> ')
    sys.stdout.flush()

def client():
    
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect((HOST, int(PORT)))
    s.settimeout(2)
    while True:
        socket_list = [sys.stdin, s]
        read_sockets, write_sockets, error_sockets = select.select(socket_list , [], [])
        for sock in read_sockets:
            #incoming message from remote server
            if sock == s:
                data, addr = sock.recvfrom(1024)
                if not data :
                    print '\nDisconnected from chat server'
                    sys.exit()
                else :
                    print "\t\t<You>: "
                    sys.stdout.write(data)
                    #promp_him()
             
            #user entered a message
            else :
                print "<Him>: "
                msg = sys.stdin.readline()
                s.send(msg)
                #promp_me()

def servidor():
    
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.bind((HOST, int(PORT)))
    #s.listen(1)
    #conn= s.accept()
    s.settimeout(2)
    while True:
        socket_list = [sys.stdin, s]
        read_sockets, write_sockets, error_sockets = select.select(socket_list , [], [])
        for sock in read_sockets:
            #incoming message from remote server
            if sock == s:
                data, addr = sock.recvfrom(1024)
                if not data :
                    print '\nDisconnected from chat server'
                    sys.exit()
                else :
                    #print data
                    sys.stdout.write(data)
                    promp_him()
             
            #user entered a message
            else :
                msg = sys.stdin.readline()
                s.sendto(msg,addr)
                promp_me()



if __name__ == "__main__":

    if PORT == '':
        PORT = HOST
        HOST = ''
        servidor()
    elif HOST != '' and PORT != '':
        client()
    else:
        print "ERROR"

