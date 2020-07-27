#!/bin/sh

free="$(df -lht ext4 | awk '/^\/dev\/sda/ { print $4 }')"

echo $free
echo $free
