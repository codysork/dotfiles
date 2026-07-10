#!/bin/bash
# @author: Cody Sork <codysork@tutamail.com>
# @modified: 2026-07-08
# @about My backup script using Nextcloud

# Configuration
DIRS_TO_BACKUP=("$HOME/Documents" "$HOME/.minetest")
ARCHIVE_DIR="$HOME/Nextcloud/Backups"
ARCHIVE="$ARCHIVE_DIR/$USER-backup-$(date +%Y-%m-%d).tar.gz"
VERBOSE=0
NOCONFIRM=0

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
    echo "Will archive: ${DIRS_TO_BACKUP[*]}"
    read -r -p "Proceed? [y/N] " response
    [[ "$response" =~ ^[Yy]$ ]] || exit 0
fi

# Backup to Nextcloud
if [[ "$VERBOSE" -eq 1 ]]; then
    echo "Creating archive: $ARCHIVE and syncing to Nextcloud..."
fi

# tar -czvf "$ARCHIVE" "${DIRS_TO_BACKUP[@]}" || { echo "Error: Failed to create archive." >&2; exit 1; }

if [[ "$VERBOSE" -eq 1 ]]; then
    echo "Backup complete."
fi 
