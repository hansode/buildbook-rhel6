#!/bin/bash
#
# requires:
#  bash
#
set -e

declare abs_dirname=${BASH_SOURCE[0]%/*}/
declare name=$1

[[ -n ${name} ]] || {
  cat <<-EOS >&2
	USAGE
	  $ add-book.sh <name>
	EOS
  exit 1
}


[[ -d ${name} ]] || mkdir ${name}
cd ${name}

: > copy.txt

for i in guestroot xexecscript.d; do
 [[ -d ${i} ]] || mkdir ${i}
done

cat <<'TEMPLATE' > xexecscript.d/${name}.sh
#!/bin/bash
#
# requires:
#  bash
#
set -e

declare chroot_dir=$1

chroot $1 $SHELL -ex <<'EOS'
EOS
TEMPLATE
chmod +x xexecscript.d/${name}.sh

echo "generated => ${name}"