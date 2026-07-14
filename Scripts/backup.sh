#!/bin/bash
# @author: Cody Sork <codysork@tutamail.com>
# @license: MIT
# @modified: 2026-07-12
# @about My backup script using Nextcloud. Creates a backup of local and remote
#        directories and syncs it to Nextcloud.

# ------------------------------------------------------------------------------
#                              Configuration
# ------------------------------------------------------------------------------

# What to backup
# --------------

# Local backups
LOCAL_TO_BACKUP=("$HOME/Documents" "$HOME/.minetest")
# Remote backups
REMOTE="cody@sork.local"
REMOTE_HOME="$REMOTE:/home/cody"
REMOTE_TO_BACKUP=("$REMOTE_HOME/Hosting")

# Where and how to store the backups
# ----------------------------------

# DO NOT CHANGE THIS
TIMESTAMP="$(date +%Y%m%d%H%M%S)"
# Where to store the backups
BACKUP_DIR="$HOME/Sync/Nextcloud/Backup"
# Local backups
LOCAL_BACKUP_DIR="$HOME/Sync/Nextcloud/Backup/Local"
LOCAL_ARCHIVE_DIR="$LOCAL_BACKUP_DIR/$TIMESTAMP"
LOCAL_ARCHIVE="$LOCAL_ARCHIVE_DIR/$USER-desktop-backup-$TIMESTAMP.tar.gz"
# Remote backups
REMOTE_BACKUP_DIR="$HOME/Sync/Nextcloud/Backup/Remote"
REMOTE_ARCHIVE_DIR="$REMOTE_BACKUP_DIR/$TIMESTAMP"
REMOTE_ARCHIVE="$REMOTE_ARCHIVE_DIR/$USER-server-backup-$TIMESTAMP.tar.gz"

# Other options (best left as-is)
VERBOSE=0
NOCONFIRM=0

#-------------------------------------------------------------------------------
#                                Main
#-------------------------------------------------------------------------------	

while (( "$#" )); do
    case $1 in
        -h|--help)
            echo "Usage: $0 [-h|--help] [-v|--verbose] [--noconfirm]"
            echo "Creates a compressed backup archive and syncs it to Nextcloud."
            echo "Options:"
            echo "  -h, --help      Show this help message and exit."
            echo "  -v, --verbose   Show verbose output."
            echo "  --noconfirm     Skip confirmation prompts."
            exit 0
            ;;
        -v|--verbose)
            VERBOSE=1
            shift
            ;;
        --noconfirm)
            NOCONFIRM=1
            shift
            ;;
        *)
            echo "Invalid option: $1" >&2
            exit 1
            ;;
    esac
done

if [[ $EUID -eq 0 ]]; then
    echo "Error: This script must not be run as root." >&2
    exit 1
fi

if [[ "$NOCONFIRM" -ne 1 ]]; then
    echo "Will archive: ${LOCAL_TO_BACKUP[*]}"
    read -r -p "Proceed? [y/N] " response
    [[ "$response" =~ ^[Yy]$ ]] || exit 0
fi

if [[ ! -d "$BACKUP_DIR" ]]; then
    echo "Error: Backup directory does not exist: $BACKUP_DIR" >&2
    exit 1
else
    mkdir -p "$LOCAL_ARCHIVE_DIR" || { echo "Error: Failed to create archive directory." >&2; exit 1; }
fi

if [[ "$VERBOSE" -eq 1 ]]; then
    echo "Creating archive: $LOCAL_ARCHIVE and syncing to Nextcloud..."
fi

if [[ "$VERBOSE" -eq 1 ]]; then
    echo "Creating local backups..."
fi

if [[ "$VERBOSE" -eq 1 ]]; then
    tar -czvf "$LOCAL_ARCHIVE" "${LOCAL_TO_BACKUP[@]}" || { echo "Error: Failed to create archive." >&2; exit 1; }
else
    tar -czf "$LOCAL_ARCHIVE" "${LOCAL_TO_BACKUP[@]}" || { echo "Error: Failed to create archive." >&2; exit 1; }
fi

if [[ "$VERBOSE" -eq 1 ]]; then
    echo "Local backups complete."
fi

if [[ "$VERBOSE" -eq 1 ]]; then
    echo "Creating remote backups..."
fi

if [[ "$VERBOSE" -eq 1 ]]; then
    rsync -avz --progress --delete "$REMOTE_TO_BACKUP" "$REMOTE_ARCHIVE_DIR" || { 
		    echo "Error: Failed to sync backups to Nextcloud." >&2; exit 1; 
	    }
else
    rsync -az --progress --delete "$REMOTE_TO_BACKUP" "$REMOTE_ARCHIVE_DIR" || { 
		    echo "Error: Failed to sync backups to Nextcloud." >&2; exit 1; 
	    }
fi

if [[ "$VERBOSE" -eq 1 ]]; then
    echo "Remote backups complete."
fi

if [[ "$VERBOSE" -eq 1 ]]; then
    echo "Backup complete."
fi 
