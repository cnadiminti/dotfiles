function clone-bazaar-branches {
    bzr branch lp:~cisco-openstack/neutron/cis-havana bzr-cisco-neutron-havana
    bzr branch lp:~ubuntu-server-dev/neutron/havana bzr-ubuntu-neutron-havana

    bzr branch lp:~cisco-openstack/neutron/icehouse bzr-cisco-neutron-icehouse
    bzr branch lp:~ubuntu-server-dev/neutron/icehouse bzr-ubuntu-neutron-icehouse

    # bzr branch lp:~cisco-openstack/neutron/juno?? bzr-cisco-neutron-juno
    bzr branch lp:~ubuntu-server-dev/neutron/juno bzr-ubuntu-neutron-juno
}

# GIT CLONE helpers
function clone-cisco-git-repos () {
    for arg in $*; do
        IFS=':' read -a myarray <<< "$arg"
        rep=${myarray[0]}
        if [ "${myarray[1]}" == "" ]; then
            branch='master'
        else
            branch=${myarray[1]}
        fi
        git clone ssh://${USER}@cis-gerrit.cisco.com:29418/$rep -b $branch
        cd $rep
        git remote add gerrit ssh://${USER}@cis-gerrit.cisco.com:29418/$rep
        gitdir=$(git rev-parse --git-dir); scp -c aes128-cbc -p -P 29418 ${USER}@cis-gerrit.cisco.com:hooks/commit-msg ${gitdir}/hooks/
        cd -
    done
}
