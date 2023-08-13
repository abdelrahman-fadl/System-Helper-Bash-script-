#!/bin/bash

read -p "Enter username to delete: " username
userdel -r "$username" # Delete user and anything related with it
if [ $? -eq 0 ]; then
    echo "User '$username' deleted successfully."
else
    echo "Failed to delete user '$username'."
fi
