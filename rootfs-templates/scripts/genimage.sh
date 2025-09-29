#!/bin/bash

set -e

ROOTFS_PATH=$(find ${PWD} -maxdepth 1 -mindepth 1 -type d -name '.debos-*' -printf '%T@ %p\n' | sort -nr | head -n 1 | awk '{ print $2 }')/root
ROOTFS_SIZE=$(du -sm $ROOTFS_PATH | awk '{ print $1 }')

ZIP_NAME=${1}
WORK_DIR=${ZIP_NAME}.work

clean() {
	rm -rf ${WORK_DIR}
}
trap clean EXIT

# Crate temporary directory
mkdir ${ZIP_NAME}.work

# copy rootfs content
mkdir -p out
tar -czvf out/${ZIP_NAME}.tar.gz -C ${ROOTFS_PATH} .


echo "done."
