# system original ----------------------- {{{
# /etc/profile

# System wide environment and startup programs, for login setup
# Functions and aliases go in /etc/bashrc

# It's NOT a good idea to change this file unless you know what you
# are doing. It's much better to create a custom.sh shell script in
# /etc/profile.d/ to make custom changes to your environment, as this
# will prevent the need for merging in future updates.

pathmunge () {
    case ":${PATH}:" in
        *:"$1":*)
            ;;
        *)
            if [ "$2" = "after" ] ; then
                PATH=$PATH:$1
            else
                PATH=$1:$PATH
            fi
    esac
}


if [ -x /usr/bin/id ]; then
    if [ -z "$EUID" ]; then
        # ksh workaround
        EUID=`id -u`
        UID=`id -ru`
    fi
    USER="`id -un`"
    LOGNAME=$USER
    MAIL="/var/spool/mail/$USER"
fi

# Path manipulation
if [ "$EUID" = "0" ]; then
    pathmunge /sbin
    pathmunge /usr/sbin
    pathmunge /usr/local/sbin
else
    pathmunge /usr/local/sbin after
    pathmunge /usr/sbin after
    pathmunge /sbin after
fi

HOSTNAME=`/bin/hostname 2>/dev/null`
export USER LOGNAME MAIL HOSTNAME

# By default, we want umask to get set. This sets it for login shell
# Current threshold for system reserved uid/gids is 200
# You could check uidgid reservation validity in
# /usr/share/doc/setup-*/uidgid file
if [ $UID -gt 199 ] && [ "`id -gn`" = "`id -un`" ]; then
    umask 002
else
    umask 022
fi

for i in /etc/profile.d/*.sh ; do
    if [ -r "$i" ]; then
        if [ "${-#*i}" != "$-" ]; then
            . "$i"
        else
            . "$i" >/dev/null 2>&1
        fi
    fi
done

unset i
unset -f pathmunge
# }}}

# envionment variables----------------------- {{{

# history options
export HISTFILESIZE=5000000
export HISTSIZE=5000000
export HISTTIMEFORMAT='%F %T '
export HISTCONTROL=ignoredups
#export PROMPT_COMMAND='history -a'
# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\`\033[;33;1m\W@\033[31m\h\033[;33;1m\\$\033[0m"
if [ -f "/data/soft/git/myscripts/gitbr.rb" ];
then
   export PS1="\`echo \[\e[34m\];/data/soft/git/myscripts/git_show.rb;if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\`\033[;33;1m\W@\033[31m\h\033[;33;1m\\$\033[0m"
fi

export TERM=xterm
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:zh
export LC_ALL=zh_CN.UTF-8
export PATH=/data/soft/go/bin:$PATH:/data/webserver/php/bin
export LESS="-FSRXc"
export PAGER=less
export TZ="Asia/Shanghai"
printf "\e[?2004l"

# }}}

# alias----------------------- {{{
# common alias----------------------- {{{
alias ..="cd .."
alias ...="cd ../.."
alias ls="ls -A --color -F --show-control-chars"
alias l="ls -Al"
alias m="less -FSRXc"
alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"
alias t3="ssh -p57575 t3"
alias webd="cd /data/webserver/"
alias pfix='printf "\e[?2004l"'
alias nocommet='perl -nle '\''print unless /^\s*#/ or /^$/'\''  '
alias toutf8="perl -MEncode -pi -E '\$_=encode(\"utf-8\",decode(\"gbk\",\$_));'"
alias togbk="perl -MEncode -pi -E '\$_=encode(\"gbk\",decode(\"utf-8\",\$_));'"
alias constatus="netstat -n | awk '/^tcp/ {++S[\$NF]} END {for(a in S) print a, S[a]}'"
alias wake='etherwake'
alias cpv='rsync -avhP --progress'
alias cpvr='rsync -avhzP --progress'
alias scperl="perl -MSmart::Comments"
alias e='perl -nlE'
alias ipa='ip -h -s -d -c a'
alias dus='du -hs * |sort -h'

if [ -f "/usr/local/bin/vim" ];
then
    alias vi="/usr/local/bin/vim";
fi

if [ -f "/usr/local/bin/exa" ];
then
    alias ls="/usr/local/bin/exa -F";
    alias l="/usr/local/bin/exa -alFhg --git";
fi

# }}}

# macos alias----------------------- {{{

# from https://natelandau.com/my-mac-osx-bash_profile/
if [[ $(uname -s) == Darwin ]];
then
    alias f='open -a Finder ./';                                                  # Opens current directory in MacOS Finder
    alias flush_dns='dscacheutil -flushcache';                                    # Flush out the DNS Cache
    alias lsock='sudo /usr/sbin/lsof -i -P';                                      # lsock:        Display open sockets
    alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP';                            # lsockU:       Display only open UDP sockets
    alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP';                            # lsockT:       Display only open TCP sockets
    alias ip_info0='ipconfig getpacket en0';                                      # Get info on connections for en0
    alias ip_info1='ipconfig getpacket en1';                                      # Get info on connections for en1
    alias open_ports='sudo lsof -i | grep LISTEN';                                # All listening connections
    alias show_blocked='sudo ipfw list';                                          # All ipfw rules inc/ blocked IPs
    alias mount_read_write='/sbin/mount -uw /';                                   # For use when booted into single-user
    alias finder_show_hidden='defaults write com.apple.finder ShowAllFiles TRUE'; # Show hidden files in Finder
    alias finder_hide_hidden='defaults write com.apple.finder ShowAllFiles FALSE' # Hide hidden files in Finder
    alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'            # Find CPU hogs
    alias mem_hogs_top='top -l 1 -o rsize | head -20'                             # Find memory hogs
    alias mem_hogs_ps='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'    # Find memory hogs
    alias ttop="top -R -F -s 10 -o rsize"                                         # Recommended minimize resources top
    alias fix_stty='stty sane'                                                    # fix_stty:     Restore terminal settings when screwed up
    ql () { qlmanage -p "$*" >& /dev/null; }                                      # ql:           Opens any file in MacOS Quicklook Preview
    my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }      # List processes owned by my user
fi

#   ---------------------------------------
#   REMINDERS & NOTES
#   ---------------------------------------

#   remove_disk: spin down unneeded disk
#   ---------------------------------------
#   diskutil eject /dev/disk1s3

#   to change the password on an encrypted disk image:
#   ---------------------------------------
#   hdiutil chpass /path/to/the/diskimage

#   to mount a read-only disk image as read-write:
#   ---------------------------------------
#   hdiutil attach example.dmg -shadow /tmp/example.shadow -noverify

#   mounting a removable drive (of type msdos or hfs)
#   ---------------------------------------
#   mkdir /Volumes/Foo
#   ls /dev/disk*   to find out the device to use in the mount command)
#   mount -t msdos /dev/disk1s1 /Volumes/Foo
#   mount -t hfs /dev/disk1s1 /Volumes/Foo

#   to create a file of a given size: /usr/sbin/mkfile or /usr/bin/hdiutil
#   ---------------------------------------
#   e.g.: mkfile 10m 10MB.dat
#   e.g.: hdiutil create -size 10m 10MB.dmg
#   the above create files that are almost all zeros - if random bytes are desired
#   then use: ~/Dev/Perl/randBytes 1048576 > 10MB.dat

# }}}
# }}}

# bash settings----------------------- {{{
shopt -s autocd
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s cmdhist
shopt -s histappend
shopt -s checkwinsize
shopt -s complete_fullquote
shopt -s direxpand
shopt -s dirspell
shopt -s execfail
shopt -s dotglob
shopt -s extglob
shopt -s globstar
shopt -s histreedit
shopt -s hostcomplete
# }}}

# color definitions----------------------- {{{
# Color definitions (taken from Color Bash Prompt HowTo).
# Some colors might look different of some terminals.
# For example, I see 'Bold Red' as 'orange' on my screen,
# hence the 'Green' 'BRed' 'Red' sequence I often use in my prompt.
# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset

ALERT=${BWhite}${On_Red} # Bold White on red background
# }}}

# functions----------------------- {{{
function _exit()              # Function to run upon exit of shell.
{
    echo -e "${BRed}Hasta la vista, baby${NC}"
}
trap _exit EXIT

function mcd () { mkdir -p "$1" && cd "$1"; }

function up_profile()
{
    pushd . > /dev/null;
    cd /data/soft/git/myscripts;
    { git pull; } || { popd > /dev/null; }
    cd /data/soft/git/fish_config;
    { git pull; } || { popd > /dev/null; }
    popd > /dev/null;
}
# }}}

# final actions----------------------- {{{
if [ -f "/usr/bin/dircolors" ];
then
    eval "$(dircolors)"
fi

if [ -f "/usr/games/fortune" ];
then
    /usr/games/fortune ubuntu-server-tips;
fi

if [ -f "/data/soft/git/myscripts/syswarn.rb" ];
then
    /data/soft/git/myscripts/syswarn.rb;
fi
# }}}
