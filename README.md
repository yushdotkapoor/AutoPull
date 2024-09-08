# AutoPull

When working with distributed systems or code that is deployed to several different devices, it can be a pain to manually pull updated code from GitHub. AutoPull automatically keeps a repository up to date by probing GitHub every minute to check for any changes.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Support

This code has been tested on MacOS Sonoma, MacOS Big Sur and Ubuntu 24.04.

I have also tested this on the iOS Linux emulator called iSH, whcih runs a version of alpine linux.

## How it works

AutoPull adds cron job to crontab that calls the autopuller and pulls all repositories set up for autopull (found in .autopull_repositories). The crontab will run from the user's crontab file, wherever that may be located. The crontab will run ```autopull --all``` every minute.

A repository path is added to the .autopull_repositories file, which means that if the repository is ever moved, this may cause issues.

A log file will also be present with time stamps to check for errors.

##### iSH differences:
There is a difference in how the code works in iSH. Instead of using the crontab (which doesn't seem to work in iSH), a script called ```autopull_loop``` is called which runs in the background when .ashrc is called. ```autopull_loop``` runs in a while loop until the terminal is exited or AutoPull is uninstalled.


## Installation

```
# To Store credentials so it won't ask for credentials everytime. 
# If ssh-key or other auto authentication methods are set up, the following line is not necessary
git config --global credential.helper store

git clone https://github.com/yushdotkapoor/AutoPull.git
cd AutoPull
make
```

##### If using MacOS, you will need to give /usr/sbin/cron full disk access. [Medium Tutorial](https://medium.com/vunamhung/granting-full-disk-access-to-cron-29d2267fbe62)

## Usage

To set up a repository to pull from GitHub every minute
```
autopull /path/to/repository
```
or 
```
cd /path/to/repository
autopull
````

To remove a repository from autopulling
```
autopull --remove /path/to/repository
```
or
```
cd /path/to/repository
autopull --remove
```

To view the current repositories set up for autopulling
```
autopull --repositories
```

To uninstall AutoPull
```
sudo autopull --uninstall
```

Run ```autopull --help``` for more information

## License

AutoPull is available under the GPL-3.0 license. See the LICENSE file for more info.
