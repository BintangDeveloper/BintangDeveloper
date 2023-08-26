import socket

# Server configuration
host = '0.0.0.0'
port = 8080
server_key = '1388582293'

# Create socket
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind socket to address and port
server_socket.bind((host, port))

# Wait for client connection
server_socket.listen(1)
print('Waiting for connections from clients...')

# Accept connection
client_socket, client_address = server_socket.accept()
print(f'Connected to {client_address}')

# Verify client's key
received_key = client_socket.recv(1024).decode()
if received_key != server_key:
    print('Invalid key. Closing connection.')
    client_socket.close()
    server_socket.close()
    exit()

# Loop to receive and process commands
while True:
    command = input('Enter command: ')
    if command == 'exit':
        break
    client_socket.send(command.encode())
    output = client_socket.recv(1024).decode()
    print(f'Server Output: {output}')

# Close sockets and connections
client_socket.close()
server_socket.close()
