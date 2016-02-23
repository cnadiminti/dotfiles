#!/usr/bin/env bash

eclipse \
    -clean -purgeHistory \
    -application org.eclipse.equinox.p2.director \
    -profileProperties org.eclipse.update.install.features=true \
    -noSplash \
    -repository \
http://download.eclipse.org/releases/mars/,\
http://pydev.org/updates/,\
http://plantuml.sourceforge.net/updatesitejuno/,\
http://dadacoalition.org/yedit/,\
http://sourceforge.net/projects/shelled/files/shelled/update,\
http://www.nodeclipse.org/updates/markdown/,\
https://raw.github.com/satyagraha/gfm_viewer/master/p2-composite/,\
http://workspacemechanic.eclipselabs.org.codespot.com/git.update/mechanic/,\
http://bcsw.net/plugins/ \
    -installIU \
org.python.pydev.feature.feature.group,\
net.sourceforge.shelled.feature.group,\
org.dadacoalition.yedit.feature.feature.group,\
markdown.editor.feature.feature.group,\
code.satyagraha.gfm.viewer.feature.feature.group,\
net.bcsw.yang_editor.feature.feature.group,\
com.google.eclipse.mechanic.feature.group,\
org.eclipse.wst.xml_ui.feature.feature.group,\
org.eclipse.dltk.tcl.feature.group,\
net.sourceforge.plantuml.feature.feature.group,\
org.eclipse.linuxtools.rpm.feature.group,\
net.bcsw.yang_editor.feature.feature.group,\
org.eclipse.dltk.ruby.feature.group
