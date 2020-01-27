# Additional aliases for .basrc and .zshrc

alias bashrc='nvim ~/.bashrc'
alias fishrc='nvim ~/.config/fish/config.fish'
alias sofish='source ~/.config/fish/config.fish'
alias vimrc='nvim ~/.vim/.vimrc'
alias nvimrc='cd ~/.config/nvim'

alias fd='fdfind'

# Completely remove apt package and its configuration
alias aptremove='sudo apt purge --auto-remove'

# Directories Aliases
alias home='cd /mnt/c/Users/MarkL; clear'
alias docs='cd /mnt/c/Users/MarkL/Documents; clear'
alias trade='cd /mnt/c/Users/MarkL/OneDrive/Trading/Stocks; clear'
alias down='cd /mnt/c/Users/MarkL/Downloads; clear'

alias dev='cd ~/Projects/Dev; clear'
alias devgit='cd ~/Projects/Dev/GitHubRepos; clear'

alias ref='cd ~/Projects/references; clear'
alias refwsl='cd ~/Projects/references/WSL; clear'
alias refubu='cd ~/Projects/references/WSL/Ubuntu; clear'

# Secure files Aliases
alias secenter='cd /mnt/c/Users/MarkL; cmd.exe /C Secure.bat; cd ./Secure; clear'
alias seclock='cd /mnt/c/Users/MarkL; cmd.exe /c Secure.bat; clear'
alias sec='cd /mnt/c/Users/MarkL/Secure/; clear'
alias secfiles='cd /mnt/c/Users/MarkL/Secure; clear'
alias secdocs='cd /mnt/c/Users/MarkL/Secure/e-Files; clear'
alias secpersonal='cd /mnt/c/Users/MarkL/Secure/Personal; clear'
alias secbrowse='cd /mnt/c/Users/MarkL/Secure; explorer.exe .; cd -; clear'

# Editors Aliases
alias subl='/mnt/c/Program\ Files/Sublime\ Text\ 3/subl.exe'
alias charm='/mnt/c/Users/MarkL/AppData/Local/JetBrains/Toolbox/apps/PyCharm-C/ch-0/192.6817.19/bin/pycharm64.exe'

# Running Windows executable
alias cmd='cmd.exe /C'
alias ps='powershell.exe /C'
alias open='xdg-open'
alias explore='explorer.exe'

# Windows installed browsers
alias winfirefox='firefox.exe'
alias winchrome='chrome.exe'

# Linux installed browsers
#alias firefox='firefox'
#alias chrome='google-chrome-stable'
#alias chromium='chromium-browser'

# GitHub
alias gh='open https://github.com; clear'
alias repo='open `git remote -v | grep fetch | awk "{print $2}" | sed 's/git@/http:\/\//' | sed "s/com:/com\//"`| head -n1'
alias gist='open https://gist.github.com; clear'

# live browser server
# alias live='http-server'

# tutorial https://www.youtube.com/watch?v=L9zfMeB2Zcc&app=desktop
alias browsersync='browser-sync start --server --files "*"'
# Proxy configured to work with Django
# https://www.metaltoad.com/blog/instant-reload-django-npm-and-browsersync
alias browsersync-proxy='browser-sync start --proxy 127.0.0.1:8000 --files "*"'

# Flask
alias flask='FLASK_APP=application.py FLASK_DEBUG=1 python -m flask run'

# Python env
alias envactivate='source env/bin/activate'
alias envactivatefish='source env/bin/activate.fish'

# Binaries
alias ls='exa'
alias l='exa -l'
alias la='exa -la'

# Shortcut Commands

## xclip shortcuts
### use pipe before the alias command to work with xclip
### https://stackoverflow.com/questions/5130968/how-can-i-copy-the-output-of-a-command-directly-into-my-clipboard#answer-5130969
alias c='xclip'
alias v='xclip -o'
alias cs='xclip -selection'
alias vs='xclip -o -selection'

# Remove debug.log files recursively (will also list all debug files before removal)
alias rmdebs='find . -name "debug.log" -type f; find . -name "debug.log" -type f -delete'
# Remove .log files recursively (will also list all .log files before removal)
alias rmlogs='find . -name "*.log" -type f; find . -name "*.log" -type f -delete'
# Remove .root files recuresively (will also list all debug files before removal)
alias rmroot='find . -name "*.root" -type f; find . -name "*.root" -type f -delete'

# Copy and pasting current working directory from and to clipboard
alias pwdc='pwd | cs clipboard; clear'
alias pwdp='cd "`vs clipboard`"; clear'

# Updating dotfiles Repo
alias dotupdate='cd ~/Projects/dotfiles;cp -r ~/.bashrc ~/.bash_aliases ~/.zshrc ~/.zshenv ~/.tmux.conf ~/.vim/.vimrc ~/.config/fish ~/.profile .;git add .;clear; git status; cd -'
alias dotfiles='cd ~/Projects/dotfiles'
alias dotcommit='cd ~/Projects/dotfiles;git commit -m'
alias dotpush='cd ~/Projects/dotfiles;git push'

# Nameserver workaround for WSL
alias backupns='cat /etc/resolv.conf > ~/nameserver.txt'
alias setns='echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf'
alias restorens='cat ~/nameserver.txt | sudo tee /etc/resolv.conf'
alias printns='cat /etc/resolv.conf'

# Web Servers
alias starta2='sudo service apache2 start'
alias startms='sudo service mysql start'
alias startpg='sudo service postgresql start'
alias stopa2='sudo service apache2 stop'
alias stopms='sudo service mysql stop'
alias stoppg='sudo service postgresql stop'
alias runms='sudo mysql -u root -p'
alias runpg='sudo -u postgres psql'

# Rclone
alias rcopy='rclone copy -vvP --fast-list --drive-chunk-size=32M --transfers=6 --checkers=6 --tpslimit=2'
alias rsync='rclone sync -vvP --fast-list --drive-chunk-size=32M --transfers=6 --checkers=6 --tpslimit=2'

alias rclone-dev-gdrive='zip -r dev.zip ~/Projects/Dev; rclone copy ~/Projects/dev.zip GoogleDrive: --backup-dir GoogleDrive:.dev.bak -vvP --fast-list --drive-chunk-size=32M --transfers=6 --checkers=6 --tpslimit=2'
alias rclone-gdrive-dev='rclone copy GoogleDrive:dev.zip ~/Projects --backup-dir ~/Projects/.dev.bak -vvP --fast-list --drive-chunk-size=32M --transfers=6 --checkers=6 --tpslimit=2'

# alias linuxgui='startxfce4'
