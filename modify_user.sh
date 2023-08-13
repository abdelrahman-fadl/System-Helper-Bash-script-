#!/bin/bash

read -p "Enter username to modify: " username

# Check if the user exists
if id "$username" &>/dev/null; then
    echo "Select an option to modify the user '$username':"
    echo "1- Modify comment"
    echo "2- Modify GID"
    echo "3- Modify additional groups"
    echo "4- Modify UID"
    echo "5- Set password"
    echo "0- Exit"

    while true; do
        read -p "Enter your choice: " user_choice

        case $user_choice in
            1)
                read -p "Enter new comment for the user: " comment
                usermod -c "$comment" "$username"
		echo "comment '$comment' added successfully"
                ;;
            2)
                read -p "Enter new GID for the user: " gid
                usermod -g "$gid" "$username"
                echo "group ID '$gid' added successfully"
                ;;
            3)
                read -p "Enter new additional groups (comma-separated) for the user: " groups
                IFS=',' read -r -a groups_array <<< "$groups"
                usermod -G "${groups_array[@]}" "$username"
                echo "groups  added successfully"
                ;;
            4)
                read -p "Enter new UID for the user: " uid
                usermod -u "$uid" "$username"
                echo "user ID '$uid' added successfully"
                ;;
            5)
                passwd "$username" # Set password for the user
                echo "password  added successfully"
                ;;
            0)
		echo "user '$username' modified successfully"
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
    echo "User '$username' not found. Cannot modify non-existent user."
fi
