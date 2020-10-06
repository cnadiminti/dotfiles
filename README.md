[![Build Status](https://cloud.drone.io/api/badges/cnadiminti/dotfiles/status.svg)](https://cloud.drone.io/cnadiminti/dotfiles)
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

- [x] [Adobe Acrobat Reader DC](https://acrobat.adobe.com/us/en/acrobat/pdf-reader.html) View, print, and comment on PDF documents
- [x] [Github Atom](https://atom.io/) Cross-platform text editor
- [x] [Etcher](https://balena.io/etcher) Tool to flash OS images to SD cards & USB drives
- [x] [DBeaver Community Edition](https://dbeaver.io/) Free universal database tool and SQL client
- [x] [Docker Desktop](https://www.docker.com/products/docker-desktop) App to build and share containerized applications and microservices
- [x] [Mozilla Firefox](https://www.mozilla.org/firefox/) Cross-platform web browser
- [x] [f.lux](https://justgetflux.com/) Screen color temperature controller
- [x] [Inconsolata](https://fonts.google.com/specimen/Inconsolata)
- [x] [Google Chrome](https://www.google.com/chrome/) Cross-platform web browser
- [x] [Hidden Bar](https://github.com/dwarvesf/hidden/) Utility to hide menu bar items
- [x] [IntelliJ IDEA Community Edition](https://www.jetbrains.com/idea/) IDE for Java development - community edition
- [x] [iTerm2](https://www.iterm2.com/) Terminal emulator as alternative to Apple's Terminal app
- [x] [KDiff3](https://invent.kde.org/sdk/kdiff3)
- [x] [Eclipse Memory Analyzer](https://www.eclipse.org/mat/)
- [x] [Postman](https://www.postman.com/) Collaboration platform for API development
- [x] [Jetbrains PyCharm Community Edition](https://www.jetbrains.com/pycharm/) Free and open-source IDE for Python programming - Community Edition
- [x] [Skype](https://www.skype.com/) Video chat, voice call and instant messaging application
- [x] [Spectacle](https://www.spectacleapp.com/) Move and resize windows with ease
- [x] [Vagrant](https://www.vagrantup.com/)
- [x] [Oracle VirtualBox](https://www.virtualbox.org/)
- [x] [VisualVM](https://visualvm.github.io/)
- [x] [Real VNC Viewer](https://www.realvnc.com/) Remote desktop application focusing on security
- [x] [WhatsApp](https://www.whatsapp.com/) Desktop client for WhatsApp
- [x] [Zoom.us](https://www.zoom.us/) Video communication and virtual meeting platform
- [x] [Azul Zulu Java Standard Edition Development Kit](https://www.azul.com/downloads/zulu/zulu-mac/)
- [x] [Azul Zulu Java 8 Standard Edition Development Kit](https://www.azul.com/downloads/zulu/zulu-mac/)
- [x] [ansible](https://www.ansible.com/) Automate deployment, configuration, and upgrading
- [x] [ant](https://ant.apache.org/) Java build tool
- [x] [autoconf](https://www.gnu.org/software/autoconf) Automatic configure script builder
- [x] [avro-tools](https://avro.apache.org/) Avro command-line tools and utilities
- [x] [awscli](https://aws.amazon.com/cli/) Official Amazon AWS command-line interface
- [x] [bash](https://www.gnu.org/software/bash/) Bourne-Again SHell, a UNIX command interpreter
- [x] [brew-cask-completion](https://github.com/xyb/homebrew-cask-completion) Fish completion for brew-cask
- [x] [brotli](https://github.com/google/brotli) Generic-purpose lossless compression algorithm by Google
- [x] [cmake](https://www.cmake.org/) Cross-platform make
- [x] [consul-template](https://github.com/hashicorp/consul-template) Generic template rendering and notifications with Consul
- [x] [coreutils](https://www.gnu.org/software/coreutils) GNU File, Shell, and Text utilities
- [x] [docker](https://www.docker.com/) Pack, ship and run any application as a lightweight container
- [x] [docker-clean](https://github.com/ZZROTDesign/docker-clean) Clean Docker containers, images, networks, and volumes
- [x] [docker-compose](https://docs.docker.com/compose/) Isolated development environments using Docker
- [x] [docker-machine](https://docs.docker.com/machine) Create Docker hosts locally and on cloud providers
- [x] [dos2unix](https://waterlan.home.xs4all.nl/dos2unix.html) Convert text between DOS, UNIX, and Mac formats
- [x] [weaveworks/tap/eksctl](https://eksctl.io/) The official CLI for Amazon EKS
- [x] [gcviewer](https://github.com/chewiebug/GCViewer) Java garbage collection visualization tool
- [x] [gem-completion](https://github.com/mernen/completion-ruby) Bash completion for gem
- [x] [git](https://git-scm.com) Distributed revision control system
- [x] [go](https://golang.org) Open source programming language to build simple/reliable/efficient software
- [x] [goaccess](https://goaccess.io/) Log analyzer and interactive viewer for the Apache Webserver
- [x] [gradle](https://www.gradle.org/) Open-source build automation tool based on the Groovy and Kotlin DSL
- [x] [gradle-completion](https://gradle.org/) Bash and Zsh completion for Gradle
- [x] [grc](https://korpus.juls.savba.sk/~garabik/software/grc.html) Colorize logfiles and command output
- [x] [helmsman](https://github.com/Praqma/helmsman) Helm Charts as Code tool
- [x] [httrack](https://www.httrack.com/) Website copier/offline browser
- [x] [ipcalc](http://jodies.de/ipcalc) Calculate various network masks, etc. from a given IP address
- [x] [jenv](https://www.jenv.be/) Manage your Java environment
- [x] [jinja2-cli](https://github.com/mattrobenolt/jinja2-cli) CLI for the Jinja2 templating language
- [x] [jmeter](https://jmeter.apache.org/) Load testing and performance measurement application
- [x] [jq](https://stedolan.github.io/jq/) Lightweight and flexible command-line JSON processor
- [x] [kompose](https://kompose.io/) Tool to move from `docker-compose` to Kubernetes
- [x] [krew](https://sigs.k8s.io/krew/) Package manager for kubectl plugins
- [x] [libcroco](https://gitlab.gnome.org/GNOME/libcroco) CSS parsing and manipulation toolkit for GNOME
- [x] [libidn](https://www.gnu.org/software/libidn/) International domain name library
- [x] [libmetalink](https://launchpad.net/libmetalink/) C library to parse Metalink XML files
- [x] [libssh2](https://libssh2.org/) C library implementing the SSH2 protocol
- [x] [lzlib](https://www.nongnu.org/lzip/lzlib.html) Data compression library
- [x] [mat2](https://0xacab.org/jvoisin/mat2) Metadata anonymization toolkit
- [x] [maven](https://maven.apache.org/) Java-based project management
- [x] [maven-completion](https://github.com/juven/maven-bash-completion) Bash completion for Maven
- [x] [micronaut](https://micronaut.io/) Modern JVM-based framework for building modular microservices
- [x] [minikube](https://minikube.sigs.k8s.io/) Run a Kubernetes cluster locally
- [x] [nghttp2](https://nghttp2.org/) HTTP/2 C Library
- [x] [node](https://nodejs.org/) Platform built on V8 to build network applications
- [x] [ossp-uuid](https://web.archive.org/web/www.ossp.org/pkg/lib/uuid/) ISO-C API and CLI for generating UUIDs
- [x] [packer](https://packer.io) Tool for creating identical machine images for multiple platforms
- [x] [packer-completion](https://github.com/mrolli/packer-bash-completion) Bash completion for Packer
- [x] [pip-completion](https://github.com/ekalinin/pip-bash-completion) Bash completion for Pip
- [x] [plantuml](https://plantuml.com/) Draw UML diagrams
- [x] [protobuf](https://github.com/protocolbuffers/protobuf/) Protocol buffers (Google's data interchange format)
- [x] [pstree](http://www.thp.uni-duisburg.de/pstree/) Show ps output as a tree
- [x] [ruby](https://www.ruby-lang.org/) Powerful, clean, object-oriented scripting language
- [x] [sbt](https://www.scala-sbt.org/) Build tool for Scala projects
- [x] [scala](https://www.scala-lang.org/) JVM-based programming language
- [x] [shellcheck](https://www.shellcheck.net/) Static analysis and lint tool, for (ba)sh scripts
- [x] [sqlparse](https://github.com/andialbrecht/sqlparse) Non-validating SQL parser
- [x] [ssh-copy-id](https://www.openssh.com/) Add a public key to a remote machine's authorized_keys file
- [x] [sshuttle](https://github.com/sshuttle/sshuttle) Proxy server that works as a poor man's VPN
- [x] [swagger-codegen](https://swagger.io/swagger-codegen/) Generate clients, server stubs, and docs from an OpenAPI spec
- [x] [telnet](https://opensource.apple.com/) User interface to the TELNET protocol
- [x] [terminal-notifier](https://github.com/julienXX/terminal-notifier) Send macOS User Notifications from the command-line
- [x] [terraform](https://www.terraform.io/) Tool to build, change, and version infrastructure
- [x] [tree](http://mama.indstate.edu/users/ice/tree/) Display directories as trees (with optional color/HTML output)
- [x] [vagrant-completion](https://github.com/hashicorp/vagrant) Bash completion for Vagrant
- [x] [wget](https://www.gnu.org/software/wget/) Internet file retriever
- [x] [yq](https://github.com/mikefarah/yq) Process YAML documents from the CLI

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
