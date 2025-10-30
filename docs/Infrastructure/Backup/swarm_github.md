---
comments: true
---

# Swarm files Backup (GitHub)

## GitHub repository
The location of the saved config files in github is the root of this repo 
[swarm_config](https://github.com/karam-ajaj/swarm_config).
Some db files and backup files etc.. are also added using git lfs.


## Instructions

To make github accept large files I had to install git 
[lfs](https://git-lfs.com/)
and do a 
[migrate](https://github.com/git-lfs/git-lfs/blob/main/docs/man/git-lfs-migrate.adoc?utm_source=gitlfs_site&utm_medium=doc_man_migrate_link&utm_campaign=gitlfs#_import),
it can be found in [step_4](https://docs.vnerd.nl/Infrastructure/Backup/swarm_github/#4-install-lfs)

### Local git files
local git files needed to be reconfigured so GitHub can accept these files
```
root@f64d5b00f1c3:/home/coder/swarm/config# cat .git/config 
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
        packedGitLimit = 512m 
        packedGitWindowSize = 512m 
[remote "origin"]
        url = https://github.com/karam-ajaj/swarm_config.git
        fetch = +refs/heads/*:refs/remotes/origin/*
[branch "main"]
        remote = origin
        merge = refs/heads/main
[http]
        postBuffer = 524288000
[pack]
        deltaCacheSize = 2047m 
        packSizeLimit = 2047m 
        windowMemory = 2047m
[lfs]
        repositoryformatversion = 0
[lfs "https://github.com/karam-ajaj/swarm_config.git/info/lfs"]
        access = basic
```

```
root@pxsw01:/swarm/config# cat .gitattributes
*.db filter=lfs diff=lfs merge=lfs -text
*.zip filter=lfs diff=lfs merge=lfs -text
*.tar filter=lfs diff=lfs merge=lfs -text
*.log filter=lfs diff=lfs merge=lfs -text
*.2 filter=lfs diff=lfs merge=lfs -text
*.286 filter=lfs diff=lfs merge=lfs -text
*.287 filter=lfs diff=lfs merge=lfs -text
*.2* filter=lfs diff=lfs merge=lfs -text
```

```
root@f64d5b00f1c3:/home/coder/swarm/config# cat .gitignore 
# exclude docs folder (another repository)
/docs
```


#### 1. init github repo
create a private repository on GitHub, then apply the following steps on coder terminal (lfs shoudl be reinstalled) or teleport host
```
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/karam-ajaj/swarm_config.git
git push -u origin main
```
#### 2. add folders
```
git add example
git commit -m "example added"
git push -u origin main
git status
```
#### 3. check folders sizes
```
du -h -d 1 ./
```
#### 4. install lfs
```
git --version
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
apt-get install git-lfs
git lfs install
git lfs track "*.db"
git add .gitattributes
git status
git commit -m "git lfs nistalled and *.db files added"
git status
git push -u -v --progress origin main
```

#### 5. lfs configs
```
git lfs migrate info
# obsidian have some "*.2*" large files
git lfs migrate import --include="*.zip,*.tar,*.log,*.db,*.2*"
git lfs migrate info
git lfs migrate info --include-ref=main
git status
git push -u -v --progress origin main
```


## **_Extras_** 

* unstage files
```
git rm --cached obsidian/core.286
git restore --staged obsidian/core.286
```
* add commit and merge after changing dynamic files (check later)
```
git commit --amend
git commit -m "pihole added"
git log HEAD..origin/main
git merge origin/main
git log HEAD..origin/main
```