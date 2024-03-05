import socket
import threading
import sys

server_host = '192.168.1.14'
port = 9999
server_broadcast = '192.168.1.255'
'''
def create_udp_socket():
    try:
        return socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    except socket.error as e:
        print(f"Error creating socket: {e}")
        sys.exit(1)

def send_message(sock, message, addr):
    try:
        sock.sendto(message.encode(), addr)
    except socket.error as e:
        print(f"Error sending message: {e}")

def receive_broadcast_messages(sock, buffer_size=1024):
    try:
        while True:
            data, addr = sock.recvfrom(buffer_size)  # Primirea mesajului
            print(f"Received broadcast message from {addr}: {data.decode('utf-8')}")
    except socket.error as e:
        print(f"Error receiving broadcast message: {e}")

def listen_for_broadcast(sock, buffer_size=1024):
    receive_broadcast_messages(sock, buffer_size)

def main():
    sock = create_udp_socket()

    # Setarea adresei serverului (IP și port)
    server_address = (server_host, port)
    sock.connect(server_address)

    # Legare la adresa de broadcast
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    general_channel_address = (server_broadcast, port)  # Canal general (broadcast)
    sock.connect(general_channel_address)

    username = input("Your user:")
    send_message(sock, username, server_address)

    # Crearea unui fir de execuție pentru a asculta mesajele de broadcast
    broadcast_thread = threading.Thread(target=listen_for_broadcast, args=(sock,))
    broadcast_thread.start()

    try:
        while True:
            message = input("Enter message:")
            if message.startswith('/send'):
                parts = message.split()
                if len(parts) == 3:
                    thost = parts[1]
                    message_to_send = parts[2]
                    # Trimite mesajul către IP-ul specificat
                    sock.sendto(message_to_send.encode(), (thost, port))
            else:
                # Trimite mesajul prin broadcast către toate adresele
                send_message(sock, message, general_channel_address)
    except KeyboardInterrupt:
        print("Program terminated by user.")
    finally:
        sock.close()

if __name__ == "__main__":
    main()
'''

def create_udp_socket():
    try:
        return socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    except socket.error as e:
        print(f"Error creating socket: {e}")
        sys.exit(1)

def receive_udp_messages():
    server_ip = '0.0.0.0'  # Ascultăm pe toate interfețele
    server_port = 5000

    # Crearea unui socket UDP
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    #sock.bind((server_ip, server_port))
     # Setarea adresei serverului (IP și port)
    server_address = (server_host, port)
    sock.connect(server_address)

    # Legare la adresa de broadcast
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    general_channel_address = (server_broadcast, port)  # Canal general (broadcast)
    sock.connect(general_channel_address)
    try:
        while True:
            data, addr = sock.recvfrom(1024)  # Primirea mesajului
            print(f"Mesaj primit de la {addr}: {data.decode('utf-8')}")
    except KeyboardInterrupt:
        print("Server terminat de utilizator.")
    finally:
        sock.close()
def send_broadcast_message():
    # Crearea unui socket UDP
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)

    # Portul pe care dorim să trimitem mesajele
    port = 5000

    try:
        message = input("Enter the message")  # Mesajul pe care îl trimitem
        sock.sendto(message.encode(), ('<broadcast>', port))  # Trimitem mesajul către adresa de broadcast
        #time.sleep(2)  # Pauză între mesaje
    except KeyboardInterrupt:
        print("Program terminat de utilizator.")
    finally:
        sock.close()   
if __name__ == "__main__":
    
    receive_thread = threading.Thread(target=receive_udp_messages)
    receive_thread.start()
    sock = create_udp_socket()

    try:
        while True:
            send_broadcast_message()
    except KeyboardInterrupt:
        print("Program terminated by user.")
    finally:
        sock.close()
    # Aici puteți adăuga alte activități sau așteptați ca firul de execuție să se termine
    # De exemplu, puteți adăuga o buclă care să trimită mesaje către server

    
    receive_thread.join()