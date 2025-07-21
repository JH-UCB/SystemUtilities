# Git Commands Reference Table

## Repository Setup and Configuration

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `git init` | Initializes a new Git repository | `git init` |
| `git init --bare` | Creates a bare repository | `git init --bare project.git` |
| `git clone` | Clones a repository | `git clone https://github.com/user/repo.git` |
| `git clone --depth` | Shallow clone with limited history | `git clone --depth 1 https://github.com/user/repo.git` |
| `git clone --branch` | Clones specific branch | `git clone --branch develop https://github.com/user/repo.git` |
| `git config` | Sets configuration values | `git config user.name "John Doe"` |
| `git config --global` | Sets global configuration | `git config --global user.email "john@example.com"` |
| `git config --list` | Lists all configuration | `git config --list` |
| `git config --get` | Gets specific configuration value | `git config --get user.name` |
| `git config --unset` | Removes configuration entry | `git config --unset user.name` |

## Basic Workflow Commands

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `git status` | Shows working tree status | `git status` |
| `git status -s` | Shows short status format | `git status -s` |
| `git add` | Adds files to staging area | `git add file.txt` |
| `git add .` | Adds all files in current directory | `git add .` |
| `git add -A` | Adds all changes in repository | `git add -A` |
| `git add -p` | Interactively stages changes | `git add -p file.txt` |
| `git add -u` | Adds only modified/deleted files | `git add -u` |
| `git commit` | Commits staged changes | `git commit -m "Add feature"` |
| `git commit -a` | Commits all tracked changes | `git commit -am "Update files"` |
| `git commit --amend` | Modifies last commit | `git commit --amend -m "Fixed message"` |
| `git commit --no-edit` | Amends without changing message | `git commit --amend --no-edit` |
| `git commit -S` | Creates signed commit | `git commit -S -m "Signed commit"` |
| `git rm` | Removes files from working tree and index | `git rm file.txt` |
| `git rm --cached` | Removes from index but keeps in working tree | `git rm --cached file.txt` |
| `git mv` | Moves or renames file | `git mv old_name.txt new_name.txt` |

## Branching and Merging

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `git branch` | Lists branches | `git branch` |
| `git branch -a` | Lists all branches (including remote) | `git branch -a` |
| `git branch -r` | Lists remote branches | `git branch -r` |
| `git branch [name]` | Creates new branch | `git branch feature-login` |
| `git branch -d` | Deletes branch (safe) | `git branch -d feature-login` |
| `git branch -D` | Force deletes branch | `git branch -D feature-login` |
| `git branch -m` | Renames branch | `git branch -m old-name new-name` |
| `git branch --merged` | Shows merged branches | `git branch --merged` |
| `git checkout` | Switches branches | `git checkout develop` |
| `git checkout -b` | Creates and switches to new branch | `git checkout -b feature-new` |
| `git checkout --` | Discards changes in working directory | `git checkout -- file.txt` |
| `git switch` | Switches branches (newer command) | `git switch main` |
| `git switch -c` | Creates and switches to new branch | `git switch -c feature-new` |
| `git merge` | Merges branch into current branch | `git merge feature-branch` |
| `git merge --no-ff` | Creates merge commit even if fast-forward | `git merge --no-ff feature-branch` |
| `git merge --squash` | Squashes commits before merging | `git merge --squash feature-branch` |
| `git merge --abort` | Aborts merge in progress | `git merge --abort` |
| `git rebase` | Reapplies commits on top of another base | `git rebase main` |
| `git rebase -i` | Interactive rebase | `git rebase -i HEAD~3` |
| `git rebase --onto` | Rebases onto specific commit | `git rebase --onto main feature-a feature-b` |
| `git rebase --abort` | Aborts rebase in progress | `git rebase --abort` |
| `git rebase --continue` | Continues after resolving conflicts | `git rebase --continue` |

## Remote Repository Operations

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `git remote` | Lists remote repositories | `git remote` |
| `git remote -v` | Shows remote URLs | `git remote -v` |
| `git remote add` | Adds remote repository | `git remote add origin https://github.com/user/repo.git` |
| `git remote remove` | Removes remote | `git remote remove origin` |
| `git remote rename` | Renames remote | `git remote rename origin upstream` |
| `git remote set-url` | Changes remote URL | `git remote set-url origin https://new-url.git` |
| `git remote show` | Shows remote information | `git remote show origin` |
| `git fetch` | Downloads objects and refs from remote | `git fetch origin` |
| `git fetch --all` | Fetches from all remotes | `git fetch --all` |
| `git fetch --prune` | Removes deleted remote branches | `git fetch --prune` |
| `git pull` | Fetches and merges remote changes | `git pull origin main` |
| `git pull --rebase` | Fetches and rebases instead of merge | `git pull --rebase origin main` |
| `git push` | Uploads local changes to remote | `git push origin main` |
| `git push -u` | Sets upstream branch | `git push -u origin feature-branch` |
| `git push --force` | Force pushes (overwrites remote) | `git push --force origin feature-branch` |
| `git push --force-with-lease` | Safer force push | `git push --force-with-lease origin feature-branch` |
| `git push --all` | Pushes all branches | `git push --all origin` |
| `git push --tags` | Pushes all tags | `git push --tags` |
| `git push --delete` | Deletes remote branch | `git push --delete origin feature-branch` |

## Viewing History and Differences

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `git log` | Shows commit history | `git log` |
| `git log --oneline` | Shows condensed log | `git log --oneline` |
| `git log --graph` | Shows ASCII graph of branches | `git log --graph --oneline` |
| `git log --follow` | Shows history including renames | `git log --follow file.txt` |
| `git log -p` | Shows patches (diffs) in log | `git log -p` |
| `git log -n` | Limits number of commits shown | `git log -n 5` |
| `git log --since` | Shows commits since date | `git log --since="2 weeks ago"` |
| `git log --author` | Shows commits by author | `git log --author="John"` |
| `git log --grep` | Searches commit messages | `git log --grep="fix"` |
| `git log --stat` | Shows file statistics | `git log --stat` |
| `git shortlog` | Summarizes commits by author | `git shortlog -sn` |
| `git show` | Shows commit details | `git show HEAD` |
| `git show --name-only` | Shows only filenames in commit | `git show --name-only HEAD` |
| `git diff` | Shows unstaged changes | `git diff` |
| `git diff --staged` | Shows staged changes | `git diff --staged` |
| `git diff HEAD` | Shows all changes since last commit | `git diff HEAD` |
| `git diff [branch]` | Shows differences between branches | `git diff main..feature` |
| `git diff --stat` | Shows diff statistics | `git diff --stat` |
| `git diff --name-only` | Shows only changed filenames | `git diff --name-only` |
| `git difftool` | Opens diff in external tool | `git difftool` |

## Stashing Changes

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `git stash` | Stashes current changes | `git stash` |
| `git stash save` | Stashes with description | `git stash save "WIP: feature X"` |
| `git stash list` | Lists all stashes | `git stash list` |
| `git stash show` | Shows stash contents | `git stash show stash@{0}` |
| `git stash show -p` | Shows stash diff | `git stash show -p stash@{0}` |
| `git stash apply` | Applies stash without removing | `git stash apply stash@{0}` |
| `git stash pop` | Applies and removes stash | `git stash pop` |
| `git stash drop` | Removes specific stash | `git stash drop stash@{0}` |
| `git stash clear` | Removes all stashes | `git stash clear` |
| `git stash branch` | Creates branch from stash | `git stash branch feature-from-stash` |

## Tagging

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `git tag` | Lists tags | `git tag` |
| `git tag [name]` | Creates lightweight tag | `git tag v1.0` |
| `git tag -a` | Creates annotated tag | `git tag -a v1.0 -m "Version 1.0"` |
| `git tag -d` | Deletes local tag | `git tag -d v1.0` |
| `git tag -v` | Verifies signed tag | `git tag -v v1.0` |
| `git push --tags` | Pushes all tags to remote | `git push --tags` |
| `git push [tag]` | Pushes specific tag | `git push origin v1.0` |
| `git push --delete` | Deletes remote tag | `git push --delete origin v1.0` |
| `git describe` | Describes commit using tags | `git describe --tags` |

## Undoing Changes

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `git reset` | Resets current HEAD | `git reset` |
| `git reset --soft` | Resets HEAD, keeps changes staged | `git reset --soft HEAD~1` |
| `git reset --mixed` | Resets HEAD and index (default) | `git reset HEAD~1` |
| `git reset --hard` | Resets HEAD, index, and working tree | `git reset --hard HEAD~1` |
| `git reset [file]` | Unstages file | `git reset file.txt` |
| `git revert` | Creates new commit that undoes changes | `git revert HEAD` |
| `git revert -n` | Reverts without committing | `git revert -n HEAD` |
| `git restore` | Restores working tree files | `git restore file.txt` |
| `git restore --staged` | Unstages files | `git restore --staged file.txt` |
| `git restore --source` | Restores from specific commit | `git restore --source=HEAD~1 file.txt` |
| `git clean` | Removes untracked files | `git clean -f` |
| `git clean -n` | Shows what would be removed | `git clean -n` |
| `git clean -d` | Removes untracked directories | `git clean -fd` |
| `git clean -x` | Removes ignored files too | `git clean -fx` |

## Advanced Operations

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `git cherry-pick` | Applies commit from another branch | `git cherry-pick abc123` |
| `git cherry-pick -n` | Cherry-picks without committing | `git cherry-pick -n abc123` |
| `git bisect` | Binary search for bad commit | `git bisect start` |
| `git bisect bad` | Marks commit as bad | `git bisect bad` |
| `git bisect good` | Marks commit as good | `git bisect good abc123` |
| `git bisect reset` | Ends bisect session | `git bisect reset` |
| `git reflog` | Shows reference logs | `git reflog` |
| `git reflog expire` | Expires old reflog entries | `git reflog expire --expire=now --all` |
| `git fsck` | Verifies database integrity | `git fsck` |
| `git gc` | Garbage collection | `git gc` |
| `git prune` | Removes unreachable objects | `git prune` |
| `git archive` | Creates archive of repository | `git archive --format=zip HEAD > archive.zip` |
| `git submodule` | Manages submodules | `git submodule add https://github.com/user/lib.git` |
| `git submodule update` | Updates submodules | `git submodule update --init --recursive` |
| `git worktree` | Manages multiple working trees | `git worktree add ../feature-branch feature-branch` |

## Git Aliases and Helpers

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `git alias` | Creates command aliases | `git config --global alias.co checkout` |
| `git help` | Shows help for Git commands | `git help commit` |
| `git help -a` | Lists all available commands | `git help -a` |
| `git version` | Shows Git version | `git version` |
| `git blame` | Shows who changed each line | `git blame file.txt` |
| `git blame -L` | Blames specific lines | `git blame -L 10,20 file.txt` |
| `git grep` | Searches files in repository | `git grep "TODO"` |
| `git grep -n` | Shows line numbers | `git grep -n "TODO"` |
| `git ls-files` | Lists tracked files | `git ls-files` |
| `git ls-tree` | Lists tree object contents | `git ls-tree HEAD` |
| `git cat-file` | Shows object contents | `git cat-file -p HEAD` |
| `git rev-parse` | Parses revision specifications | `git rev-parse HEAD` |
| `git rev-list` | Lists commit objects | `git rev-list --all` |