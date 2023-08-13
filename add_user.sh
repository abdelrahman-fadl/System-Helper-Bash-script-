#!/bin/bash

read -p "Enter username to add: " username
useradd "$username"

if [ $? -eq 0 ]; then
    echo "User '$username' added successfully."

    # Prompt for additional options
    while true; do
        echo "Select an option to configure the user:"
        echo "1- Add comment"
        echo "2- Set GID"
        echo "3- Set additional groups"
        echo "4- Set UID"
        echo "5- Set password"
        echo "6- Exit"

        read -p "Enter your choice: " user_choice

        case $user_choice in
            1)
                read -p "Enter comment for the user: " comment
                usermod -c "$comment" "$username"
                ;;
            2)
                read -p "Enter GID for the user: " gid
                usermod -g "$gid" "$username"
                ;;
            3)
                read -p "Enter additional groups (comma-separated) for the user: " groups
                IFS=',' read -r -a groups_array <<< "$groups"
                usermod -aG "${groups_array[@]}" "$username"
                ;;
            4)
                read -p "Enter UID for the user: " uid
                usermod -u "$uid" "$username"
                ;;
            5)
                passwd "$username" # Set password for the new user
                ;;
            6)
                echo "Exiting..."
                exit 0
                ;;
            *)
                echo "Invalid choice. Please select a valid option."
                ;;
        esac

        echo 
    done
else
    echo "Failed to add user '$username'."
fi
