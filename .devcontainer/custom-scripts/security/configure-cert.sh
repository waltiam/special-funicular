#! /bin/bash 
# USAGE: configure-cert.sh 
 
# git config --global user.signingkey $(gpgsm --list-secret-keys | awk 'match($0,/0x/) {id =  substr($0, RSTART, 10)}END{print id}')
# git config --global gpg.program $(which gpgsm)
# git config --global gpg.format x509

git config --global user.name $(gpg --list-secret-keys | perl -n -e'/\[ultimate\]\s*(.*)\s*</ && print $1')
git config --global user.email $(gpg --list-secret-keys | perl -n -e'/<(.*)>/ && print $1')
git config --global user.signingkey $(gpg --list-secret-keys --keyid-format 0xlong | awk 'match($0,/0x/) {id =  substr($0, RSTART+2, 16)}END{print id}')
git config --global gpg.program $(which gpg)

git config --global commit.gpgSign true
git config --global tag.gpgSign true

# go by default uses 'https'
git config --global url."git@github.com:".insteadOf "https://github.com/"

# gah - silly terminal
# export GPG_TTY=$(tty)
gpgconf --kill gpg-agent