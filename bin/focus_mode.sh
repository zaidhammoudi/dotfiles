#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title enable focused mode
# @raycast.mode silent

# Optional parameters:
# @raycast.author Zaid Hammoudi
# @raycast.authorURL https://github.com/zaidhammoudi
# @raycast.description enable focused mode
# @raycast.packageName Developer Utils
# @raycast.icon 🎧


# Define the path to the hosts file
HOSTS_FILE="/etc/hosts"

# List of entries to ensure in the hosts file
declare -a ENTRIES=(
    "127.0.0.1   www.linkedin.com"
    "127.0.0.1   news.ycombinator.com"
    "127.0.0.1   news.ycombinator.com"
    "127.0.0.1   www.facebook.com"
)

# Function to add an entry if it's not already in the file
add_if_not_exists() {
    local entry=$1
    if ! grep -qF -- "$entry" "$HOSTS_FILE"; then
        echo "Adding $entry to $HOSTS_FILE"
        echo "$entry" | sudo tee -a "$HOSTS_FILE" > /dev/null
    fi
}

# Ensure each entry is in the hosts file
for entry in "${ENTRIES[@]}"; do
    add_if_not_exists "$entry"
done

echo "Hosts file update complete."

