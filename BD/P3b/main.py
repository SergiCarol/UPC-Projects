#-*- encoding: utf-8 -*-

from gestio_xarxa import *
from interpret import Interpret
import os
"""
Llistat de funcions:

crear_db

inserir_usuari
mostrar_usuaris
mostrar_amistats
info_usuari
show_friends
send_friend_request
check_friend_request
block_friend
unblock_friend

debug_buscar_email
debug_show_pass
debug_inserir_amistat
"""

def Create_Account(email,nom,cognom,poblacio,dataNeixement,path='default_profile.jpg'):
    pwd = getpass.getpass()
    insert_values_usuaris(str(email),str(nom),str(cognom),str(poblacio),dataNeixement,str(path),str(pwd))

def mostrar_usuaris():
    show_all_usuaris()

def mostrar_amistats():
    show_all_amistats()

def info_usuari(nom,cognom):
    show_user_info(str(nom),str(cognom))

def mostrar_amics(nom,cognom):
    show_friends_from(str(nom),str(cognom))

def enviar_peticio_amistat(email1,email2):
    pwd = getpass.getpass()
    send_friend_request(str(email1),str(email2),pwd)

def comprovar_peticions_amistat(email):
    pwd = getpass.getpass()
    check_friend_request(str(email),pwd)

def bloquejar_amistat(email1,email2):
    pwd = getpass.getpass()
    block_friend(str(email1),str(email2),pwd)

def desbloquejar_amistat(email1,email2):
    pwd = getpass.getpass()
    unblock_friend(str(email1),str(email2),pwd)

def debug_show_pass(nom,cognom):
    show_password(str(nom),str(cognom))

def nova_base_de_dades():
    saps_llegir = False
    while saps_llegir == False:
        ans = raw_input("Esteu segur que voleu crear una base de dades nova? Si la base de dades ja existeix es borrarà. [s/n]: ")
        if ans == 's':
            saps_llegir = True
            try:
                os.remove('xarxa_social.db')
                create_db()
            except OSError:
                create_db()
            
            
        elif ans == 'n':
            print "No es creara una base de dades nova"
            saps_llegir = True
        else:
            print "Tens que escriure s o n"


def debug_insert_accounts_file(path):
    """
    Aquesta funcio insereix dintre la base de dades una colecció d'usuaris 
    """
    
    f = open(path,'r')
    r = f.read()
    h = r.splitlines()
    
    for linies in h:
        line = linies.split(',') 
        pwd = getpass.getpass()       
        if len(line) == 5:
            insert_values_usuaris(line[0],line[1],line[2],line[3],int(line[4]),'default_profile.jpg',pwd)
       
        elif len(line) == 6:
            insert_values_usuaris(line[0],line[1],line[2],line[3],int(line[4]),line[5],pwd)
        else:
            print 'Usuari incorrecte'
    f.close()
            





def ending():
    """
    Funcio que s'executa quan sortim del programa.
    """
    print "Gracies per utilitzar la xarxa social 'CARLE'"

def begining():
    print "\n\t\t\t Xarxa Social CARLE"
    info()

def info():
    """
    Et mostra el conjunt de comandes que pots utilitzar en l'interpret.
    """
    print "Les comanandes són:\n -info\n -exit\n -crear_db \n -Create_Account 'email' 'nom' 'cognom' 'poblacio' 'data de neixement' 'imatge de perfil'(opcional) \n -mostrar_usuaris \n -mostrar_amistats \n -info_usuari 'nom' 'cognom' \n -mostrar_amics 'nom' 'cognom' \n -Friend_request 'email1' 'email2' \n -Check_requests 'email' \n -Block_friend 'email1' 'email2' \n -Unblock_friend 'email1' 'email2' \n Funcions de debug \n -debug_pass 'nom' 'cognom' \n -debug_accounts 'path'"
    print "*Aquells noms entre cometes simples '' indiquen el nom de la variable"

if __name__=="__main__":
    I= Interpret()
    I._prompt="=> "
    I.set_end(ending)
    I.set_begin(begining)
    I.afegeix_ordre("crear_db",nova_base_de_dades)
    I.afegeix_ordre("Create_Account",Create_Account)
    I.afegeix_ordre("mostrar_usuaris",mostrar_usuaris)
    I.afegeix_ordre("mostrar_amistats",mostrar_amistats)
    I.afegeix_ordre("info_usuari",info_usuari)
    I.afegeix_ordre("mostrar_amics",mostrar_amics)
    I.afegeix_ordre("Friend_request",enviar_peticio_amistat)
    I.afegeix_ordre("Check_requests",comprovar_peticions_amistat)
    I.afegeix_ordre("Block_friend",bloquejar_amistat)
    I.afegeix_ordre("Unblock_friend",desbloquejar_amistat)
    I.afegeix_ordre("debug_pass",debug_show_pass)
    I.afegeix_ordre("debug_accounts",debug_insert_accounts_file)
    I.afegeix_ordre("info",info)
    I.run()

