#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail

declare chroot_dir=$1

chroot $1 $SHELL -ex <<'EOS'
  until curl -fsSkL -o /etc/yum.repos.d/hop5.repo http://www.hop5.in/yum/el6/hop5.repo; do
    sleep 1
  done
EOS
