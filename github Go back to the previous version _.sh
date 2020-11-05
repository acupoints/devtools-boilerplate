## github Go back to the previous version
$ git log --oneline
b1b0125 (HEAD -> master, origin/master, origin/HEAD) temp1105_3
96d52fd temp1105_2
8f19c43 temp1105
65d50a0 temp1103_4
a748302 temp1103
## ...

$ git reset --hard 96d52fd
$ git push origin master -f
