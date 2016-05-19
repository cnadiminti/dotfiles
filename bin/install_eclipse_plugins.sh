#!/usr/bin/env bash

export DOTFILES_BIN_DIR=`dirname $0`
export REPO_ROOT_DIR=`dirname $0`/..

. $REPO_ROOT_DIR/dotfiles/bash_functions

plugin_install_options=' -clean -purgeHistory
    -application org.eclipse.equinox.p2.director
    -profileProperties org.eclipse.update.install.features=true
    -noSplash
    -repository http://download.eclipse.org/releases/mars/
'

unset features
declare -A features

# Linux tools - https://eclipse.org/linuxtools/
features[org.eclipse.linuxtools.docker.feature.feature.group]=''
features[org.eclipse.tm.terminal.feature.feature.group]=''
features[org.eclipse.linuxtools.rpm.feature.group]=''

# plantuml - http://plantuml.com/eclipse.html
features[net.sourceforge.plantuml.feature.feature.group]='http://plantuml.sourceforge.net/updatesitejuno'

# CDT, Docker
features[org.eclipse.cdt.feature.group]=''
features[org.eclipse.cdt.sdk.feature.group]=''
features[org.eclipse.cdt.autotools.feature.group]=''
features[org.eclipse.cdt.docker.launcher.feature.group]=''

# Python - http://www.pydev.org/update_sites/index.html
features[org.python.pydev.feature.feature.group]='http://pydev.org/updates'
# TCL, Ruby, Shell - http://www.eclipse.org/dltk/
features[org.eclipse.dltk.tcl.feature.group]=''
features[org.eclipse.dltk.ruby.feature.group]=''
features[org.eclipse.dltk.sh.feature.group]=''

# GO - https://goclipse.github.io/
features[goclipse_feature.feature.group]='http://goclipse.github.io/releases'

# XML, DTD and XML Schema Editors, validators, and XML Catalog support - http://www.eclipse.org/webtools/sse
features[org.eclipse.wst.jsdt.feature.feature.group]=''
features[org.eclipse.wst.xml_ui.feature.feature.group]=''
features[org.eclipse.wst.web_ui.feature.feature.group]=''
#features[org.eclipse.wst.server_adapters.feature.feature.group]=''
#features[org.eclipse.wst.xsl.feature.feature.group]=''

# JSON Editor - https://marketplace.eclipse.org/content/json-editor-plugin
features[jsonedit-feature.feature.group]='http://boothen.github.io/Json-Eclipse-Plugin'

# YEdit YAML Editor - https://marketplace.eclipse.org/content/yedit
features[org.dadacoalition.yedit.feature.feature.group]='http://dadacoalition.org/yedit'

# Atlassian JIRA
#features[com.atlassian.connector.eclipse.feature.group]='http://update.atlassian.com/atlassian-eclipse-plugin/rest/e3.7,http://download.eclipse.org/mylyn/releases/latest'

# features[org.eclipse.oomph.workingsets.feature.group]=''
# features[org.eclipse.oomph.preferences.feature.group]=''
# features[org.eclipse.oomph.setup.sdk.feature.group]=''
# features[org.eclipse.oomph.projectconfig.feature.group]=''
# features[org.eclipse.oomph.targlets.feature.group]=''
# features[org.eclipse.oomph.version.feature.group]=''

for key in "${!features[@]}"; do
    cmd="eclipse $plugin_install_options"
    [ ${features[$key]} ] && cmd+=" -repository ${features[$key]}"
    cmd+=" -installIU $key"
    execute-command "$cmd" "Installing eclipsing feature $key"
done
