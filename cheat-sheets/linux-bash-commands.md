# Linux/Bash Commands Reference Table

## File and Directory Operations

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `ls` | Lists directory contents | `ls -la` |
| `ls -l` | Lists in long format with permissions | `ls -l /home` |
| `ls -a` | Lists all files including hidden | `ls -a ~/.config` |
| `ls -h` | Lists with human-readable sizes | `ls -lh /var/log` |
| `ls -R` | Lists recursively | `ls -R /etc` |
| `cd` | Changes directory | `cd /var/www` |
| `cd ~` | Changes to home directory | `cd ~` |
| `cd -` | Changes to previous directory | `cd -` |
| `pwd` | Prints working directory | `pwd` |
| `mkdir` | Creates directory | `mkdir new_folder` |
| `mkdir -p` | Creates parent directories as needed | `mkdir -p /path/to/nested/dir` |
| `rmdir` | Removes empty directory | `rmdir old_folder` |
| `rm` | Removes files | `rm file.txt` |
| `rm -r` | Removes directories recursively | `rm -r folder/` |
| `rm -f` | Forces removal without confirmation | `rm -f locked_file` |
| `rm -rf` | Force removes directories recursively | `rm -rf old_project/` |
| `cp` | Copies files | `cp source.txt dest.txt` |
| `cp -r` | Copies directories recursively | `cp -r source_dir/ dest_dir/` |
| `cp -p` | Preserves file attributes | `cp -p important.conf backup.conf` |
| `mv` | Moves/renames files or directories | `mv old_name.txt new_name.txt` |
| `touch` | Creates empty file or updates timestamp | `touch newfile.txt` |
| `ln` | Creates hard link | `ln source.txt hardlink.txt` |
| `ln -s` | Creates symbolic link | `ln -s /path/to/source symlink` |
| `readlink` | Shows symbolic link target | `readlink -f symlink` |

## File Content and Searching

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `cat` | Displays file content | `cat file.txt` |
| `less` | Views file content page by page | `less large_log.txt` |
| `more` | Views file content page by page (basic) | `more file.txt` |
| `head` | Shows first lines of file | `head -n 20 file.txt` |
| `tail` | Shows last lines of file | `tail -n 50 log.txt` |
| `tail -f` | Follows file updates in real-time | `tail -f /var/log/syslog` |
| `grep` | Searches text patterns | `grep "error" log.txt` |
| `grep -i` | Case-insensitive search | `grep -i "ERROR" log.txt` |
| `grep -r` | Recursive search in directories | `grep -r "TODO" ./src/` |
| `grep -v` | Inverts match (exclude lines) | `grep -v "debug" log.txt` |
| `grep -n` | Shows line numbers | `grep -n "function" script.js` |
| `grep -E` | Extended regex (egrep) | `grep -E "error|warning" log.txt` |
| `find` | Finds files and directories | `find /home -name "*.txt"` |
| `find -type` | Finds by type (f=file, d=directory) | `find . -type d -name "test*"` |
| `find -mtime` | Finds by modification time | `find . -mtime -7` |
| `find -size` | Finds by size | `find . -size +100M` |
| `find -exec` | Executes command on found files | `find . -name "*.log" -exec rm {} \;` |
| `locate` | Finds files using database | `locate filename.txt` |
| `which` | Shows command location | `which python` |
| `whereis` | Shows binary, source, and manual locations | `whereis git` |

## File Permissions and Ownership

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `chmod` | Changes file permissions | `chmod 755 script.sh` |
| `chmod +x` | Adds execute permission | `chmod +x script.sh` |
| `chmod -R` | Changes permissions recursively | `chmod -R 644 /var/www/html/` |
| `chmod u+w` | Adds write permission for user | `chmod u+w file.txt` |
| `chmod g-w` | Removes write permission for group | `chmod g-w shared.txt` |
| `chown` | Changes file ownership | `chown user:group file.txt` |
| `chown -R` | Changes ownership recursively | `chown -R www-data:www-data /var/www/` |
| `chgrp` | Changes group ownership | `chgrp developers project/` |
| `umask` | Sets default permissions | `umask 022` |
| `stat` | Shows file status and permissions | `stat file.txt` |

## Text Processing and Manipulation

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `echo` | Prints text to stdout | `echo "Hello World"` |
| `echo -n` | Prints without newline | `echo -n "Enter name: "` |
| `echo -e` | Enables escape sequences | `echo -e "Line1\nLine2"` |
| `printf` | Formats and prints text | `printf "Name: %s Age: %d\n" "John" 25` |
| `sed` | Stream editor for text manipulation | `sed 's/old/new/g' file.txt` |
| `sed -i` | Edits file in-place | `sed -i 's/error/warning/g' log.txt` |
| `sed -n` | Suppresses automatic printing | `sed -n '10,20p' file.txt` |
| `awk` | Pattern scanning and processing | `awk '{print $1, $3}' data.txt` |
| `awk -F` | Sets field separator | `awk -F',' '{print $2}' data.csv` |
| `cut` | Extracts columns from text | `cut -d',' -f2 data.csv` |
| `cut -c` | Cuts by character position | `cut -c1-10 file.txt` |
| `sort` | Sorts lines | `sort file.txt` |
| `sort -n` | Sorts numerically | `sort -n numbers.txt` |
| `sort -r` | Sorts in reverse order | `sort -r file.txt` |
| `sort -k` | Sorts by specific field | `sort -k2,2 data.txt` |
| `uniq` | Removes duplicate lines | `uniq sorted_file.txt` |
| `uniq -c` | Counts occurrences | `uniq -c sorted_file.txt` |
| `tr` | Translates characters | `tr 'a-z' 'A-Z' < file.txt` |
| `tr -d` | Deletes characters | `tr -d '\r' < windows_file.txt` |
| `wc` | Counts lines, words, characters | `wc -l file.txt` |
| `wc -w` | Counts words | `wc -w document.txt` |

## Process Management

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `ps` | Shows running processes | `ps aux` |
| `ps -ef` | Shows all processes (full format) | `ps -ef | grep nginx` |
| `ps -u` | Shows processes for specific user | `ps -u username` |
| `top` | Shows real-time process information | `top` |
| `htop` | Interactive process viewer | `htop` |
| `pgrep` | Finds process IDs by name | `pgrep firefox` |
| `kill` | Terminates process by PID | `kill 1234` |
| `kill -9` | Force kills process | `kill -9 1234` |
| `killall` | Kills processes by name | `killall firefox` |
| `pkill` | Kills processes by pattern | `pkill -f "python script.py"` |
| `jobs` | Lists background jobs | `jobs` |
| `bg` | Sends job to background | `bg %1` |
| `fg` | Brings job to foreground | `fg %1` |
| `nohup` | Runs command immune to hangups | `nohup long_script.sh &` |
| `nice` | Runs command with modified priority | `nice -n 10 heavy_process` |
| `renice` | Changes process priority | `renice -n 5 -p 1234` |
| `&` | Runs command in background | `long_script.sh &` |
| `Ctrl+Z` | Suspends current process | `Ctrl+Z` |
| `Ctrl+C` | Interrupts current process | `Ctrl+C` |

## System Information and Monitoring

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `df` | Shows disk space usage | `df -h` |
| `df -i` | Shows inode usage | `df -i` |
| `du` | Shows directory space usage | `du -sh /var/log/` |
| `du -a` | Shows all files sizes | `du -ah /home/user/` |
| `free` | Shows memory usage | `free -h` |
| `free -m` | Shows memory in megabytes | `free -m` |
| `uptime` | Shows system uptime and load | `uptime` |
| `uname` | Shows system information | `uname -a` |
| `hostname` | Shows system hostname | `hostname` |
| `whoami` | Shows current username | `whoami` |
| `id` | Shows user and group IDs | `id username` |
| `date` | Shows/sets system date | `date +"%Y-%m-%d %H:%M:%S"` |
| `cal` | Shows calendar | `cal 2024` |
| `lscpu` | Shows CPU information | `lscpu` |
| `lsblk` | Shows block devices | `lsblk` |
| `lsusb` | Shows USB devices | `lsusb` |
| `lspci` | Shows PCI devices | `lspci` |
| `dmesg` | Shows kernel messages | `dmesg | tail -50` |
| `journalctl` | Shows systemd logs | `journalctl -u nginx` |

## Networking

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `ping` | Tests network connectivity | `ping -c 4 google.com` |
| `traceroute` | Shows route to destination | `traceroute google.com` |
| `netstat` | Shows network connections | `netstat -tuln` |
| `ss` | Shows socket statistics (modern netstat) | `ss -tuln` |
| `ifconfig` | Shows/configures network interfaces | `ifconfig eth0` |
| `ip` | Shows/manipulates routing and network | `ip addr show` |
| `ip route` | Shows routing table | `ip route show` |
| `wget` | Downloads files from web | `wget https://example.com/file.zip` |
| `wget -O` | Downloads with custom filename | `wget -O custom.zip https://example.com/file.zip` |
| `curl` | Transfers data from/to servers | `curl https://api.example.com/data` |
| `curl -O` | Downloads file keeping remote name | `curl -O https://example.com/file.zip` |
| `curl -X` | Specifies HTTP method | `curl -X POST -d "data" https://api.example.com` |
| `scp` | Securely copies files over SSH | `scp file.txt user@remote:/path/` |
| `rsync` | Synchronizes files/directories | `rsync -avz source/ destination/` |
| `ssh` | Connects to remote system | `ssh user@hostname` |
| `ssh -p` | Connects using specific port | `ssh -p 2222 user@hostname` |
| `nslookup` | Queries DNS | `nslookup google.com` |
| `dig` | DNS lookup tool | `dig google.com` |
| `host` | DNS lookup utility | `host google.com` |

## Archive and Compression

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `tar -cvf` | Creates tar archive | `tar -cvf archive.tar folder/` |
| `tar -xvf` | Extracts tar archive | `tar -xvf archive.tar` |
| `tar -czvf` | Creates gzipped tar archive | `tar -czvf archive.tar.gz folder/` |
| `tar -xzvf` | Extracts gzipped tar archive | `tar -xzvf archive.tar.gz` |
| `tar -cjvf` | Creates bzipped tar archive | `tar -cjvf archive.tar.bz2 folder/` |
| `tar -tf` | Lists tar contents | `tar -tf archive.tar` |
| `gzip` | Compresses file | `gzip file.txt` |
| `gunzip` | Decompresses gzip file | `gunzip file.txt.gz` |
| `zip` | Creates zip archive | `zip -r archive.zip folder/` |
| `unzip` | Extracts zip archive | `unzip archive.zip` |
| `unzip -l` | Lists zip contents | `unzip -l archive.zip` |
| `bzip2` | Compresses with bzip2 | `bzip2 file.txt` |
| `bunzip2` | Decompresses bzip2 file | `bunzip2 file.txt.bz2` |

## Package Management (Debian/Ubuntu)

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `apt update` | Updates package list | `sudo apt update` |
| `apt upgrade` | Upgrades installed packages | `sudo apt upgrade` |
| `apt install` | Installs packages | `sudo apt install nginx` |
| `apt remove` | Removes packages | `sudo apt remove nginx` |
| `apt purge` | Removes packages and config | `sudo apt purge nginx` |
| `apt search` | Searches for packages | `apt search python` |
| `apt show` | Shows package information | `apt show nginx` |
| `apt list` | Lists packages | `apt list --installed` |
| `dpkg -i` | Installs .deb package | `sudo dpkg -i package.deb` |
| `dpkg -l` | Lists installed packages | `dpkg -l | grep nginx` |

## Shell Features and Scripting

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `alias` | Creates command alias | `alias ll='ls -la'` |
| `unalias` | Removes alias | `unalias ll` |
| `history` | Shows command history | `history | grep git` |
| `!n` | Executes nth command from history | `!100` |
| `!!` | Executes last command | `sudo !!` |
| `export` | Sets environment variable | `export PATH=$PATH:/new/path` |
| `source` | Executes script in current shell | `source ~/.bashrc` |
| `.` | Same as source | `. ~/.bashrc` |
| `set` | Sets shell options | `set -e` |
| `unset` | Unsets variable | `unset VARIABLE` |
| `read` | Reads user input | `read -p "Enter name: " name` |
| `if` | Conditional statement | `if [ -f file.txt ]; then echo "exists"; fi` |
| `for` | For loop | `for i in {1..5}; do echo $i; done` |
| `while` | While loop | `while read line; do echo $line; done < file.txt` |
| `case` | Case statement | `case $var in a) echo "A";; b) echo "B";; esac` |
| `function` | Defines function | `function greet() { echo "Hello $1"; }` |
| `test` | Evaluates conditional expression | `test -f file.txt && echo "exists"` |
| `[` | Same as test | `[ -f file.txt ] && echo "exists"` |
| `&&` | Runs command if previous succeeded | `mkdir dir && cd dir` |
| `||` | Runs command if previous failed | `cd dir || mkdir dir` |
| `;` | Runs commands sequentially | `cd /tmp; ls` |
| `|` | Pipes output to next command | `ls -la | grep ".txt"` |
| `>` | Redirects output to file | `echo "text" > file.txt` |
| `>>` | Appends output to file | `echo "more text" >> file.txt` |
| `<` | Redirects input from file | `sort < unsorted.txt` |
| `2>` | Redirects stderr to file | `command 2> error.log` |
| `&>` | Redirects all output to file | `command &> all_output.log` |
| `tee` | Writes to file and stdout | `ls | tee output.txt` |