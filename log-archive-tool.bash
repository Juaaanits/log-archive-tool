#!/bin/bash

# Define variables
LOG_DIR="/var/log/myapp" # Directory containing your logs
ARCHIVE_DIR="/var/log/archives" # Directory to store archives
RETENTION_DAYS=30 # Number of days to retain old archives
DATE_FORMAT=$(date +%Y%m%d%H%M%S) # Timestamp for archive file name


# Create archive directory if it doesn't exist
create_archive_directory(){
    mkdir -p "$ARCHIVE_DIR"
    echo "Directory created..."
}

# Archive logs older than a certain age (e.g., 7 days)
# Find log files modified more than 7 days ago and archive them
archive_logs(){
find "$LOG_DIR" -type f -name "*.log" -mtime +7 -print0 | xargs -0 tar -czvf "$ARCHIVE_DIR/logs_archive_$DATE_FORMAT.tar.gz"
}


# Remove old archives (e.g., older than RETENTION_DAYS)
remove_archived_logs(){
find "$ARCHIVE_DIR" -type f -name "*.tar.gz" -mtime +"$RETENTION_DAYS" -delete
}




main() {
    echo "=========== Log Archive Tool ========================"
    create_archive_directory
    echo
    archive_logs
    echo
    remove_archived_logs
    echo
    echo "Log archiving completed at $DATE_FORMAT"
}

main
