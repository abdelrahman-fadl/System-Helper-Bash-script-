#!/bin/bash

# Check if the user is root (uid 0)
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root. Please use 'sudo' to execute it."
    exit 1
fi

while true; do
    echo "			welcome to my project"
    echo "Choose an option:"
    echo "1- Add user"
    echo "2- Modify user"
    echo "3- Delete user"
    echo "4- List users"
    echo "5- Add group"
    echo "6- Delete group"
    echo "7- List groups"
    echo "8- About this script"
    echo "0- Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1)
            ./add_user.sh
            ;;
        2)
            ./modify_user.sh
            ;;
        3)
            ./del_user.sh
            ;;
        4)
            ./list_user.sh
            ;;
        5)
            ./add_group.sh
            ;;
        6)
            ./del_group.sh
            ;;
        7)
            ./list_group.sh
            ;;
        8)
            ./about.sh
            ;;
        0)
            echo "Thanks for using our script"
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac

    echo 
done
