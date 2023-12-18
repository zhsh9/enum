# Methodology: collect, process, search, adapt, test

# --------------------------------------------------
# OS Info

## distribution type, version
cat /etc/*release

## kernel version
cat /proc/version
uname -a
uname -mrs
rpm -q kernel
dmesg | grep -i Linux
ls /boot | grep vmlinuz-

## environment variable
cat /etc/profile
cat /etc/bashrc
cat /etc/bash.bashrc
cat ~/.bash_profile
cat ~/.bashrc
cat ~/.bash_logout
env
cat /proc/self/environ
set

# --------------------------------------------------
# Device

## printer
lpstat -a

# --------------------------------------------------
# Application & Service

## running process
ps aux
ps -ef
top
htop
cat /etc/services

## running process as user priv
ps aux | grep <user>
ps -ef | grep <user>

## installed application and version
ls -ailh /usr/bin/
ls -ailh /sbin/
dpkg -l
rpm -qa
ls -ailh /var/cache/apt/archives/
ls -ailh /var/cache/yum/

## service config file
cat /etc/syslog.conf # syslog
cat /etc/chttp.conf  # chttp
cat /etc/lighttpd.conf # Lighttpd
cat /etc/cups/cupsd.conf # CUPS Common Unix Printing System
cat /etc/inetd.conf # inetd|xinetd
cat /etc/apache2/apache2.conf # Apache HTTP Server
cat /etc/my.cnf # MySQL|MariaDB
cat /etc/mysql/my.cnf
cat /etc/httpd/conf/httpd.conf # Apache HTTP Server
cat /opt/lampp/etc/httpd.conf  # XAMPP Apache

## scheduled task
crontab -l
cat /etc/cron*
cat /etc/crontab
cat /etc/spool/cron/crontabs/root
ls -ailh /etc/cron*
ls -ailh /etc/ | grep cron
ls -ailh /var/spool/cron/

# --------------------------------------------------
# Cred Seeking

## username and password
grep -i user <file>
grep -i pass <file>
grep -C 5 <"password"> <file>

## find filename and grep its content
find . -name "*.php" -print0 | xargs -0 grep -i -n "var "

# --------------------------------------------------
# Communication & Networking

## nic info, network interface controller
ip a
/sbin/ifconfig -a
cat /etc/network/interfaces
cat /etc/sysconfig/network

## network config, dhcp, dns, gateway
hostname
dnsdomainname
iptables -L
cat /etc/resolv.conf
cat /etc/sysconfig/network
cat /etc/networks

## user & host communicating with system
lsof -i
lsof -i :80
grep 80 /etc/services
netstat -antup
netstat -antpx
netstat -tulpn
chkconfig --list
chkconfig --list | grep 3:on
last
w

## cached ip and mac addr
arp -e
route
route -nee

## packet sniffing
tcpdump tcp src 192.168.1.3 80 and tcp dst 10.10.10.7 21

## shell

## port forwarding

## tunnelling


# --------------------------------------------------
# Confidential Info & User

## user, login info
id
who
whoami
w
last
cat /etc/passwd | grep -E 'bash|zsh' | cut -d: -f1 # list users
cat /etc/passwd | grep ':x:0:0:' | cut -d: -f1 # list super users

## sudo
sudo -l
cat /etc/sudoers

## sensitive file
cat /etc/passwd
cat /etc/shadow
cat /etc/group
ls -ailh /var/mail/
ls -ailh /opt/

## any password in default path of script, database, config file, log gile
##   apache, mysql, mariadb, anaconda, redis
cat /var/apache2/config.inc
cat /var/lib/mysql/mysql/user.MYD
cat /root/anaconda-ks.cfg

## any password in plain text
cat ~/.bash_history
cat ~/.nano_history
cat ~/.atftp_history
cat ~/.mysql_history
cat ~/.php_history

## user info 
cat ~/.bashrc
cat ~/.profile
cat /var/mail/root
cat /var/spool/mail/root

## ssh private key
cat ~/.ssh/authorized_keys
cat ~/.ssh/identity.pub
cat ~/.ssh/identity
cat ~/.ssh/id_rsa.pub
cat ~/.ssh/id_rsa
cat ~/.ssh/id_dsa.pub
cat ~/.ssh/id_dsa
cat /etc/ssh/ssh_config
cat /etc/ssh/sshd_config
cat /etc/ssh/ssh_host_dsa_key.pub
cat /etc/ssh/ssh_host_dsa_key
cat /etc/ssh/ssh_host_rsa_key.pub
cat /etc/ssh/ssh_host_rsa_key
cat /etc/ssh/ssh_host_key.pub
cat /etc/ssh/ssh_host_key
