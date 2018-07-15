# Prompt
PS1="\nhandbook \W \$ "

# Editor
export EDITOR=vi

# Add the SSH key to the ssh-agent 
# The ssh key passphrase will be requested once per session
eval $(ssh-agent) > /dev/null
ssh-add
