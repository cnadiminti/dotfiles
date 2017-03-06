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

- [x] [docker](https://www.docker.com/products/docker)
- [x] [eclipse-ide](https://eclipse.org/)
- [x] [filezilla](https://filezilla-project.org/)
- [x] [firefox](https://www.mozilla.org/firefox/)
- [x] [flux](https://justgetflux.com/)
- [x] [font-inconsolata](http://levien.com/type/myfonts/inconsolata.html)
- [x] [google-chrome](https://www.google.com/chrome/)
- [x] [Homebrew](https://brew.sh)
- [x] [iterm2](https://www.iterm2.com/)
- [x] [java](http://www.oracle.com/technetwork/java/javase/overview/index.html)
- [x] [kdiff3](http://kdiff3.sourceforge.net/)
- [x] [postman](https://www.getpostman.com/)
- [x] [skype](https://www.skype.com/)
- [x] [vagrant](https://www.virtualbox.org/)
- [x] [virtualbox](https://www.virtualbox.org/)
- [x] [vnc-viewer](https://www.realvnc.com/)
- [x] [ansible](https://www.ansible.com/)
- [x] [ant](https://ant.apache.org/)
- [x] [awscli](https://aws.amazon.com/cli/)
- [x] [bash](https://www.gnu.org/software/bash/)
- [x] [bash-completion](https://bash-completion.alioth.debian.org/)
- [x] [brew-cask-completion](https://github.com/xyb/homebrew-cask-completion)
- [x] [cmake](https://www.cmake.org/)
- [x] [docker-clean](https://github.com/ZZROTDesign/docker-clean)
- [x] [docker-compose](https://docs.docker.com/compose/)
- [x] [dos2unix](https://waterlan.home.xs4all.nl/dos2unix.html)
- [x] [gem-completion](https://github.com/mernen/completion-ruby)
- [x] [git](https://git-scm.com)
- [x] [gnutls](https://gnutls.org/)
- [x] [gradle](https://www.gradle.org/)
- [x] [grc](http://korpus.juls.savba.sk/~garabik/software/grc.html)
- [x] [ipcalc](http://jodies.de/ipcalc)
- [x] [jenv](http://www.jenv.be)
- [x] [librsvg](https://live.gnome.org/LibRsvg)
- [x] [libssh2](https://libssh2.org/)
- [x] [maven](https://maven.apache.org/)
- [x] [maven-completion](https://github.com/juven/maven-bash-completion)
- [x] [node](https://nodejs.org/)
- [x] [ossp-uuid](http://www.ossp.org/pkg/lib/uuid/)
- [x] [pip-completion](https://github.com/ekalinin/pip-bash-completion)
- [x] [plantuml](https://plantuml.sourceforge.io/)
- [x] [pstree](http://www.thp.uni-duisburg.de/pstree/)
- [x] [python](https://www.python.org)
- [x] [python3](https://www.python.org/)
- [x] [ruby](https://www.ruby-lang.org/)
- [x] [sbt](http://www.scala-sbt.org)
- [x] [scala](https://www.scala-lang.org/)
- [x] [shellcheck](https://www.shellcheck.net/)
- [x] [ssh-copy-id](https://www.openssh.com/)
- [x] [terminal-notifier](https://github.com/julienXX/terminal-notifier)
- [x] [tree](http://mama.indstate.edu/users/ice/tree/)
- [x] [vagrant-completion](https://github.com/mitchellh/vagrant)
- [x] [wget](https://www.gnu.org/software/wget/)

## Install

To install just dotfiles:

```sh
git clone https://github.com/cnadiminti/dotfiles.git
cd dotfiles/bin
./install.sh
```

To install dotfiles and Applications/Tools :

```sh
git clone https://github.com/cnadiminti/dotfiles.git
cd dotfiles/bin
./install.sh -a
```

## References

- [Unofficial guide to dotfiles on GitHub](https://dotfiles.github.io)
- [python-dotfiles](https://github.com/shanx/python-dotfiles)
- [Eclipse Oomph Authoring Guide](https://wiki.eclipse.org/Eclipse_Oomph_Authoring)
