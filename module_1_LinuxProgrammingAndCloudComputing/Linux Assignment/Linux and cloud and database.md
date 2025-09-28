**Linux and cloud and database:**



os:- Interface between hardware and software

features:

1.Resource management

2.memory management: primary and secondary\\external memory

process management:execution

3.security

4.File Management :retrive data easily

5.device management: new device connection

system software management:

6.networking



different applications:

RAM

CPU

ALU performs arithmetic operations

CLU controls flow

MU

I/p and o/p devices

application



Linux

open source

secure

user level



CCEE

GENU

OSI



Types of Interfaces in os

1.command line interface(CLI) eg:cmd, bash linux

2.Graphical user inface(GUI)  eg:icons

3.visual user interface(VUI)  e.g siri, alexa



kernel in os: decision making, prioritize the tasks, only privileged tasks are done



path: it is the location of stored files

1.Absolute Path 2.Relative path

@mtqmtgNJV9QBN9

commands:

hostnamectl

hostname -I :- always gives ip address

hostname -f:- domain name :

1.for easy debugging during version control errors we need to know username and hostname

2.to modify

3.compatibility



Commands:

uname :username

uname -r:kernel version

uname -a: info about system

uname -s: name of system

uname -v: version of system

uname  -n: desktop name



hostname cte: info of hostname, icon name, chaches, machine id, etc

cat /etc/os-release:details of os

hostname:hostname

hostname I: IP address of system

hostname -f:qualified domain name

sudo hostnamectl set-hostname :for setting hostname and password

sudo: will give you admin privilages for running particular command\[



4.lscpu:- gives all info about cpu: cpu utilization

helps in vitualisation setup

5.cat/proc/cpuinfo: giving info about individual course

6.nproc: no. of cpu available

7.hwinfo: give detailed information about your hardware



8.sudo demidecode: info in tabular form about hardware

9-t memory: info about memory

10.-t system:

11.-t processor:



supercomputer: multiple cpu working at a single time connected through a bus



**stat -c %s file.txt:gives file size in bytes**

**du -k file.txt: gives file size in kb**

**du -BG: gives file size in gb**



11.free: shows total available and free memory

12.free -h: given in human readable format

13.cat /proc/meminfo: detailed memory statisticsv

14.vmstat -s: gives detailed statistics about virtual memory



df: checks available free spaces in file system

df -h: in human readable format



lsblk:gives info about ssd blocks

sudo fdisk -l: partition info about memory sector

lspci: info about peripheral devices(keyboard, mouse)

lsusb: finds usb devices connected with device name

ip a or ip addr show: give all ip addresses with network devices

ifconfig: information about network interfaces

ip route: the traffic redirection or direct

netstat -r: kernel ip routing table

cat /etc/hosts: host ip addreesses along with their names

ping google.com: to communicate with other server(ping)

nslookup google.com:

traceroute google.com: route path for packet is reaching to the destination



uptime: last time og logged in in system

top: gives you detailed info about processes, user, cpu usage and memory usage

top -o +%mem : in decreasing order

last: user who have logged in and till what time

htop: process monitoring tool (monitoring remote activities are doing)

whoami/users: current login user

w: activity of current user

who: total no. of users who have been logged in

who -q: total no. of users

who -r:show run level

who -u: list of active and inactive users with idle time



date: current date and time

date +%y-%m-%d:

date +%T:

date -u:

date -u'+%y-%m-%d %H:%M:S%':

date '+%A':day

cal: horizontal days

ncal: vertical days

cal -y: total year calender

cal -y 2000: for particular year

cal 2 2005: particular month and year

pwd: present working directory (all users are working in home directory)

/bin/ls: all commands are stored in bin its meanings as well

/bin/man:

/bin/uptime:

makdir directory\_name: creates new directory

makdir dir1 dir2 ..:makes different directories in same place

cd dir1: takes us to particular directory

cd ..: takes us 1 step back

cd -:gives lslat working directory and moves to it

cd ~:gets to home directory

cd /:takes us to root directory

cd home:

cd bin and ls: gives all imp commands list stored in bin

touch file name.txt: car

**touch /home/username/path/file.txt: to create a file directly inside different directories**

cat file name :read file

.py, .jav, .java, .cpp, .sh

echo "hello world"> f1.txt

echo "message to next line">> file name :to the next line

printf "message">> file.java: for java file

printf for txt file will create new txt file

echo can create new file if not exist and push message in it

nano file name: for printing messages directly

cat abc.sh

bash abc.sh: bash is just for reading .sh file

nanoe

**ls -a: all hidden file**

**ls -l: gives all directories along with file date time and owner**

**ls -s: short the file by their size**

**ls -it:gives the inodes**

**ls -n: gives users and numeric no.**

**ls \*: showing all files with extension**

**ls \*.txt: accessing with particular extension**

**ls ~: all directories in home**

**ls -R: all directories and sub directories**

**ls -r: in reverse order that we have worked with**

**ls -a: files insidethe directory**

**ls -d \*/: shows the list of directories in current folder**

**ls -d .\*:only hidden files**

**ls -ld directory: gives permissions of directory**

less file.txt: opens the file.txt in efficient manner or in readable format

head file.txt: gives first 10 lines

tail -n 5 file.txt: last 5 lines



rm file or directory name: removes directory or file

rmdir dir\_name: remove directory name only empty directories

rm -r dir\_name:removes the directory having something



cp orifinal(a.txt) duplicate(name.txt) (for backup)

cp -n original duplicate.txt: to override the two lines on one (only if file is not existing. also instead of file names we can give path)

cp -r /home/cdac/dir1 /home/cdac/dir2: copies dir1 data to dir2

cp -a:to reserve the file attribute



copy content to non existing file

mv file path: moves file to path

mv dir\_name /home/host name/dir/: moves to dir (host name is required)

mv old name.txt new\_name.txt: to rename directory

(if a file is already present in a directory to which you are moving a same name file then it will get override)

mv -i file.txt path: asking to overrite if samename is present



to make changes in bugs

rename 's/\\.txt/.sh/' \*.txt:

rename 's/^/dbda\_/' \*.sh:



Finding detailed infor:

rsync path path: syncing the file

rsync -av path path: total info about transferring the file



regular expression:

can rename vy two methods

1.rename

s-substitute

g-global change



**cut -c 5-10 file.txt: extract the characters from 5 to 10**





wc file.txt: lines, words, chars

wc -l file.txt:lines

wc -w file.txt:words

wc -m file.txt: chars

wc -L file.txt: max character present in llongest line

wc -l \*.txt: no. of line for all txt files (change extension for different types of files)

wc -n "the" for file.txt: gives line numbers for pattern the

wc -c "the" for file.txt:

wc -v "the" for file.txt: where pattern not work



To match the patterns:

**grep "word/phrase" \*: serach for all directories**

grep -e "the" for file.txt: case sensitive patterns

grep -o "the" for file.txt: prints matches to output

grep -c "the" for file.txt: count of word

grep -r "To" path:

grep -n "The" path: to check the word



ls -S | head -n 5: gives five files having largest size

kill -9 id:turns of the bash(terminal)

ps: current processor running

ps aux: all running processes



sort file.txt

sort -r file.txt:

sort -n file.txt: numeric values

sort -n -r file.txt: desreading order

sort -n -r -k1 -t $'\\t': k->column t->tab separated \\t->tabular format



history :for showing last used commands

Archive file: File containing many files inside a folder(used for backup)

tar -cvf Archive.tar dir1: archives the dir1 to Archive.tar file





who:users

who | wc -l: number of users logging in with time

|(pipe): output of first command used as a input for second command

ls | head -n 5: fives list of 5 files from top

ls \*.sh | wc -l:

ls -l | grep P: all directories and file starting with P



(Note: 1.when a directory is created it has given a size by default but for file it is not like that

2\. nano is only a command line text editor)



ls -it:gives the inodes

ls -n: gives users and numeric no.

for making a file

pwd

ls



**mkdir dir\_name**

**mkdir -m 755 dir\_name: to create a directory with permissions management**

**mkdir -m u=rxw,g=rx,o=rx dir\_name:without codes**

cd dir\_name

touch file\_name

nano file\_name

write down something

ctrl +x then y (for saving)

bash file name.sh or cat file\_name.txt (reading)

ls-



**date: 30-08-2025**

**sed: search and replace any text (stream editor)**

**sed 's/the/word/' file.txt: replace the to word**

**grep -n "CDAC" file.txt: not affect on file**

**sed 's/the/word/5' file.txt: replace the to word**

**sed 'd/the/word/g' file.txt: replace the to word (/g: globally although repeated in single line still changes)**

**sed '2d' file.txt: Delete a particular line(here 2nd)**

**sed '2d' file.txt > file2.txt: redirect to the file 2**

**sed '$d' file.txt | tail -n 5: delete last lines**

**sed '3d,$d' file.txt: specific lines**

**sed'/the/d' file.txt: will delete the**

**sed '1i\\text to be insert\\' file.txt: insert the text a->before i->after**

**sed "s/^ \*//" | unique c**



**diff file1.txt file2.txt: gives the different text in file**



unique file.txt:



find . : gives all files

find  /home/ubuntu type f file.txt: list of files present in file /location

find  /home/cdac type d: for all files in directory

find / temp.txt: find any file  in entire system

find . file.txt:  for finding in particular directory

find ~ file.txt: searching in home directory

find / -type f -atime 1: search recent files upto last 1 day

find / -type f -mtime 1: all the files that were modified

find /home/CDAC -type f -perm 777: find file inside having permission 777

chmod 777 file.txt: run in directory gives permission 777

find /home/cdac -type f -size +1k: finds the file with specific size (k-kb, M: Mega)

find /home/cdac -type f -empty: gives empty file

find /home/cdac -type f -empty: for directories

find /home/cdac -type f -name "\*.txt": all text files

find /home -type f -name "\*.txt" -mtime 1: gives all modified text files inlast 24 hours

**find path -type d -mtime -7: directories that are updated in last 7 days**







(grep is used with test part of file and find is used to work with locaiton part)



locate command:



locate file.txt or dir: gives the path

locate -u filename: gives username

locate -r dir1: To locate all layers of the directory hierarchially(recursivelly)

locate -i file.txt: not case sensitve

locate -r '\\.txt$': recursively finds all files having extension .txt

locate -rb '^f.\*\\.txt$':locates all files starting with f having extension .txt

locate -r '/f.\*\\.txt$': all files having .txt extension



locate is having very less variations to locate while find i shaving vaious variations

locate is much faster while working with vast files



**date: 1/09/2025**



**links: to create a reference to memory location**

**1.Hardware 2.software**

ln originalfile copyfile: createa the link between them with ubique inode consumes less memory

**deleting original will not affect copies**



**Soft link:**

**ln -s file.txt copyofsoft.txt: creates soft link**

**->the inode changes, file permissions changes and time changes**

**if deletes original then removes copies also.**



owner->user(root, regular, service)->group->other(drwx)(lrwx)read write execute

getfacl file.txt: checking access control with their name, owner, group, permission



**for changing the permissions of a particular file:(ACL commands)**

**setfacl -m u:root:r file.txt: gives two users with different permissions**

**setfacl -m g:root:r file.txt: gives group of users with permission change**

**getfacl file.txt: shows users**

**setfacl -b file.txt: delete all the users**



**sudo adduser username: adds new user**

**id user: check user present**

**sudo passwd student: change password**

**adduser username/ useradd username:**



**cat /etc/passwd: gives the all users that are present**

**cat /etc/group: gives all groups along with the users**

**groupadd : to add a group**



**getent group groupname: gives the group with permissions and all users in group if present**

**getent passwd student: gives all users with all info present**



**sudo useradd -m -G group\_name new\_username: adds new user directly**

**sudo gpasswd -d username groupname:remove a particular user from agroup**

**userdel username: delete a particular user**

**sudo userdel -r username: delete with home directory**



**(try to remember the numbers for ccee)**

**chmod 777 file.txt: to change the mod of file with unique id (user, group, other)**

**chmod 000 file.txt: ----**

**chmod u=rx,g=w,o=- file.txt:gives separately without codes**

**chmod u+w file.txt**

**chmod go+wx file.txt:separately can also be changed**

**sudo chown new\_user file.txt: change the user**

**sudo chown newuser:newgroup file.txt: change both user and group**

**sudo chown :newgroup file.txt: changeonly group**



**shell scripting:**

**#/bin/bash(header that make compiler to understand this is shell programme)ls**

**name = "Hello"**

**a=20**

**echo $name**

**echo $a**

read->takes user input

**bash is for running the commamd**

**two variables are there(1.read only variable 2.user i/p variable)**

**s="manoj"**

**cannot re-assign readonly variable(assign once only like aadhar no.)**

@(return all the values)



**predefined meanings of some characters:**

**1.@ -> prints all parameters provided**

**2.0: file name**

**3.1: first parameter**

**4.#: total no. of parameter**



**if else fi**

**1.-eq = equal to**

**2.-ne = not equal to**

**3. -lt = less than**

**4. -gt = greater than**

**++a:pre increment**

**a++: gives post increment**

**5.-ge: greater than equal to**

**6.-le:less than equal to**



**for ssh connection:**

**sudo apt install openssh-server -y**

**sudo systemctl enable ssh**

**sudo systemctl start ssh**

**sudo systemctl status ssh**

**hostname -I**

**for ssh connection**

**ssh username**(to be send)**@ip\_address**

**exit**



\*\*for file transfer(scp connection):\*\*works on file transfer protocol

**scp /home/ubuntu/file.txt username@ip:/home/Desktop**



**awk command:**

**for counting the particular word in file**

**awk '/word/ {count++} END {print count}' file.txt**



**tar -cvf abc.tar: creates a archive file**

**tar -tvf abc.tar: extracts all material**

**tar -xvf abc.tar: extract a particular file**



**diff file1.txt file2.txt: compare two files**





**Advanced questions:**

**tail -f path with username: track a realtime changes f emans follow**

**find / type f -size +100: gives all files in root directory**

**gzip file.txt(file to be compressed in .gz): compressing any file in .zip format**



**gzip -k file.txt: keeps original as it is**

**find /home -user username:gives the files owned by particular user**

**crontab: jsut type of scripting to schedule some task for executing daily for crtain days**

**crontab -l: to access the crontabbed files**





