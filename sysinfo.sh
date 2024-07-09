#!/bin/bash

# Function to get and print system info
print_info() {
    USERNAME=$(whoami)
    HOSTNAME=$(hostname)
    KERNEL=$(uname -r)
    OS=$(uname -o)
    UPTIME=$(uptime -p)
    MEMORY=$(free -h | awk '/^Mem/ {print $3 "/" $2}')
    DISK=$(df -h | awk '$NF == "/" {print $3 " used / " $2 " total (" $5 " used)"}')
    CPU_LOAD=$(top -bn1 | awk '/Cpu(s)/ {print 100 - $8"%"}')

    clear

    # Colors
    label_color="\e[1;35m"  # Purple color for labels
    info_color="\e[0;33m"   # Orange color for information
    reset_color="\e[0m"
    
    echo -e "
===========================================================================================
${label_color}     _________                                      Username:\t${info_color}$USERNAME${reset_color}
${label_color}    / ======= \\                                     Hostname:\t${info_color}$HOSTNAME${reset_color}
${label_color}   / __________\\                                    Kernel:\t\t${info_color}$KERNEL${reset_color}
${label_color}  | ___________ |                                   OS:\t\t${info_color}$OS${reset_color}
${label_color}  | | -       | |                                  Uptime:\t\t${info_color}$UPTIME${reset_color}
${label_color}  | |         | |                                  Memory:\t\t${info_color}$MEMORY${reset_color}
${label_color}  | |_________| |________________________          Disk:\t\t${info_color}$DISK${reset_color}
${label_color}  \\=____________/   Garv Kamra           )          CPU Load:\t${info_color}$CPU_LOAD${reset_color}
${label_color}  / \"\"\"\"\"\"\"\"\"\"\"\" \\                                    ${reset_color}
${label_color} / ::::::::::::: \\                               ${reset_color}
${label_color}(_________________)                                 ${reset_color}
===========================================================================================
"
}

# Main
print_info
