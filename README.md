# Server Performance Stats Script

This project provides a script to analyze basic server performance stats on any Linux server. It gives you essential server information such as CPU usage, memory usage, disk usage, and top processes. Additionally, it can display OS version, uptime, load average, logged-in users, and failed login attempts.

## Features

- **Total CPU Usage**: Displays the current CPU usage percentage.
- **Total Memory Usage**: Shows total, used, and free memory along with usage percentage.
- **Total Disk Usage**: Provides total, used, and free disk space with usage percentage.
- **Top 5 Processes by CPU Usage**: Lists the top 5 processes consuming the most CPU.
- **Top 5 Processes by Memory Usage**: Lists the top 5 processes consuming the most memory.
- **Optional Stats**: Includes additional information such as OS version, uptime, load average, logged-in users, and failed login attempts (requires root privileges).

## Project Page

Visit the project page for more information: [Server Stats Project](https://roadmap.sh/projects/server-stats)

## Requirements

- A Linux-based system (Ubuntu, CentOS, etc.)
- Bash shell
- Root privileges (optional) for some advanced stats (failed login attempts)

## How to Run the Script

1. **Clone or Download the Script**

   Clone the repository or download the `server-stats.sh` file to your Linux server.

   ```bash
   git clone https://github.com/shaikahmadnawaz/server-stats.git
   cd server-stats
   ```

````

2. **Make the Script Executable**

   Give execution permission to the script:

   ```bash
   chmod +x server-stats.sh
   ```

3. **Run the Script**

   Execute the script by running:

   ```bash
   ./server-stats.sh
   ```

   The script will display the CPU usage, memory usage, disk usage, and the top 5 processes by CPU and memory usage, as well as optional system stats (OS version, uptime, etc.).

4. **Optional: Run as Root (for Failed Login Attempts)**

   For security-related stats such as failed login attempts, run the script as root:

   ```bash
   sudo ./server-stats.sh
   ```

## Sample Output

```
==========================================
   CPU Usage
==========================================
CPU Usage: 23.5%

==========================================
   Memory Usage
==========================================
Total Memory: 16000 MB
Used Memory:  8000 MB
Free Memory:  8000 MB
Memory Usage: 50.00%

==========================================
   Disk Usage
==========================================
Total Disk Space: 500G
Used Disk Space:  250G
Free Disk Space:  250G
Disk Usage:       50%

==========================================
   Top 5 Processes by CPU Usage
==========================================
 PID  COMMAND    %CPU
 1234 process1   45.0
 5678 process2   30.5
 ...

==========================================
   Top 5 Processes by Memory Usage
==========================================
 PID  COMMAND    %MEM
 1234 process1   15.0
 5678 process2   12.5
 ...

==========================================
   Additional System Information
==========================================
OS Version:
Ubuntu 20.04.3 LTS

Uptime:
 10:15:32 up 3 days,  2:45,  3 users,  load average: 0.10, 0.30, 0.20

Load Average:
0.10 0.30 0.20

Logged in users:
user1   pts/0        2023-10-13 08:45

Failed Login Attempts:
username  pts/1     2023-10-12 21:11
```

### Key Sections:

1. **Project Page**: Provides a link to the project page URL as requested.
2. **How to Run**: Step-by-step instructions for setting up and running the script.
3. **Optional Stats**: Mentions the requirement of root privileges for failed login attempts.
````
