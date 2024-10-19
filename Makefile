# Variables
CC = gcc
CFLAGS = -Wall -pthread
CLIENT_SRCS = client.c
SERVER_SRCS = server.c
CLIENT_EXEC = client
SERVER_EXEC = server
RUN_SCRIPT = run_clients.sh
PORT = 12345
SEARCH_TERM = "happy"

# Default target: build both client and server
all: $(CLIENT_EXEC) $(SERVER_EXEC)

# Build the client
$(CLIENT_EXEC): $(CLIENT_SRCS)
	$(CC) $(CFLAGS) -o $(CLIENT_EXEC) $(CLIENT_SRCS)

# Build the server
$(SERVER_EXEC): $(SERVER_SRCS)
	$(CC) $(CFLAGS) -o $(SERVER_EXEC) $(SERVER_SRCS)

# Clean up object files and executables
clean:
	rm -f $(CLIENT_EXEC) $(SERVER_EXEC)

# Run the server and client script in sequence
run: $(SERVER_EXEC)
	# killing any previous server processes
	pkill -f "./server" || true  
	# starting the server
	./$(SERVER_EXEC) -l $(PORT) -p $(SEARCH_TERM) &  
	# giving the server a moment to start
	sleep 2  
	# ensuring client script is executable
	chmod +x $(RUN_SCRIPT)
	# running the client script
	./$(RUN_SCRIPT)
	# waiting for all clients to finish
	wait  
	# sleeping for final frequency results
	sleep 5
	# stopping server as clients done
	pkill -f "./server" && echo "Server stopped successfully" || echo "Server was not running"	
	echo "Server stopped"

# Phony targets
.PHONY: all clean run
