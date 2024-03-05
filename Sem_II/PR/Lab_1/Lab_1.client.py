import socket
import pickle
def start_client(server_host, server_port):
    with socket.socket() as s:
        username = input("You'r user:")
        s.connect((server_host, server_port))
        s.sendall(username.encode())
        while True:
            message = input("Enter message: ")
            if message.lower() == 'exit':
                break
            s.sendall(message.encode())
            data = s.recv(1024)
            print(f"Received from server:{data.decode()}")

start_client('127.0.0.1', 6696)
