#! /usr/bin/env bash

# Point hh to global history
export HISTFILE=~/.bash_history.global

# Reverse search
hh

# Restore local history
export HISTFILE=~/.bash_history 
