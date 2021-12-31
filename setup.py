#!/bin/python3

import os
import sys
import subprocess

# Copy directory from dotfiles/.config to ~/.config
subprocess.run(["cp", "-r", ".config/*", "~/.config/"])
