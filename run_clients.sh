#!/bin/bash

# Number of clients to simulate
NUM_CLIENTS=10

# Server address and port
SERVER_ADDR="localhost"
SERVER_PORT=12345

#!/bin/bash

filesAlpha=("a_chars.txt" "b_chars.txt" "c_chars.txt" "d_chars.txt" "e_chars.txt" "f_chars.txt" "g_chars.txt" "h_chars.txt" "i_chars.txt" "j_chars.txt")
# files=("afox.txt" "anoplacelikehome.txt" "aldyths.txt" "athegoldgenrule.txt" "avegetarian.txt")
filesOld=("./afox.txt" "./anoplacelikehome.txt" "./aldyths.txt" "./athegoldgenrule.txt" "./avegetarian.txt")
files=("./f1.txt" "./f2.txt" "./f3.txt" "./f4.txt" "./f5.txt")


for i in "${!files[@]}"; do
  echo "Starting client $((i+1)) using file ${files[$i]}"
  nc localhost 12345 -i 1 < "${files[$i]}" &
  sleep 0.5  # Add a delay of 0.5 seconds between clients
done

wait  # Wait for all background clients to finish
echo "All clients finished"



# #!/bin/bash

# files=("f1.txt" "f2.txt" "f3.txt" "f4.txt" "f5.txt")

# for i in "${!files[@]}"; do
#   filename="${files[$i]}"
#   echo "Starting client $((i+1)) using file ${filename}"

#   # Send the filename first, followed by the file contents
#   (echo "$filename"; cat "${filename}") | nc localhost 12345 -i 1 &

#   sleep 0.5  # Add a delay of 0.5 seconds between clients
# done

# wait  # Wait for all background clients to finish
# echo "All clients finished"


# #!/bin/bash

# files=("f1.txt" "f2.txt" "f3.txt" "f4.txt" "f5.txt")

# for i in "${!files[@]}"; do
#   filename="${files[$i]}"
#   echo "Starting client $((i+1)) using file ${filename}"

#   # Do not send the filename as a line of content
#   cat "${filename}" | nc localhost 12345 -i 1 &

#   sleep 0.5  # Add a delay of 0.5 seconds between clients
# done

# wait  # Wait for all background clients to finish
# echo "All clients finished"