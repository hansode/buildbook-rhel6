#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail

declare chroot_dir=$1

chroot $1 $SHELL -ex <<'EOS'
  until curl -fsSkL -o /etc/yum.repos.d/openvnet.repo https://raw.githubusercontent.com/axsh/openvnet/develop/deployment/yum_repositories/development/openvnet.repo; do
    sleep 1
  done


  until curl -fsSkL -o /etc/yum.repos.d/openvnet-third-party.repo https://raw.githubusercontent.com/axsh/openvnet/develop/deployment/yum_repositories/development/openvnet-third-party.repo; do
    sleep 1
  done
EOS
