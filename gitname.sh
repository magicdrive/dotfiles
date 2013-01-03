#! /bin/bash

echo 'Please tell me, user.name:'
read name
git config --global user.name ${name}

echo 'Please tell me, user.email:'
read email
git config --global user.email ${email}


exit 0;
