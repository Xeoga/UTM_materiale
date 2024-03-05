import socket
import pickle
import threading

def receive_messages(s):
    while True:
        try:
            data = s.recv(1024)
            if not data:
                break
            print(f"Reveived from sever: {data.decode()}")
        except Exception as e:
            print(f"Error receiving data: {e}")
            break

def start_client(server_host, server_port):
    with socket.socket() as s:
        username = input("You'r user:")
        s.connect((server_host, server_port))
        s.sendall(username.encode())
        threading.Thread(target=receive_messages, args=(s,), daemon=True).start()
        while True:
            message = input("Enter message: ")
            if message.lower() == 'exit':
                break
            s.sendall(message.encode())
        
           # print(f"Received from server:{data.decode()}")

start_client('127.0.0.1', 6666)
