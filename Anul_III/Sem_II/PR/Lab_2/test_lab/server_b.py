import socket
import threading

class Server:
    def __init__(self, host, port):
        self.host = host
        self.port = port
        self.server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.server_socket.bind((host, port))
        self.clients = []

    def broadcast(self, message, sender_socket=None):
        for client_socket in self.clients:
            if client_socket != sender_socket:
                client_socket.send(message.encode())

    def handle_client(self, client_socket, client_address):
        self.clients.append(client_socket)
        print(f"Client {client_address} connected.")
        try:
            while True:
                message = client_socket.recv(1024).decode()
                if message:
                    if message.startswith('/send'):
                        parts = message.split()
                        if len(parts) >= 3:
                            ip_address = parts[1]
                            message_to_send = ' '.join(parts[2:])
                            self.send_message_to_ip(ip_address, message_to_send)
                        else:
                            client_socket.send("Invalid format. Use: /send <IP_address> <message>".encode())
                    else:
                        self.broadcast(f"Client {client_address}: {message}", client_socket)
        except ConnectionResetError:
            print(f"Client {client_address} disconnected.")
            self.clients.remove(client_socket)

    def send_message_to_ip(self, ip_address, message):
        try:
            target_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            target_socket.connect((ip_address, self.port))
            target_socket.send(message.encode())
            target_socket.close()
        except Exception as e:
            print(f"Error sending message to {ip_address}: {e}")

    def start(self):
        self.server_socket.listen(5)
        print(f"Server is listening on {self.host}:{self.port}")
        while True:
            client_socket, client_address = self.server_socket.accept()
            client_handler = threading.Thread(target=self.handle_client, args=(client_socket, client_address))
            client_handler.start()

if __name__ == "__main__":
    server_host = '0.0.0.0'  # Ascultăm pe toate interfețele
    server_port = 9999

    server = Server(server_host, server_port)
    server.start()
