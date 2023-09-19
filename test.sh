#!/usr/bin/env sh

echo "# Shell Programming Standards" > README.md

find sps/* -type d | while read -r snippet; do
  echo "==> ${snippet}"
  $1 "${snippet}/code.sh" > "${snippet}/output-actual.txt"
  diff "${snippet}/output-actual.txt" "${snippet}/output-expected.txt"
done

