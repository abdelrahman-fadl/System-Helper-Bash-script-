#!/bin/bash

echo "List of users:"
cut -d: -f1 /etc/passwd
