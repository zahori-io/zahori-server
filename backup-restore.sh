#!/bin/bash
# Script to restore backups

backups_dir="$(pwd)/backups"

# Search for all backup files in the directory ${backups_dir} that match the pattern.
backup_files=($(ls ${backups_dir}/backup_database_*.tar.gz 2>/dev/null))

# Check if backup files have been found.
if [ ${#backup_files[@]} -eq 0 ]; then
  echo "No backup found in the directory: ${backups_dir}"
  exit 1
fi

# Create an array to store the commit information and dates
commit_list=()

# Loop through the backup files and extract the commit information
for backup_file in "${backup_files[@]}"; do

  # "We use basename to extract only the file name without the path
  filename=$(basename "$backup_file")

  # Extract the commit ID and date-time from the file name (e.g., backup_database_20250212-0957_19a52f4.tar.gz)
  commit_id=$(echo $filename | sed -E 's/backup_database_[0-9]{8}-[0-9]{4}_([a-f0-9]+)\.tar\.gz/\1/')
  backup_datetime=$(echo $filename | sed -E 's/backup_database_([0-9]{8}-[0-9]{4})_.*/\1/')

  # Get the commit information (message and tag)
  commit_message=$(git log -1 --pretty=%B $commit_id)
  commit_tag=$(git tag --contains $commit_id | head -n 1)
  
  # If commit has no tags, set "N/A"
  if [ -z "$commit_tag" ]; then
    commit_tag="N/A"
  fi
  
  # Store the information in the array
  commit_list+=("Date-time: $backup_datetime  Commit: $commit_id  Tag: $commit_tag  Message: $commit_message")
done

# Sort the list of commits by date and time (from most recent to oldest)
IFS=$'\n' sorted_commit_list=($(sort -r <<<"${commit_list[*]}"))
unset IFS

# Display the available backups with their information
echo "Available backups:"
for i in "${!sorted_commit_list[@]}"; do
  echo "$((i+1)). ${sorted_commit_list[$i]}"
done

# Ask the user to choose an option
read -p "Select one option (1, 2, ...): " option

# Validate that the option is within the range
if [[ $option -lt 1 || $option -gt ${#sorted_commit_list[@]} ]]; then
  echo "Invalid option!"
  exit 1
fi

# Get the commit ID corresponding to the selected option
selected_commit_id=$(echo ${sorted_commit_list[$((option-1))]} | awk '{print $4}')

# Verify that the commit exists in the local repository
if ! git rev-parse --verify $selected_commit_id >/dev/null 2>&1; then
  echo "Error: Commit ID $selected_commit_id does not exist in the repository!"
  exit 1
fi

# Store the commit ID in a variable
commit_to_rollback=$selected_commit_id

backup_datetime=$(echo ${sorted_commit_list[$((option-1))]} | awk '{print $2}')
commit_message=$(git log -1 --pretty=%B $commit_to_rollback)
commit_tag=$(git tag --contains $commit_to_rollback | head -n 1)

# Show a summary of what will be done
echo ""
echo "Backup selected: "
echo "- Creation date-time: $backup_datetime"
echo "- Commit id: $commit_to_rollback"
echo "- Commit tag: $commit_tag"
echo "- Commit message: $commit_message"

read -p "¿Are you sure you want to rollback to this version? (Y/n): " rollback_choice
if [ "$rollback_choice" == "Y" ]; then

  # Search for the backup file corresponding to the selected commit in the ${backups_dir} folder.
  backup_file_to_restore="backup_database_${backup_datetime}_${selected_commit_id}.tar.gz"
  
  echo "Restoring database from file $backup_file_to_restore"
  docker run --rm -v zahori-database:/volume -v ${backups_dir}:/backup alpine tar xzf /backup/$backup_file_to_restore -C /volume

  echo "Checking out commit $commit_to_rollback ($commit_tag): $commit_message"
  git checkout $commit_to_rollback

fi

