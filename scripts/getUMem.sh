#!/bin/sh

ps axch -o cmd:15,%mem --sort=-%mem | head | sed 's/$/ %/'
