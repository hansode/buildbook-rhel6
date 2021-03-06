#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail

chroot $1 $SHELL -ex <<'EOS'
  curl -fsSkL http://s3tools.org/repo/RHEL_6/s3tools.repo -o /etc/yum.repos.d/s3tools.repo
  yum install --disablerepo=updates -y s3cmd
EOS
