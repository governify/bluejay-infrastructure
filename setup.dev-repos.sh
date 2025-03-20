#!/bin/bash
# USE
# chmod +x setup.dev.sh
# ./setup.dev.sh


# Target directory for cloning repositories (one level up)
TARGET_DIR="../"

# List of repositories
REPOS=(
    "https://github.com/governify/render"
    "https://github.com/governify/collector-events"
    "https://github.com/governify/TPA-Manager"
    "https://github.com/governify/join-bluejay"
    "https://github.com/governify/scope-manager"
    "https://github.com/governify/director"
    "https://github.com/governify/dashboard"
    "https://github.com/governify/registry"
    "https://github.com/governify/reporter"
    "https://github.com/governify/assets-bluejay"
    "https://github.com/governify/assets-manager"
)

# Create the target directory if it does not exist
mkdir -p "$TARGET_DIR"

# Clone each repository if it does not already exist
for REPO in "${REPOS[@]}"; do
    REPO_NAME=$(basename "$REPO" .git)
    if [ -d "$TARGET_DIR/$REPO_NAME" ]; then
        echo "Repository '$REPO_NAME' already exists, skipping..."
    else
        echo "Cloning '$REPO_NAME'..."
        git clone "$REPO" "$TARGET_DIR/$REPO_NAME"
    fi
done

echo "✅ All repositories are cloned!"
