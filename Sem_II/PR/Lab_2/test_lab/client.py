import socket
import threading

def receive_udp_messages():
    server_ip = '0.0.0.0'  # Ascultăm pe toate interfețele
    server_port = 9999

    # Crearea unui socket UDP
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.bind((server_ip, server_port))

    try:
        while True:
            data, addr = sock.recvfrom(1024)  # Primirea mesajului
            print(f"Mesaj primit de la {addr}: {data.decode('utf-8')}")
    except KeyboardInterrupt:
        print("Server terminat de utilizator.")
    finally:
        sock.close()

if __name__ == "__main__":
    # Crearea unui fir de execuție pentru a primi mesajele
    receive_thread = threading.Thread(target=receive_udp_messages)
    receive_thread.start()

    # Aici puteți adăuga alte activități sau așteptați ca firul de execuție să se termine
    # De exemplu, puteți adăuga o buclă care să trimită mesaje către server

    # Așteptăm ca firul de execuție să se termine
    receive_thread.join()
