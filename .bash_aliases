# config files
alias vimrc='nvim ~/.vim/.vimrc'
alias tmuxconf='nvim ~/.tmux.conf'
alias bashrc='nvim ~/.bashrc'
alias zshrc='nvim ~/.zshrc'
alias nvimrc='cd ~/.config/nvim'
alias myalias='nvim ~/.bash_aliases'

# Completely remove apt package and its configuration
alias aptremove='sudo apt purge --auto-remove'

# Update all packages
alias updateall='sudo apt update && sudo apt upgrade -y'

# Directory Aliases
alias winhome='cd /mnt/c/Users/MarkL; clear'
alias windocs='cd /mnt/c/Users/MarkL/Documents; clear'
alias wintrade='cd /mnt/c/Users/MarkL/OneDrive/Trading/Stocks; clear'
alias windown='cd /mnt/c/Users/MarkL/Downloads; clear'
alias winbin='cd /mnt/c/bin; clear'
alias down='cd ~/Downloads'
alias docs='cd ~/Docs; clear'
alias prof='cd ~/Projects; clear'
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
alias explore='explorer.exe'
# Windows installed browsers
alias ffox='firefox.exe'
alias gchrome='chrome.exe'

# GitHub
alias gh='open https://github.com; clear'
alias repo='open `git remote -v | grep fetch | awk "{print $2}" | sed "s/git@/http:\/\//" | sed "s/com:/com\//"`| head -n1'
alias gist='open https://gist.github.com; clear'
alias insigcommit='git add  . && git commit -m "Insignificant commit" && git push'
alias commit='git commit'
alias commitall='git add . && git commit'
alias pushallrepo='cd ~/Docs/wiki; git add .; git commit; git push; cd ~/.config/nvim; pwd; git add .; git commit; git push; cd ~/Projects/references; git add .; git commit; git push; dotupdate; dotfiles; git commit; git push; echo "Update finished"'
alias pullallrepo='cd ~/Docs/wiki; pwd; git pull; cd ~/.config/nvim; pwd; git pull; ~/Projects/references; pwd; git pull;  ~/Projects/dotfiles; pwd; git pull; echo "Syncing complete"'

# live browser server
# alias live='http-server'

# tutorial https://www.youtube.com/watch?v=L9zfMeB2Zcc&app=desktop
alias bsync='browser-sync start --server --files "*"'
# Proxy configured to work with Django
# https://www.metaltoad.com/blog/instant-reload-django-npm-and-browsersync
alias bsync-proxy='browser-sync start --proxy 127.0.0.1:8000 --files "*"'

# Flask
alias flask='FLASK_APP=application.py FLASK_ENV=development FLASK_DEBUG=1 python -m flask run'

# Python env
alias envactivate='source env/bin/activate'
alias envactivatefish='source env/bin/activate.fish'

# Make native commands verbose
alias mv='mv -v'
alias rm='rm -v'
alias cp='cp -v'
alias mkdir='mkdir -v'
alias rmdir='rmdir -v'

# Ref: https://unix.stackexchange.com/a/125386
mkcdir () {
  mkdir -pv -- "$1" &&
    cd -P -- "$1"
}

touched() {
  touch -- "$1" &&
    nvim -- "$1"
}

# Binaries
alias open='xdg-open'
alias ls='exa'
alias l='exa -l'
alias la='exa -la'
alias fd='fdfind'
alias python='python3'

# xclip shortcuts
# use pipe before the alias command to work with xclip
# https://stackoverflow.com/questions/5130968/how-can-i-copy-the-output-of-a-command-directly-into-my-clipboard#answer-5130969
alias c='xclip'
alias v='xclip -o'
alias cs='xclip -selection'
alias vs='xclip -o -selection'

# emacs
alias enw='emacs -nw'

# taskwarrior
alias tw='task'
alias twl='task list'

# Vimwiki
alias wiki='cd ~/Docs/wiki; nvim -c VimwikiUISelect; clear'
alias diary='cd ~/Docs/wiki; nvim -c VimwikiDiaryIndex; clear'
alias dtoday='cd ~/Docs/wiki; nvim -c "set laststatus=0 showtabline=0 colorcolumn=0|VimwikiMakeDiaryNote"; clear'
alias wikidocs='cd ~/Docs/wiki'

# Remove debug.log files recursively (will also list all debug files before removal)
alias rmdebs='find . -name "debug.log" -type f; find . -name "debug.log" -type f -delete'
# Remove .log files recursively (will also list all .log files before removal)
alias rmlogs='find . -name "*.log" -type f; find . -name "*.log" -type f -delete'

# Yank and pasting current working directory system clipboard
alias ypath='pwd | cs clipboard; clear; echo "`pwd`\n...path copied!"'
alias ppath='cd "`vs clipboard`"; clear'

# Yank currant path and convert to windows path
# Resources:
# Sed substitute uppercase lowercase: https://stackoverflow.com/questions/4569825/sed-one-liner-to-convert-all-uppercase-to-lowercase
# Printf: https://linuxconfig.org/bash-printf-syntax-basics-with-examples
# Access last returned value: https://askubuntu.com/questions/324423/how-to-access-the-last-return-value-in-bash
winpath() {
  regex1='s/\//\\/g'
  regex2='s/~/\\\\wsl$\\WLinux\\home\\marklcrns/g'
  regex3='s/\\home/\\\\wsl$\\WLinux\\home/g'
  regex4='s/^\\mnt\\(\w)/\U\1:/g'

  output=$(pwd | sed -e "$regex1" -e "$regex2" -e "$regex3" -re "$regex4")
  printf "%s" "$output"
}
alias winypath='winpath | xclip -selection clipboard; printf "%s\n...win path copied" "$output"'

# Update dotfiles backup repository
alias dotfiles='cd ~/Projects/dotfiles'
DATE=`date "+%Y-%m-%d"`
alias dotbackup='cd $HOME; \
  cp -r \
  .bashrc .bash_aliases .profile \
  .zshenv .zshrc \
  .tmux.conf \
  .gitconfig \
  bin \
  ~/.vim/ \
  ~/.scimrc \
  ~/.config/ranger/rc.conf \
  ~/.config/zathura/zathurarc \
  /mnt/c/Users/MarkL/Documents/gtd \
  ~/.config/fish \
  ~/Projects/dotfiles/.`date "+%Y-%m-%d"`_old.bak/; \
  cd -; clear; echo "dotfiles backup complete"'
alias dotdist='dotbackup; \
  cd ~/Projects/dotfiles; cp -r \
  .bashrc .bash_aliases .profile \
  .zshenv .zshrc \
  .tmux.conf \
  .gitconfig \
  bin \
  .vim/ \
  .scimrc \
  $HOME; \
  cp \rc.conf ~/.config/ranger/; \
  cp zathurarc ~/.config/zathura/; \
  cp -r gtd /mnt/c/Users/MarkL/Documents; \
  cp -r fish ~/.config; \
  cd -; clear; echo "dotfiles distribute complete"'
alias dotupdate='cd ~/Projects/dotfiles;\
  cp -r \
  ~/.bashrc ~/.bash_aliases ~/.profile \
  ~/.zshenv ~/.zshrc \
  ~/.tmux.conf \
  ~/.gitconfig \
  ~/bin \
  ~/.vim/ \
  ~/.scimrc \
  ~/.config/ranger/rc.conf \
  ~/.config/zathura/zathurarc \
  /mnt/c/Users/MarkL/Documents/gtd \
  git add .; git status; echo "dotfiles update complete"'
alias dotcommit='cd ~/Projects/dotfiles;git commit -m'
alias dotpush='cd ~/Projects/dotfiles;git push'

# Nameserver workaround for WSL2
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

alias rclone-dev-gdrive='zip -re dev.zip ~/Projects/Dev; rclone copy ~/Projects/dev.zip GoogleDrive:. --backup-dir GoogleDrive:.dev.bak -vvP --fast-list --drive-chunk-size=32M --transfers=6 --checkers=6 --tpslimit=2'
alias rclone-gdrive-dev='rclone copy GoogleDrive:dev.zip ~/Projects --backup-dir ~/Projects/.dev.bak -vvP --fast-list --drive-chunk-size=32M --transfers=6 --checkers=6 --tpslimit=2'

alias rclone-dev-dbox='zip -re dev.zip ~/Projects/Dev; rclone copy ~/Projects/dev.zip Dropbox:. --backup-dir Dropbox:.dev.bak -vvP --fast-list --drive-chunk-size=32M --transfers=6 --checkers=6 --tpslimit=2'

# gtd shell script
alias on='gtd -ts'

# tmuxinator
alias mux='tmuxinator'

alias linuxgui='startxfce4'
