#!/bin/bash

# Function to display the header
print_header() {
    echo "=========================================="
    echo "   $1"
    echo "=========================================="
}

# Total CPU usage
cpu_usage() {
    print_header "CPU Usage"
    # Displays the CPU idle percentage and calculates the usage
    CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    echo "CPU Usage: $CPU_IDLE%"
    echo
}

# Total Memory usage
memory_usage() {
    print_header "Memory Usage"
    # Get memory usage using free and calculate used percentage
    MEMORY_TOTAL=$(free -m | awk '/^Mem:/ {print $2}')
    MEMORY_USED=$(free -m | awk '/^Mem:/ {print $3}')
    MEMORY_FREE=$(free -m | awk '/^Mem:/ {print $4}')
    MEMORY_PERCENT=$(awk "BEGIN {printf \"%.2f\", ($MEMORY_USED/$MEMORY_TOTAL)*100}")
    echo "Total Memory: $MEMORY_TOTAL MB"
    echo "Used Memory:  $MEMORY_USED MB"
    echo "Free Memory:  $MEMORY_FREE MB"
    echo "Memory Usage: $MEMORY_PERCENT%"
    echo
}

# Total Disk usage
disk_usage() {
    print_header "Disk Usage"
    # Get disk usage using df
    DISK_TOTAL=$(df -h --total | grep 'total' | awk '{print $2}')
    DISK_USED=$(df -h --total | grep 'total' | awk '{print $3}')
    DISK_FREE=$(df -h --total | grep 'total' | awk '{print $4}')
    DISK_PERCENT=$(df -h --total | grep 'total' | awk '{print $5}')
    echo "Total Disk Space: $DISK_TOTAL"
    echo "Used Disk Space:  $DISK_USED"
    echo "Free Disk Space:  $DISK_FREE"
    echo "Disk Usage:       $DISK_PERCENT"
    echo
}

# Top 5 processes by CPU usage
top_cpu_processes() {
    print_header "Top 5 Processes by CPU Usage"
    # Use ps to find the top 5 CPU consuming processes
    ps -eo pid,comm,%cpu --sort=-%cpu | head -6
    echo
}

# Top 5 processes by memory usage
top_memory_processes() {
    print_header "Top 5 Processes by Memory Usage"
    # Use ps to find the top 5 memory consuming processes
    ps -eo pid,comm,%mem --sort=-%mem | head -6
    echo
}

# Stretch goal stats (OS version, Uptime, Load Average, Logged in Users, Failed logins)
extra_stats() {
    print_header "Additional System Information"

    # OS version
    echo "OS Version:"
    lsb_release -a 2>/dev/null || cat /etc/*release
    echo

    # Uptime
    echo "Uptime:"
    uptime
    echo

    # Load average
    echo "Load Average:"
    cat /proc/loadavg
    echo

    # Logged in users
    echo "Logged in users:"
    who
    echo

    # Failed login attempts (requires root privileges)
    if [ $(id -u) -eq 0 ]; then
        echo "Failed Login Attempts:"
        lastb | head -5
    else
        echo "Failed Login Attempts: (run as root to view this)"
    fi
    echo
}

# Main function to call all other functions
main() {
    cpu_usage
    memory_usage
    disk_usage
    top_cpu_processes
    top_memory_processes
    extra_stats
}

# Execute the main function
main
