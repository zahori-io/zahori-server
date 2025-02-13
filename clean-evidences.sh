#!/bin/bash
# Script to remove old evidendes and free up disk space

# Ask the user the number of past days to keep the evenidences
read -p "How many days ago do you want to keep the evidences?: " number_of_days_to_keep

# Validate user input
if [[ "$number_of_days_to_keep" =~ ^[0-9]+$ ]]; then
  if ! [ "$number_of_days_to_keep" -ge 0 ]; then
    echo "The number must be >= 0"
    exit 1
  fi
else
  echo "Invalid input, write a number!"
  exit 1
fi

# Set date from today and $number_of_days_to_keep evidencies
limit_date=$(date -d "$number_of_days_to_keep days ago" +%Y%m%d)
limit_date_friendly=$(date -d "$number_of_days_to_keep days ago" +%Y-%m-%d)

read -p "Evidences before ${limit_date_friendly} will be removed, are you sure? (Y/n): " confirm_remove
if [ "$confirm_remove" == "Y" ]; then

    # Convert limit_date to timestamp format to be able to compare dates later
    limit_date_timestamp=$(date -d "$limit_date" +%s)

    # Find old evidences directories
    find ./evidences -type d | while read -r dir; do
      # Extract date from directory name yyyymmdd-HHMMSS
      dir_date=$(echo "$dir" | grep -oP '\d{8}-\d{6}' | head -n 1)

      if [ -n "$dir_date" ]; then
        # Convert directory date to timestamp (only the date, not the hour)
        fecha_dir_timestamp=$(date -d "${dir_date:0:8}" +%s)

        # Compare dates
        if [ $fecha_dir_timestamp -lt $limit_date_timestamp ]; then
          echo "Removing directory: $dir"
          rm -rf "$dir"
        fi
      fi
    done

fi





