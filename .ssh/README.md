# Generate SSH Key

ssh-keygen -t bitbucket -C "kenneth.solomon@bitbucket.test"

# Copy the public key

cat ~/.ssh/id_bitbucket.pub | pbcopy

# Restart SSH Agent and Add your Key

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_bitbucket | pbcopy

# Check if it's working

ssh -T git@bitbucket.org
