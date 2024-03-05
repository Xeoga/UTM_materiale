import socket
import threading
username = ''
connect_user = []

def send_to_all_clients(sender_conn, message):
    for user in connect_user:
        conn, username = user
        if conn != sender_conn:  # Evităm trimiterea mesajului înapoi către expeditor
            try:
                conn.sendall(message.encode())
            except:
                conn.close()
                connect_user.remove(user)

def client_thread(conn, addr):
    try:
        username = conn.recv(1024).decode()
        connect_user.append((conn, username))
        while True:
            data = conn.recv(1024)
            if not data:
                break
            message = f"{username}: {data.decode()}"
            print(f"Message from  {username}@{addr}: {message}")
            send_to_all_clients(conn, message)
    finally:
        connect_user.remove((conn, username))
        conn.close()

def start_server():
    host = '127.0.0.1'
    port = 6666
    s = socket.socket(socket.AF_INET,socket.SOCK_STREAM) #UDP (socket.AF_INET, socket.SOCK_DGRAM)
    s.bind((host, port))
    s.listen(5)
    print("Server is listening")

    while True:
        conn, addr = s.accept()
        print(f"Connected: {addr}")
        thread = threading.Thread(target=client_thread, args=(conn, addr))
        thread.start()
        #list_thread = threading.Thread(target=list_user_connect)
        #list_thread.start()
start_server()
