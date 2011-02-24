#!/bin/bash

if [[ $# -eq 0 ]]; then
    flags=(--dirty="+")
else
    flags=("$@")
fi

version=$(git describe --tags --match="v*" "${flags[@]}" | sed -e 's@-\([^-]*\)-\([^-]*\)$@+\1.\2@;s@^v@@')

if grep '#define ForRelease 0' MobileCydia.mm &>/dev/null; then
    version=${version}~srk
fi

echo "${version}"
