#!/bin/bash
# @author: Cody Sork <codysork@pm.me>
# @modified: 2025-08-23

# Configuration
# Set your backups directory here
BACKUP_DIR="$/Backups" 
# Set your files and directories to archive here
TO_ARCHIVE=($HOME/Calibre $HOME/Documents $HOME/Downloads $HOME/Images $HOME/Sync)
ARCHIVE="$BACKUP_DIR/$USER-backup-$(date +%Y-%m-%d).tar.gz"

# Command-line arguments
while (( "$#" )); do
    case $1 in
        -h|--help)
            echo "Usage: $0 [-h|--help] [-s|--skip-log-files]"
            echo "This script checks for errors in the system logs and journal."
            echo "Options:"
            echo "  -h, --help            Show this help message and exit."
            echo "  --noconfirm           Skip confirmation prompts."
            exit 0
            ;;
        -v|--verbose)
            VERBOSE=1
            shift
            ;;
        *)
            echo "Invalid option: $1" >&2
            exit 1
            ;;
    esac
done

# Create tarball in Backups directory
if [ "$VERBOSE" -eq 1 ]; then
    echo "Compressing backup directory..."
    tar -czvf "$ARCHIVE" "${TO_ARCHIVE[@]}"
else
    tar -czvf "$ARCHIVE" "${TO_ARCHIVE[@]}"
fi

# rclone sync the compressed backup directory
rclone sync "$ARCHIVE" gdrive:/Backups/ --quiet --log-file /dev/null
# Remove the archive file
rm "$ARCHIVE"
