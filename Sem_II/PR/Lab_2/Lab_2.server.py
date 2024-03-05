import socket
import sys
import threading

connected_users = []

def create_udp_socket():
    try:
        return socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    except socket.error as e:
        print(f"Error creating socket: {e}")
        sys.exit(1)

def receive_messages(sock, buffer_size=1024):
    while True:
        try:
            data, address = sock.recvfrom(buffer_size)
            message = data.decode()
            print(f"Message: {message} from {address}")
        except socket.error as e:
            print(f"Error receiving data: {e}")

def main():
    # Crearea unui socket UDP
    sock = create_udp_socket()

    # Setarea socketului pentru a permite adreselor de broadcast
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)

    # Legarea socketului la adresa specifică și portul pentru a asculta mesaje
    server_address = ('192.168.1.14', 9999)  # Ascultă pe toate interfețele disponibile
    sock.bind(server_address)

    print("UDP server listening on port 10000")

    # Crearea unui fir de execuție pentru a primi mesaje
    receive_thread = threading.Thread(target=receive_messages, args=(sock,))
    receive_thread.start()

    try:
        receive_thread.join()  # Așteaptă încheierea firului de execuție
    except KeyboardInterrupt:
        print("\nServer stopped by user")
    finally:
        sock.close()

if __name__ == "__main__":
    main()
