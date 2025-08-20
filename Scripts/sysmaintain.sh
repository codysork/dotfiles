#!/bin/bash
# system-maintenance.sh
# Automated system maintenance script using AI shell assistant
# Created by Cody Sork <codysork@gmail.com>
# Last Modified: 2023-04-13

#------------------------------------------------------------------------------#
#                               # Settings #                                   #
#------------------------------------------------------------------------------#

# General Settings
SCRIPT_DIR="${SCRIPT_DIR:-/home/cody/Scripts/sysmaintain}"
SCRIPT_LOG_FILE="${SCRIPT_LOG_FILE:-$SCRIPT_DIR/sysmaintain.log}"

# Log Checking Settings
SYSTEM_LOG_FILES=(
    "/var/log/pacman.log"
    "/var/log/haskell-register.log"
    "/var/log/cups/error_log"
    "/var/log/Xorg.0.log"
)

# Backup Settings
CONFIG_MANAGER="${CONFIG_MANAGER:-/usr/bin/etckeeper commit -m 'Automated backup'}"
PACKAGE_MANGER="pacman"
LIST_PACKAGES_COMMAND="${LIST_PACKAGES_COMMAND:-$PACKAGE_MANGER -Qq}"
PKGLIST_FILE="${PKGLIST_FILE:-$SCRIPT_DIR/pkglist.txt}"
REMOTE_BACKUP_SCRIPT="${REMOTE_BACKUP_SCRIPT:-/home/cody/Scripts/backup.sh}"

# System Update Settings

#------------------------------------------------------------------------------#
#                               # Script #                                     #
#------------------------------------------------------------------------------#

# Command-line arguments
while (( "$#" )); do
    case $1 in
        -h|--help)
            echo "Usage: $0 [-h|--help] [-s|--skip-log-files]"
            echo "This script checks for errors in the system logs and journal."
            echo "Options:"
            echo "  -h, --help            Show this help message and exit."
            echo "  --noconfirm           Skip confirmation prompts."
            echo "  --skip-log-files  Skip log file checks."
            echo "  --skip-journal    Skip journal checks."
            echo "  --skip--error-checks  Skips all error checks, including log file and journal checks."
            echo "  --skip-config-manager  Skip running the configuration manager."
            echo "  --skip-pkglist     Skip updating the package list."
            echo "  --skip-backups     Skip backups."
            echo "  --skip-report      Skip creating a report."
            echo "  --dry-run          Perform a dry run of the script."
            exit 0
            ;;
        --noconfirm)
            NO_CONFIRM=1
            shift
            ;;
        *)
            echo "Invalid option: $1" >&2
            exit 1
            ;;
    esac
done

#------------------------------------------------------------------------------#
#                               # Functions #                                  #
#------------------------------------------------------------------------------#

# Utility Functions ------------------------------------------------------------

ensure_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "This script must be run as root."
        exit 1
    fi
}

# Error Checks -----------------------------------------------------------------

# Setup script directory
setup_script_directory() {
    # Exit the script on command failure
    set -e

    # Ensure that the script directory exists
    if [ ! -d "$SCRIPT_DIR" ]; then
        echo "INFO: Creating script directory..."
        mkdir -p "$SCRIPT_DIR"
        echo "INFO: Script directory created."
    fi
}

# Check for failed services in systemd
check_failed_services() {
    echo "INFO: Checking for failed services..."
    local num_failed_services
    num_failed_services=$(systemctl --failed | grep -ioP '\d+(?= loaded units listed)' | head -n 1)
    if [ "$num_failed_services" -eq 0 ]; then
        echo "INFO: No failed services found."
    else
        echo "WARNING: Detected $num_failed_services failed services."
        systemctl --failed | sed '1d'
        echo "ACTION: Please check the logs for more information."
    fi
}

# Find errors in system log files and log them
check_system_log_errors() {
    echo "INFO: Logging errors from system log files..."

    if [ -f "$SCRIPT_LOG_FILE" ]; then
        echo "INFO: Clearing log file for fresh run..."
        echo "" > "$SCRIPT_LOG_FILE"
    else
        echo "INFO: Creating log file..."
        touch "$SCRIPT_LOG_FILE"
    fi
   
    echo "[Errors Found]" >> "$SCRIPT_LOG_FILE"
    echo "" >> "$SCRIPT_LOG_FILE"
    echo "INFO: Writing errors to $SCRIPT_LOG_FILE..."
    set +e
    for log_file in "${SYSTEM_LOG_FILES[@]}"; do
        grep -i "ERROR" "$log_file" >> "$SCRIPT_LOG_FILE"
    done
    set -e
    echo "INFO: Errors logged to $SCRIPT_LOG_FILE."
}

# Find errors in the systemd journal and log them
check_journal_errors() {
    echo "INFO: Checking for errors in the journal..."
    set +e
    local errors_in_journal
    errors_in_journal=$(journalctl -p 3 -xb --priority=err --no-pager | grep -ic "error")

    if [ "$errors_in_journal" -eq 0 ]; then
        echo "INFO: No errors found."
    else
        echo "WARNING: Detected $errors_in_journal errors in the journal."
        echo "ACTION: Please check the journal for more information."
        echo "INFO: Saving the list of errors to $SCRIPT_LOG_FILE..."
        echo "[Errors Found]" > "$SCRIPT_LOG_FILE"
        journalctl -b --priority=err --no-pager | grep -i "error" >> "$SCRIPT_LOG_FILE"
        echo "INFO: List of errors saved to $SCRIPT_LOG_FILE."
    fi
    set -e
}

# Backup -----------------------------------------------------------------------

# Run configuration manager
run_config_manager() {
    echo "INFO: Running configuration manager..."
    set +e
    # Get status of automated backup
    local status
    status=$($CONFIG_MANAGER commit --dry-run | grep -i "nothing to commit, working tree clean")
    if [ "$status" == "nothing to commit, working tree clean" ]; then
        echo "INFO: No configuration changes detected."
    else
        echo "INFO: Running backups..."
        $CONFIG_MANAGER
    fi
    set -e
}

list_packages() {

    # Check if package list file exists, if not create itj
    if [ ! -f "$PKGLIST_FILE" ]; then
        echo "INFO: Creating package list file..."
        touch "$PKGLIST_FILE"
    fi

    echo "INFO: Saving $PACKAGE_MANGER package list to $PKGLIST_FILE..."
    $LIST_PACKAGES_COMMAND > "$PKGLIST_FILE"
}

remote_backup(){
    set +e
    if [ -x "$REMOTE_BACKUP_SCRIPT" ]; then
        echo "INFO: Running remote backup script..."
        sh "$REMOTE_BACKUP_SCRIPT"
    else
        echo "ERROR: Remote backup script not found or not executable."
    fi
    set -e
}

timeshift_snapshot() {
    if command -v timeshift > /dev/null && timeshift --check > /dev/null; then
        if [ "${NO_CONFIRM:-0}" -lt 1 ]; then
            read -r -p "Do you want to create a timeshift snapshot? (y/n): " response
        else
            response="y"
        fi
        if [[ $response =~ ^[yY](eE|[eE][sS])?$ ]]; then
            echo "INFO: Creating timeshift snapshot..."
            timeshift --create --comment "Automated backup"
        else
            echo "INFO: No snapshot created."
        fi
    fi
}

# System Updates ---------------------------------------------------------------


#------------------------------------------------------------------------------#
#                               # Main Logic #                                 #
#------------------------------------------------------------------------------#

# Setup
ensure_sudo
setup_script_directory

# Error Checks
echo "INFO: Checking for system errors..."
check_failed_services
check_system_log_errors
check_journal_errors
echo "INFO: System errors checked."

# Backup
echo "INFO: Running backups..."
run_config_manager
list_packages
remote_backup
# TODO: dotfile_backup
timeshift_snapshot
echo "INFO: Backups completed."

# System Updates
