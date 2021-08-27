#generic
set -x EDITOR vim
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
set -g fish_greeting ''
set -Ux LSCOLORS cxfxcxdxbxegedabagacad 
alias ll='ls -lah'
alias l='ls -lah'

set -g GOPATH $HOME/go
#set -x PATH /usr/local/opt/ruby@2.3/bin:/usr/local/bin/:$PATH:/usr/local/go/bin:$GOPATH/bin

set -U fish_user_paths /usr/local/bin

#git
alias ga='git add'
alias gc='git ci'
alias gpull='git pull'
alias gpush='git push'
alias gst='git st'
alias gdiff='git diff'
alias gco='git co'
alias gorigin='git push --set-upstream origin'
alias gpp='git pull && git push'

function gpr -d 'Checkout PR X onto branch Y'
   git fetch origin pull/$argv[1]/head:$argv[2] 
end

alias osl='openstack server list'

#k8s
alias kr='kubectl config use-context'
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgpa='kubectl get pods --all-namespaces'
alias kgn='kubectl get nodes'
alias klogs='kubectl logs -f --tail 200'
alias kexec='kubectl exec -it'
alias kdel='kubectl delete'

set -x GITHUB_TOKEN (security find-generic-password -a $USER -s github -w) 

set -x KUBECONFIG ~/.kube/config

#kube my stuff
alias kubememini='set -x KUBECONFIG ~/.kube2/config'

#set -x VIRTUALFISH_DEFAULT_PYTHON python3
#eval (python -m virtualfish auto_activation)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.fish.inc' ]; . '~/google-cloud-sdk/path.fish.inc'; end
