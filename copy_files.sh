#!/bin/bash

#files to be copied
FILES=(
    "SRR11220751_1.fastq.gz" "SRR11220751_2.fastq.gz"
    "SRR11220752_1.fastq.gz" "SRR11220752_2.fastq.gz"
    "SRR11220753_1.fastq.gz" "SRR11220753_2.fastq.gz"
    "SRR11220754_1.fastq.gz" "SRR11220754_2.fastq.gz"
    "SRR11220755_1.fastq.gz" "SRR11220755_2.fastq.gz"
    "SRR11220756_1.fastq.gz" "SRR11220756_2.fastq.gz"
    "SRR11220757_1.fastq.gz" "SRR11220757_2.fastq.gz"
    "SRR11220758_1.fastq.gz" "SRR11220758_2.fastq.gz"
    "SRR11220759_1.fastq.gz" "SRR11220759_2.fastq.gz"
    "SRR11220761_1.fastq.gz" "SRR11220761_2.fastq.gz"
    "SRR11220762_1.fastq.gz" "SRR11220762_2.fastq.gz"
    "SRR11220763_1.fastq.gz" "SRR11220763_2.fastq.gz"
    "SRR11220764_1.fastq.gz" "SRR11220764_2.fastq.gz"
    "SRR11220765_1.fastq.gz" "SRR11220765_2.fastq.gz"
    "SRR11220766_1.fastq.gz" "SRR11220766_2.fastq.gz"
    "SRR11220767_1.fastq.gz" "SRR11220767_2.fastq.gz"
    "SRR11220768_1.fastq.gz" "SRR11220768_2.fastq.gz"
    "SRR11220769_1.fastq.gz" "SRR11220769_2.fastq.gz"
    "SRR11220771_1.fastq.gz" "SRR11220771_2.fastq.gz"
    "SRR11220772_1.fastq.gz" "SRR11220772_2.fastq.gz"
    "SRR11220773_1.fastq.gz" "SRR11220773_2.fastq.gz"
    "SRR11220774_1.fastq.gz" "SRR11220774_2.fastq.gz"
    "SRR11220775_1.fastq.gz" "SRR11220775_2.fastq.gz"
    "SRR11220776_1.fastq.gz" "SRR11220776_2.fastq.gz"
    "SRR11220777_1.fastq.gz" "SRR11220777_2.fastq.gz"
    "SRR11220778_1.fastq.gz" "SRR11220778_2.fastq.gz"
    "SRR11220779_1.fastq.gz" "SRR11220779_2.fastq.gz"
    "SRR11220780_1.fastq.gz" "SRR11220780_2.fastq.gz"
)
LOCAL_DIR="/Volumes/humangenetics/DATA/PsychiatricResearch/Schizophrenia/SAX1/dbGAP_data/DAR117074_Controls/sra"
REMOTE_USER="mshphe009"
REMOTE_HOST="hpc.uct.ac.za"
REMOTE_DIR="/scratch/mshphe009/saxwesdata/cases/fastq"

# Copy files
for file in "${FILES[@]}"; do
    scp "$LOCAL_DIR/$file" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"
    if [ $? -eq 0 ]; then
        echo "Copied $file successfully."
    else
        echo "Failed to copy $file."
    fi
done
