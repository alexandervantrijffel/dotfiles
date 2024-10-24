. ${0:a:h}/gittreepull.sh

export GIT_CONFIG_GLOBAL=$XDG_CONFIG_HOME/git/config

# https://github.com/scmbreeze/scm_breeze
# [ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"


# for some reason, these two are not applied with zsh-defer gitalias
alias gcaa="git add --all . && git commit -S -v -a"
alias gcaam="git add --all . && git commit -S -v -a -m"

gitalias () {
    alias g="git"
    alias ga="git add"
    alias ga.="git add --all ."
    alias gap="git add . --patch && gs"
    alias gb="git branch | grep \* | cut -d ' ' -f2"
    alias gba="git branch -a"
    # list remote branches by last commit date
    alias gbl='for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="%ci %cr" $branch | head -n 1` \\t$branch; done | sort -r'
    alias gbD="git branch -D"
    alias gc-="git checkout -"
    alias gca="git commit --amend"
    alias gcan="git commit --amend --no-edit"
    alias gcb="git checkout -b"
    alias gco.="git checkout ."
    alias gcom="gco master && gpff && gs"
    alias gcoma="gco main && gpff && gs"
    alias gcop="gco -p"
    alias gcl="git clone"
    alias gcp="git cherry-pick"
    alias gcpc="git cherry-pick --continue"
    alias gco="git checkout"
    alias gcm="git commit -S -v -m"
    alias gclean="git checkout -- . && git clean -fd ."
    alias gd="git diff --word-diff -w"
    alias gds="gd --staged --word-diff | git apply --cached --ignore-whitespace --ignore-space-change --unidiff-zero -"
    alias gds="git diff --staged --word-diff -w"
    alias gl="git log --max-count=500 --stat --decorate --graph --color --pretty=format:'%C(yellow)%h %C(cyan)%ad %Cgreen%d %Creset%s %C(yellow)%an' --date=short"
    alias gls="git log --max-count=500 --decorate --graph --color --pretty=format:'%C(yellow)%h %C(cyan)%ad %Cgreen%d %Creset%s %C(yellow)%an' --date=short"
    alias glp="git log -p "
    alias gm="git merge"
    alias gma="git merge --abort"
    alias gmc="git merge --continue"
    alias gmm="git merge master"
    alias gmma="git merge main"
    alias gmnc="git merge --no-commit --no-ff"
    alias gfa="git fetch --all --tags"
    alias gp="git push"
    alias gpu="git push -u origin \$(gb)"
    alias gpull="git pull"
    alias gpf='echo no gpf please'
    alias gp!="git push --force"
    alias gpff="git pull --recurse-submodules"
    alias gr="git reset"
    alias gr.="git reset ."
    alias gra="git rebase --abort"
    alias grv="git remote -v"
    alias grm="git rebase master"
    alias grma="git rebase main"
    alias grum="git fetch --all && git rebase upstream/master"
    alias grc="git rebase --continue"
    alias gs="git status"
    alias gsf="git fetch origin \$(gb) && git status"
    alias gsa="git stash apply"
    alias gsl="git stash list"
    alias gss="git stash save"
    alias gst="git stash"
    alias gsw="git show"
    alias gwa="git worktree add"
    alias gwr="git worktree remove"
    alias ts="git fetch origin \$(gb) && tig status"
}
zsh-defer gitalias
