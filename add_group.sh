#!/bin/bash

read -p "Enter group name to add: " groupname
groupadd "$groupname"
if [ $? -eq 0 ]; then
    echo "Group '$groupname' added successfully."
else
    echo "Failed to add group '$groupname'."
fi
