#!/bin/bash

# Colors in the terminal

## Some raw output

echo "This is plain text"

tput setaf 1; echo "this is red text"

echo "$(tput setaf 1)Red text $(tput setab 7)and white background$(tput sgr 0)"

echo "This is plain again"

## Define some methods

red()    { echo "$(tput setaf 1)$@$(tput sgr 0)" ; }
green()  { echo "$(tput setaf 2)$@$(tput sgr 0)" ; }
yellow() { echo "$(tput setaf 3)$@$(tput sgr 0)" ; }
blue()   { echo "$(tput setaf 4)$@$(tput sgr 0)" ; }
bold() { echo "$(tput bold)$@$(tput sgr 0)" ; }
bold-red() { echo "$(tput bold)$(tput setaf 1)$@$(tput sgr 0)" ; }
bold-green() { echo "$(tput bold)$(tput setaf 2)$@$(tput sgr 0)" ; }
bold-yellow() { echo "$(tput bold)$(tput setaf 3)$@$(tput sgr 0)" ; }
bold-blue() { echo "$(tput bold)$(tput setaf 4)$@$(tput sgr 0)" ; }

## Use the methods

yellow "$(hostname)"

bold-blue "$(hostname)"

green "Is this green?"

echo "This?"

green and what about this?

red $(date)

echo here

bold-red "the date is $(date)"

green "$(date)"

echo $(date)

## Notes

# Num  Colour    #define         R G B
# 0    black     COLOR_BLACK     0,0,0
# 1    red       COLOR_RED       1,0,0
# 2    green     COLOR_GREEN     0,1,0
# 3    yellow    COLOR_YELLOW    1,1,0
# 4    blue      COLOR_BLUE      0,0,1
# 5    magenta   COLOR_MAGENTA   1,0,1
# 6    cyan      COLOR_CYAN      0,1,1
# 7    white     COLOR_WHITE     1,1,1

# tput bold    # Select bold mode
# tput dim     # Select dim (half-bright) mode
# tput smul    # Enable underline mode
# tput rmul    # Disable underline mode
# tput rev     # Turn on reverse video mode
# tput smso    # Enter standout (bold) mode
# tput rmso    # Exit standout mode

# tput sgr0    # Reset text format to the terminal's default

