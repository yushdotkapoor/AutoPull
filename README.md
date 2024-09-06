# AutoPull

When working with distributed systems or code that is deployed to several different devices, it can be a pain to manually pull updated code from GitHub. AutoPull automatically keeps a repository up to date by probing GitHub every minute to check for any changes.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Support

This code has been tested with bash, zsh, and ash on MacOS Sonoma, MacOS Big Sur and Ubuntu 24.04

## How it works

AutoPull adds cron job to crontab that calls the autopuller resource configuration (.autopullrc). The same file gets run in an .*rc file. This can be a .zshrc, .bashrc, or .ashrc file. If one of these rc files does not get called when a new Terminal window opens, you may have to configure it to do so in the /etc/profile or /etc/.profile file.

When a repository is added to the .autopullrc file, it calls git pull on the repository.

## Installation

```
# To Store credentials so it won't ask for credentials everytime. 
# If ssh-key or other auto authentication methods are set up, the following line is not necessary
git config --global credential.helper store

git clone https://github.com/yushdotkapoor/AutoPull.git
cd AutoPull
source installer
```

##### If using MacOS, you will need to give /usr/sbin/cron full disk access. [Medium Tutorial](https://medium.com/vunamhung/granting-full-disk-access-to-cron-29d2267fbe62)

## Usage

To automatically pull a repository every minute
```
autopull /path/to/repository
```
or 
```
cd /path/to/repository
autopull
````
To uninstall AutoPull
```
sudo autopull --uninstall
```

## License

AutoPull is available under the GPL-3.0 license. See the LICENSE file for more info.
