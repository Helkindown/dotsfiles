#!/bin/sh

free="$(df -lht ext4 | awk '/^\/dev\// { print $4 }')"

echo $free
echo $free
