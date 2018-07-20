# Prompt
PS1="\nhandbook \W \$ "

# Editor
export EDITOR=vi

# Add the SSH key to the ssh-agent 
# The ssh key passphrase will be requested once per session
eval $(ssh-agent) > /dev/null
ssh-add

# Support interactive workshop session (next/prev)
chmod +x /root/bin/next
chmod +x /root/bin/prev
export PATH=/root/bin:$PATH
export STEPFILE=/tmp/$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
next
