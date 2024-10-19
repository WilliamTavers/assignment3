# Multi-Threaded Network Server for Pattern Analysis

<br> 

## Compilation 

## Project Overview
This project implements a multi-threaded network server that processes text files sent by clients and counts the occurrences of a search term in the files. The server runs in the background, and multiple clients send text files to the server using `netcat`.

## Files
- **server.c**: The C program for the server, which accepts client connections and counts occurrences of a specified search term.
- **client.c**: Placeholder for client code. For this project, `netcat (nc)` is used to simulate clients.
- **run_clients.sh**: A Bash script that simulates multiple clients connecting to the server and sending text files for processing.
- **Makefile**: Automates the process of compiling the server and client programs and running them.

## Requirements
You will need:
- **GCC (gcc)** for compiling the C programs.
- **Make (make)** for automation.
- **Netcat (nc)** for simulating client-server communication.

## How to Run the Program

1. **Compile the programs**:
   To compile both the client and server, use the following command:
   ```bash
   make
