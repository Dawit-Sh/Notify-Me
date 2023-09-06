<h1 align="center">Notify Me</h1>

<div align="center">
  A <code>6.8kb</code> Script to Notify you about your battery.
</div>

<br />


<div align="center">
  <sub>Built with ❤︎ by
  <a href="https://twitter.com/DawitSharon_">Dawit-Sh</a>
</div>

## Table of Contents
<p align="center">
<ul>
<li><a href="#how-to-use">How To Use</a></li>
<li><a href="#systemd">Systemd</a></li> 
<li><a href="#cron-tab">Cron tab</a></li>
<li><a href="#credits">Credits</a> </li> 
<li><a href="#license">License</a></li> 
</ul>
</p>


## How to use
This is a small shell script i created to notify the user to charge their pc when the battery **%** reaches 40%.
So how do you use the script 

### Clone the repository

```bash
$ git clone https://github.com/Dawit-Sh/Notify-Me.git
```

### Set the Script Executable 
```bash
$ chmod +x NotifyMe.sh
```

### Run the Script 
```bash
$ ./NotifyMe.sh
```


## Systemd
Now always running the script is going to be tiring and annoying so we should set up systemd to run it, for those who do not use systemd check out the <a href="#cron-tab">Cron tab</a> section
mean while for those using systemd let us setup a systemd service.

### You could create a file (as sudo) with you favorite editor (nano, vim etc) like:
```bash 
$ sudo vim /etc/systemd/system/NotifyMe.service
```

### It should contain at least the following:
```bash
[Unit]
Description=start NotifyMe

[Service]
Type=simple
ExecStart=/path/to/NotifyMe script

[Install]
WantedBy=multi-user.target
```

### To ensure that the service will start after reboot execute: 
```bash
$ sudo systemctl enable NotifyMe.service
```

### You can check it any time using
```bash
$ journalctl -u NotifyMe.service
```

## Cron tab

To create a crontab file, use the 
```bash
$ crontab -e
```
This command will open the crontab file in your default text editor. Once the file is open, you can add the command:
```bash
@reboot /path/to/NotifyMe.sh
```
Once you have created the crontab file, you can save it and exit the text editor.<br>
**Now, the bash script will run on bootup and stop on shutdown.**
<br>
<br>
Here are some additional things to keep in mind:

- The ```@reboot``` keyword tells cron to run the job once, at startup.
- The ```/path/to/NotifyMe.sh``` is the path to the bash script that you want to run.
- You can use other keywords in the crontab file to specify when the job should run. For more information, you can refer to the crontab man page: https://linux.die.net/man/5/crontab


## Credits
Building this script was not easy as i had to research some commands so here are some of the resources i used 
- [Checking the Battery’s Status via the Terminal | Baeldung on Linux](https://www.baeldung.com/linux/check-battery-status), so i can get single line command that outputs the battery status to the screen so i can use it in my [Test Constructs](https://tldp.org/LDP/abs/html/testconstructs.html)
- [command line - How do I make my pc speaker beep - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/1974/how-do-i-make-my-pc-speaker-beep) getting a beep sound was essential because the user might be focus on other task that he does not notice the notification so i had to search for a sinlge line built in command into the linux system which would let me make a sound.


## License 
GPL v3 GNU General Public License
