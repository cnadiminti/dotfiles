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
- [x] [Github Atom](https://atom.io/) Text editor
- [x] [Etcher](https://balena.io/etcher) Tool to flash OS images to SD cards & USB drives
- [x] [DBeaver Community Edition](https://dbeaver.io/) Universal database tool and SQL client
- [x] [Docker Desktop](https://www.docker.com/products/docker-desktop) App to build and share containerized applications and microservices
- [x] [Mozilla Firefox](https://www.mozilla.org/firefox/) Web browser
- [x] [f.lux](https://justgetflux.com/) Screen color temperature controller
- [x] [Inconsolata](https://fonts.google.com/specimen/Inconsolata)
- [x] [Google Backup and Sync](https://www.google.com/drive/download/) Back up and sync files with Google Drive
- [x] [Google Chrome](https://www.google.com/chrome/) Web browser
- [x] [Google Cloud SDK](https://cloud.google.com/sdk/) Set of tools to manage resources and applications hosted on Google Cloud
- [x] [Hidden Bar](https://github.com/dwarvesf/hidden/) Utility to hide menu bar items
- [x] [IntelliJ IDEA Community Edition](https://www.jetbrains.com/idea/) IDE for Java development - community edition
- [x] [iTerm2](https://www.iterm2.com/) Terminal emulator as alternative to Apple's Terminal app
- [x] [KDiff3](https://invent.kde.org/sdk/kdiff3) Utility for comparing and merging files and directories
- [x] [Postman](https://www.postman.com/) Collaboration platform for API development
- [x] [Jetbrains PyCharm Community Edition](https://www.jetbrains.com/pycharm/) IDE for Python programming - Community Edition
- [x] [Skype](https://www.skype.com/) Video chat, voice call and instant messaging application
- [x] [Spectacle](https://www.spectacleapp.com/) Move and resize windows with ease
- [x] [Vagrant](https://www.vagrantup.com/) Development environment
- [x] [Oracle VirtualBox](https://www.virtualbox.org/) Free and open-source hosted hypervisor for x86 virtualization
- [x] [Microsoft Visual Studio Code](https://code.visualstudio.com/) Open-source code editor
- [x] [VisualVM](https://visualvm.github.io/) All-in-One Java Troubleshooting Tool
- [x] [Real VNC Viewer](https://www.realvnc.com/) Remote desktop application focusing on security
- [x] [WhatsApp](https://www.whatsapp.com/) Desktop client for WhatsApp
- [x] [Zoom.us](https://www.zoom.us/) Video communication and virtual meeting platform
- [x] [Azul Zulu Java Standard Edition Development Kit](https://www.azul.com/products/core/) OpenJDK distribution from Azul
- [x] [Azul Zulu Java 8 Standard Edition Development Kit](https://www.azul.com/) OpenJDK distribution from Azul
- [x] [ansible](https://www.ansible.com/) Automate deployment, configuration, and upgrading
- [x] [ant](https://ant.apache.org/) Java build tool
- [x] [avro-tools](https://avro.apache.org/) Avro command-line tools and utilities
- [x] [awscli](https://aws.amazon.com/cli/) Official Amazon AWS command-line interface
- [x] [brew-cask-completion](https://github.com/xyb/homebrew-cask-completion) Fish completion for brew-cask
- [x] [clang-format](https://clang.llvm.org/docs/ClangFormat.html) Formatting tools for C, C++, Obj-C, Java, JavaScript, TypeScript
- [x] [cmake](https://www.cmake.org/) Cross-platform make
- [x] [consul-template](https://github.com/hashicorp/consul-template) Generic template rendering and notifications with Consul
- [x] [coreutils](https://www.gnu.org/software/coreutils) GNU File, Shell, and Text utilities
- [x] [docker](https://www.docker.com/) Pack, ship and run any application as a lightweight container
- [x] [docker-clean](https://github.com/ZZROTDesign/docker-clean) Clean Docker containers, images, networks, and volumes
- [x] [docker-compose](https://docs.docker.com/compose/) Isolated development environments using Docker
- [x] [dos2unix](https://waterlan.home.xs4all.nl/dos2unix.html) Convert text between DOS, UNIX, and Mac formats
- [x] [gem-completion](https://github.com/mernen/completion-ruby) Bash completion for gem
- [x] [git](https://git-scm.com) Distributed revision control system
- [x] [go](https://golang.org) Open source programming language to build simple/reliable/efficient software
- [x] [gradle](https://www.gradle.org/) Open-source build automation tool based on the Groovy and Kotlin DSL
- [x] [gradle-completion](https://gradle.org/) Bash and Zsh completion for Gradle
- [x] [grc](http://kassiopeia.juls.savba.sk/~garabik/software/grc.html) Colorize logfiles and command output
- [x] [grpc](https://grpc.io/) Next generation open source RPC library and framework
- [x] [grpcurl](https://github.com/fullstorydev/grpcurl) Like cURL, but for gRPC
- [x] [helmsman](https://github.com/Praqma/helmsman) Helm Charts as Code tool
- [x] [httrack](https://www.httrack.com/) Website copier/offline browser
- [x] [ipcalc](http://jodies.de/ipcalc) Calculate various network masks, etc. from a given IP address
- [x] [jenv](https://www.jenv.be/) Manage your Java environment
- [x] [jinja2-cli](https://github.com/mattrobenolt/jinja2-cli) CLI for the Jinja2 templating language
- [x] [jmeter](https://jmeter.apache.org/) Load testing and performance measurement application
- [x] [jq](https://stedolan.github.io/jq/) Lightweight and flexible command-line JSON processor
- [x] [kompose](https://kompose.io/) Tool to move from `docker-compose` to Kubernetes
- [x] [krew](https://sigs.k8s.io/krew/) Package manager for kubectl plugins
- [x] [maven](https://maven.apache.org/) Java-based project management
- [x] [maven-completion](https://github.com/juven/maven-bash-completion) Bash completion for Maven
- [x] [micronaut](https://micronaut.io/) Modern JVM-based framework for building modular microservices
- [x] [minikube](https://minikube.sigs.k8s.io/) Run a Kubernetes cluster locally
- [x] [nvm](https://github.com/nvm-sh/nvm) Manage multiple Node.js versions
- [x] [ossp-uuid](https://web.archive.org/web/www.ossp.org/pkg/lib/uuid/) ISO-C API and CLI for generating UUIDs
- [x] [packer](https://packer.io) Tool for creating identical machine images for multiple platforms
- [x] [packer-completion](https://github.com/mrolli/packer-bash-completion) Bash completion for Packer
- [x] [pip-completion](https://github.com/ekalinin/pip-bash-completion) Bash completion for Pip
- [x] [plantuml](https://plantuml.com/) Draw UML diagrams
- [x] [postgresql](https://www.postgresql.org/) Object-relational database system
- [x] [pstree](http://www.thp.uni-duisburg.de/pstree/) Show ps output as a tree
- [x] [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv) Pyenv plugin to manage virtualenv
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
- [x] [terraformer](https://github.com/GoogleCloudPlatform/terraformer) CLI tool to generate terraform files from existing infrastructure
- [x] [tree](http://mama.indstate.edu/users/ice/tree/) Display directories as trees (with optional color/HTML output)
- [x] [vagrant-completion](https://github.com/hashicorp/vagrant) Bash completion for Vagrant
- [x] [weaveworks/tap/eksctl](https://eksctl.io/) The official CLI for Amazon EKS
- [x] [wget](https://www.gnu.org/software/wget/) Internet file retriever
- [x] [wrk](https://github.com/wg/wrk) HTTP benchmarking tool
- [x] [yarn](https://yarnpkg.com/) JavaScript package manager
- [x] [yarn-completion](https://github.com/dsifford/yarn-completion) Bash completion for Yarn
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
