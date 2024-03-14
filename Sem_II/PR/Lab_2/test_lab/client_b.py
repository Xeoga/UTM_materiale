import socket
import threading

class Client:
    def __init__(self, server_host, server_port):
        self.server_host = server_host
        self.server_port = server_port
        self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.client_socket.connect((server_host, server_port))

    def send_message(self, message):
        self.client_socket.send(message.encode())

    def receive_messages(self):
        while True:
            try:
                message = self.client_socket.recv(1024).decode()
                print(f"Received message: {message}")
            except ConnectionResetError:
                print("Connection closed by server.")
                break

    def start(self):
        # Thread pentru a primi mesaje
        receive_thread = threading.Thread(target=self.receive_messages)
        receive_thread.start()

        # Trimiterea și recepționarea mesajelor
        while True:
            message = input("Enter message: ")

            if message.startswith('/send'):
                parts = message.split()
                if len(parts) >= 3:
                    ip_address = parts[1]
                    message_to_send = ' '.join(parts[2:])
                    self.send_message_to_ip(ip_address, message_to_send)
                else:
                    print("Invalid format. Use: /send <IP_address> <message>")
            else:
                self.send_message(message)

    def send_message_to_ip(self, ip_address, message):
        try:
            target_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            target_socket.connect((ip_address, self.server_port))
            target_socket.send(message.encode())
            target_socket.close()
        except Exception as e:
            print(f"Error sending message to {ip_address}: {e}")

if __name__ == "__main__":
    server_host = input("Enter server IP address: ")
    server_port = int(input("Enter server port: "))

    client = Client(server_host, server_port)
    client.start()
