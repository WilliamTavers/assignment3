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
	# Kill any previous server process
	pkill -f "./server" || true  
	# Start the server in the background and capture its PID
	./$(SERVER_EXEC) -l $(PORT) -p $(SEARCH_TERM) &  
	SERVER_PID=$$!  # Use $$! to correctly capture the PID of the background process
	echo "Server started with PID: $$SERVER_PID"  # Debugging output to see the PID
	# Give the server a moment to start
	sleep 2  
	# Ensure client script is executable
	chmod +x $(RUN_SCRIPT)
	# Run the client script
	./$(RUN_SCRIPT)
	# Wait for all client processes to finish
	wait  
	# Now that clients are done, gracefully stop the server
	pkill -f "./server" && echo "Server stopped successfully" || echo "Server was not running"	
	echo "Server stopped"

# Phony targets
.PHONY: all clean run
