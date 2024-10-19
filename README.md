# Multi-Threaded Network Server for Pattern Analysis

<br> 

## Compilation 

## Project Overview
This project implements a multi-threaded network server that processes text files sent by clients and counts the occurrences of a search term in the files. The server runs in the background, and multiple clients send text files to the server using `netcat`.

---

## Files
- **server.c**: The C program for the server, which accepts client connections, processes the input (books) and stores the books into a global linked list line-by-line. There is also a list for each book, and a list for each line which contains the search pattern for each book.
- **client.c**: Client code. 
- **run_clients.sh**: A Bash script that simulates multiple clients connecting to the server and sending text files for processing.
- **Makefile**: Automates the process of compiling the server and client programs and running them.
- **txt Files**: for testing, ensure the title is in the first line for ease of testing. 

---

## Requirements
You will need:
- **GCC (gcc)** for compiling the C programs.
- **Make (make)** for automation.
- **Netcat (nc)** for simulating client-server communication.


---

## Running the Program

<br>

1. **Compilation**:

``` 

make

``` 

or for server.c:

``` 

make server

``` 

or for client.c: 

``` 

make client

``` 

<br>

2. **Running**:

``` 

make run

``` 

<br>

3. **Cleaning**:

``` 

make clean

''' 
