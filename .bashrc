# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions

#root/tmpl/selector/login.tt2

# propmt color
function color_my_prompt {
  local __user_and_host="\[\033[01;33m\]\u@\h"
  local __cur_location="\[\033[01;34m\]\w"
  local __git_branch_color="\[\033[31m\]"
  #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
  local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
  local __prompt_tail="\[\033[33m\]\n$"
  local __last_color="\[\033[00m\]"
  export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt

export TRUSTED_IP=192.168.56.1

PATH=$PATH:/usr/local/bin

  function cdls() {
# cdがaliasでループするので\をつける
         \cd $1;
             ls;
        }
alias cd=cdls

#gitコマンドのブランチ名などを補完
source ~/.git-completion.bash

#保存件数
HISTSIZE=50000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

