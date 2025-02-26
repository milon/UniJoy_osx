#!/bin/bash

# Variables
REPO_URL="https://github.com/milon/UniJoy_osx.git"
KEYBOARD_LAYOUTS_DIR="/Library/Keyboard Layouts"
TMP_DIR=$(mktemp -d)

# Clone the repository
echo "Cloning UniJoy_osx repository..."
git clone "$REPO_URL" "$TMP_DIR"

# Check if the repository was cloned successfully
if [[ ! -d "$TMP_DIR" ]]; then
    echo "Error: Failed to clone the repository."
    exit 1
fi

# Copy the keylayout and icon files to the Keyboard Layouts directory
echo "Installing Bengali keyboard layout..."
sudo cp "$TMP_DIR/UniJoy.keylayout" "$KEYBOARD_LAYOUTS_DIR/"
sudo cp "$TMP_DIR/UniJoy.icns" "$KEYBOARD_LAYOUTS_DIR/"

# Clean up temporary files
rm -rf "$TMP_DIR"

# Notify the user to manually add the keyboard layout in System Preferences
echo "Installation complete!"
echo "Please follow these steps to enable the Bengali keyboard layout:"
echo "1. Open System Preferences -> Keyboard -> Input Sources."
echo "2. Click the '+' button at the bottom left corner."
echo "3. Select 'Other' from the list and choose 'বাংলা'."
echo "4. (Optional) Set a keyboard shortcut from the 'Shortcut' tab."

exit 0