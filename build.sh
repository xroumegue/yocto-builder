#! /usr/bin/env bash

rootdir=$(realpath "$(dirname "$0")")

builderdir=${rootdir}/builder
kasdir=${rootdir}/kas

KAS_CONTAINER_IMAGE=${KAS_CONTAINER_IMAGE:-'ghcr.io/siemens/kas/kas:5.2'}
export KAS_CONTAINER_IMAGE

export KAS_CONTAINER=${kasdir}/kas-container

gitconfig_file=${HOME}/.gitconfig

if [ -e "${gitconfig_file}" ];
then
  export GITCONFIG_FILE=${gitconfig_file}
fi

"${builderdir}"/bin/build.sh "$@"
