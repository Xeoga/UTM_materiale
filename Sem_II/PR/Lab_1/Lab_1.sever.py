import socket
import threading
username = ''
connect_user = []
def client_thread(conn, addr):
    username = conn.recv(1024).decode()
    connect_user.append(username)
    while True:
        data = conn.recv(1024)
        if not data:
            break
        message = data.decode()
        print(f"Message from  {addr} {username}: {message}")
        conn.sendall(message.encode())
    connect_user.remove(username)
    conn.close()

def start_server():
    host = '127.0.0.1'
    port = 6696
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
