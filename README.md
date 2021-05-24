### RomHeat backup - very basic backup

#### Prerequisites

- Initialize empty repo in your home directory

```bash
cd ~/
git clone <this_repo>
mkdir .rh_backups
cd .rh_backups
git init
touch .gitignore
```

- Edit `.gitignore` to exclude bulky & unnecessary files (Pictures, Videos, chromium cache etc)

> **Add entries prefixed by wildcards '\*' to exclude directories.**

> **Do some dry runs with `git add -n .` to make sure they're being ignored**

#### Installation

```bash
cd ~/
git clone git@github.com:romhet/.rh_backup

# Symlink the script to your home directory, set appropriate permissions
ln -s ~/.rh_backup/rh_backup.sh ~/rh_backup.sh
chmod +x ~/rh_backup.sh

# Edit the .service file to match the appropriate path to the script
vim ~/call-home.sh
# Edit Line 6:
ExecStart=/home/<USER>/call-home.sh

# Copy .service and .timer files to the appropriate systemd directory
# (on Arch Linux it was the one I've listed below)
cp ~/call-home/{*.service,*.timer} /etc/systemd/system/

# Edit .timer if desired (for example, the service is configured to run 30 minutes after boot, you could change that if you'd like)

# Start the timer, make sure it spins up without any errors
# NOTE that you're starting the timer, NOT the service!
systemctl start call-home.timer

# Enable the timer on startup
systemctl enable call-home.timer
```
