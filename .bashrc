# BEGIN git aliases
alias gs="git status"
alias gc="git commit"
alias gu="git push"
alias gd="git pull"
alias ga="git add"
alias gf="git fetch"
alias gco="git checkout"
alias gitserver="git daemon --verbose --export-all --reuseaddr --informative-errors --base-path=$HOME/.LocalGit/ $HOME/.LocalGit/"
# END git aliases

alias ls="ls -Glah"
alias pyserver="python -m SimpleHTTPserver"
alias myconf="git --git-dir=$HOME/.myconf/ --work-tree=$HOME"

## Fancy coloring and Git display
## Credit: https://gist.github.com/clozed2u/4971506#file-gistfile1-sh
## and https://askubuntu.com/questions/24358/how-do-i-get-long-command-lines-to-wrap-to-the-next-line
git_branch () {
    if git rev-parse --git-dir >/dev/null 2>&1
        then echo -e "" [$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')]
    else
        echo ""
    fi
}

function git_color {
    local STATUS=`git status 2>&1`
    if [[ "$STATUS" == *'Not a git repository'* ]]
        then echo ""
    else
    if [[ "$STATUS" != *'working directory clean'* ]]
        then
        # red if need to commit
        echo -e '\033[0;31m'
    else
    if [[ "$STATUS" == *'Your branch is ahead'* ]]
        then
        # yellow if need to push
        echo -e '\033[0;33m'
    else
        # else cyan
        echo -e '\033[0;32m'
    fi
    fi
    fi
}

export PS1='\[\033[0;35m\]$ \[\033[0;34m\]\w/\[$(git_color)\]$(git_branch)\[\033[m\] '

### Added by the Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH

# added by travis gem
[ -f /Users/crevax/.travis/travis.sh ] && source /Users/crevax/.travis/travis.sh

if [[ -n "${ConEmuPID}" ]]; then
  PROMPT_COMMAND='ConEmuC -StoreCWD'
fi
