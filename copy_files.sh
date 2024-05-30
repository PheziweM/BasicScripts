#!/bin/bash

#files to be copied
FILES=(
    "SampleA_1.fastq.gz" "SampleA_2.fastq.gz"
    "..." )
LOCAL_DIR="/PATH"
REMOTE_USER="student#"
REMOTE_HOST="hpc.INSTITUTION.ac.za"
REMOTE_DIR="/PATH"

# Copy files
for file in "${FILES[@]}"; do
    scp "$LOCAL_DIR/$file" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"
    if [ $? -eq 0 ]; then
        echo "Copied $file successfully."
    else
        echo "Failed to copy $file."
    fi
done
