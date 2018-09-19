#!/bin/sh

# Install Agent Node
mkdir /tmp/dcos && cd /tmp/dcos
/usr/bin/curl -O ${bootstrap_private_ip}:${dcos_bootstrap_port}/dcos_install.sh
echo "checking for installation.." 
if ( 
    # dcos.target exists and is a directory, OR 
    [[ -d /etc/systemd/system/dcos.target ]] || 
    # dcos.target.wants exists and is a directory, OR 
    [[ -d /etc/systemd/system/dcos.target.wants ]] || 
    # /opt/mesosphere exists and is not an empty directory 
    ( [[ -a /opt/mesosphere ]] && ( ! empty_dir /opt/mesosphere ) ) 
); then 
    echo "previous install found. skipping install" 
    exit 0 
else 
    echo "previous installation not found. executing 'bash dcos_install.sh' 
    bash dcos_install.sh slave 
fi
# Agent Node End

