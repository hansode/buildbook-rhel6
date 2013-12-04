#!/bin/bash
#
# requires:
#  bash
#
set -e

declare chroot_dir=$1

chroot $1 $SHELL -ex <<'EOS'
  until curl -fsSkL -o /usr/local/bin/pipework https://raw.github.com/jpetazzo/pipework/master/pipework; do
    sleep 1
  done
  chmod +x /usr/local/bin/pipework
EOS
