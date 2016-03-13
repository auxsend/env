Git: multiple users on github



# ~/.ssh/config
Host github.com-activehacker
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_activehacker



# .git/config
[remote "origin"]
        url = git@github.com-activehacker:activehacker/gfs.git
