# Multi-Threaded Network Server for Pattern Analysis


## Project Overview
This project implements a multi-threaded network server that processes text files sent by clients and counts the occurrences of a search term in the files. The server runs in the background, and multiple clients send text files to the server using `netcat`.
<br>

---

## Files
- **server.c**: The C program for the server, which accepts client connections, processes the input (books) and stores the books into a global linked list line-by-line. There is also a list for each book, and a list for each line which contains the search pattern for each book.
- **client.c**: Client code which uses netcat (nc) to send books to the server
- **run_clients.sh**: A Bash script that simulates multiple clients connecting to the server and sending text files for processing.
- **Makefile**: Automates the process of compiling the server and client programs and running them.
- **txt Files**: Txt files are needed for testing. For test files to work:
  - Must be in same directory
  - Must be in the bash script in files array
  - Must have the title as the first line

---

## Requirements
You will need:
- **GCC (gcc)** for compiling the C programs.
- **Make (make)** for automation.
- **Netcat (nc)** for simulating client-server communication.


---

## Build with Make

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
```


---

## Build with Bash

<br> 

1. **Compilation of Client**

```
gcc client.c -o client -lpthread   
```
<br>

2. **Compilation of Server**

```
gcc server.c -o server -lpthread   
```
<br>

3. **Running of Server**

```
./server -l 12345 -p "happy"
```
<br>

4. **Compilation of Bash**

```
chmod +x run_clients.sh
```
<br>

5. **Running of Bash**

```
./run_clients.sh
```


<br>

---

---

## Build without Bash

<br> 

1. **Compilation of Client**

```
gcc client.c -o client -lpthread   
```
<br>

2. **Compilation of Server**

```
gcc server.c -o server -lpthread   
```
<br>

3. **Running of Server**

```
./server -l 12345 -p "happy"
```
<br>

4. **Connecting Clients**

```
nc localhost 12345 -i <delay> < file.txt
```
<br>

---


## Important

- It is important that all requirements and files are used as expected (i.e., if txt files are not in files in bash script then it will not run as expected)
- The make file kills any server / process running that is server at start and end of make
- Before killing the server at the end, the makefile sends a sleep for 5 seconds (time for a pattern frequency test), to ensure that we get a final pattern frequency before the server is killed






