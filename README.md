[![Build Status](https://drone.io/github.com/cnadiminti/dotfiles/status.png)](https://drone.io/github.com/cnadiminti/dotfiles/latest)
[![Code Climate](https://codeclimate.com/github/cnadiminti/dotfiles/badges/gpa.svg)](https://codeclimate.com/github/cnadiminti/dotfiles)
[![Test Coverage](https://codeclimate.com/github/cnadiminti/dotfiles/badges/coverage.svg)](https://codeclimate.com/github/cnadiminti/dotfiles/coverage)
[![Issue Count](https://codeclimate.com/github/cnadiminti/dotfiles/badges/issue_count.svg)](https://codeclimate.com/github/cnadiminti/dotfiles)

# Chandra does dotfiles

These dotfiles are to personalize my system.
They have been evolving along with my software development experience.

I have been using them so far on Ubuntu and Mac OS X.

## Features

### Aliases

| Alias | Command |
|-------|---------|
| ll | ls -alF|
| la | ls -A |
| l | ls -CF |
| c | clear |
| p | pwd |
| h | history|
| x | exit|
| pyclean | find . -name "*.pyc" -exec rm {} \;|
| trimright | sed -ie "s/ \{1,\}$//"|
| docker-codeclimate | docker run -it --rm --env CODECLIMATE_CODE="$PWD" -v "$PWD":/code -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/cc:/tmp/cc codeclimate/codeclimate|
| swagger-editor | docker run -it --rm -p 8080:8080 swaggerapi/swagger-editor|
| docker-rake-build | docker run -it --rm -v $(pwd):/root -w /root ruby:2.3 bash -c "bundle install &&  bundle exec rake spec build"|

### Functions

| Function | Usage | Notes |
|----------|-------|-------|
| clone_github_user_repos | clone_github_user_repos \<github-user\> | Creates Directory(\<github-user\>) and clones all the repositories |
| clone_github_org_repos | clone_github_org_repos \<github-org\> | Creates Directory(\<github-org\>) and clones all the repositories |
| git_project_fetch | git_project_fetch \<dir\>| git fetch all the repos inside \<dir\> |
| git_project_pull | git_project_pull \<dir\>| git pull all the repos inside \<dir\> |
| clone_bitbucket_proj | clone_bitbucket_proj \<bitbucket-proj\> | Creates Directory(\<bitbucket-proj\>) and clones all the repositories |
| docker_rmi_none | docker_rmi_none | Delete all the images with \<none\> tag |


### Applications/Tools

| Application/Tool Name | Notes |
|-----------------------|-------|
| eclipse-ide | |
| filezilla | |
| firefox | |
| flux | |
| font-inconsolata | |
| github-desktop | |
| google-chrome | |
| google-photos-backup | |
| iterm2 | |
| java | |
| skype | |
| vagrant | |
| virtualbox | |
| vnc-viewer | |
| bash | |
| bash-completion | |
| ansible | |
| ant | |
| git | |
| go | |
| docker | |
| docker-compose | |
| dos2unix | |
| ipcalc | |
| kdiff3 | |
| node | |
| uuid | |
| plantuml | |
| pstree | |
| python | |
| ruby | |
| shellcheck | |
| ssh-copy-id | |
| terminal-notifier | |
| tree | |
| wget | |


## Install

To install just dotfiles:

```sh
git clone https://github.com/cnadiminti/dotfiles.git
cd dotfiles/bin
./install.sh
```

To install dotfiles and more:

```sh
git clone https://github.com/cnadiminti/dotfiles.git
cd dotfiles/bin
./install.sh -a
```

## References

- [Unofficial guide to dotfiles on GitHub](https://dotfiles.github.io)
- [Bash](https://www.gnu.org/software/bash/manual/bashref.html)
- [python-dotfiles](https://github.com/shanx/python-dotfiles)
- [Python](https://www.python.org/)
- [git](https://git-scm.com/)
- [Homebrew](http://brew.sh)
- [iTerm2](https://www.iterm2.com/)
- [Eclipse](https://eclipse.org/)
- [Eclipse Oomph Authoring Guide](https://wiki.eclipse.org/Eclipse_Oomph_Authoring)
- [Emacs](https://www.gnu.org/software/emacs/)
- [Inconsolata](http://www.levien.com/type/myfonts/inconsolata.html)
- [Kdiff3](http://kdiff3.sourceforge.net/)
- [Generic Colouriser](https://github.com/garabik/grc)
- [ShellCheck](https://github.com/koalaman/shellcheck)
