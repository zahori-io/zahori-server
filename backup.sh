#!/bin/bash
# Script to perform a backup of the current state of the zahori server
# The backup will save the current state of the database and the current commit id of the git repository

backups_dir="$(pwd)/backups"

current_commit=$(git rev-parse --short HEAD)
current_datetime=$(date +%Y%m%d-%H%M)

### 1. Create 'backups' dir if does not exist
if [ ! -d $backups_dir ]; then
  echo "Creating directory '$backups_dir'..."
  mkdir $backups_dir
fi


### 2. Set the name of the backup file
backup_file="backup_database_${current_datetime}_${current_commit}.tar.gz"


### 3. Create backup file
echo "Creating backup of the database -> $backups_dir/$backup_file"
docker run --rm -v zahori-database:/volume -v ${backups_dir}:/backup alpine tar czf /backup/$(basename $backup_file) -C /volume .


### 4. Clean old backup files

num_backups_to_keep=5
echo "Remove older backups (keep the lastest $num_backups_to_keep)..."

# Search all backup files
backup_files=($(ls $backups_dir/backup_database_* 2>/dev/null))

# Count number of backups found
num_files=${#backup_files[@]}

# If found more than $num_backups_to_keep backups, remove oldests
if [ "$num_files" -gt $num_backups_to_keep ]; then
  # Order files by date and hour indicated in the file name (yyyyMMdd-HHmm)
  files_to_delete=($(for file in "${backup_files[@]}"; do echo "$file"; done | sort -t'_' -k2,2 -k3,3 | head -n -$num_backups_to_keep))

  # Remove oldest files
  for file in "${files_to_delete[@]}"; do
    echo "   -> Removing old backup $file"
    rm -f "$file"
  done
fi

echo "Backup finished!"


