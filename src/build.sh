#!/bin/bash
set -e -o pipefail
read -ra arr <<< "$@"
version=${arr[1]}
trap 0 1 2 ERR
# Ensure sudo is installed
apt-get update && apt-get install sudo -y
bash /tmp/linux-on-ibm-z-scripts/OpenResty/${version}/build_openresty.sh -y
tar cvfz openresty-${version}-linux-s390x.tar.gz /usr/local/openresty/ 
exit 0
