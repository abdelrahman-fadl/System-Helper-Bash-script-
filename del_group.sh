#!/bin/bash

read -p "Enter group name to delete: " groupname
groupdel "$groupname"
if [ $? -eq 0 ]; then
    echo "Group '$groupname' deleted successfully."
else
    echo "Failed to delete group '$groupname'."
fi
