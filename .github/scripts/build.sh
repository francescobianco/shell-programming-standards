#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Missing shell nane"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Missing shell binary"
  exit 1
fi

test_name=$1
test_shell=$2
test_version=$(bash .github/scripts/version.sh $2)

echo "====[ Shell: ${test_name} (${test_shell}) ]===="

find sps/* -type d | while read -r snippet; do
  echo "  - ${snippet}"
  ${test_shell} "${snippet}/code.sh" > "${snippet}/output-actual.txt"

  if diff "${snippet}/output-expected.txt" "${snippet}/output-actual.txt"; then
    test_status="ok"
  else
    test_status="fail"
  fi

  ## Update output-checks.txt
  check_replace="s/^${test_name} ${test_version} .*$/${test_name} ${test_version} ${test_status}/g"
  sed "$check_replace" "${snippet}/output-checks.txt" > "${snippet}/output-checks.tmp"
  mv "${snippet}/output-checks.tmp" "${snippet}/output-checks.txt"
  echo "${test_name} ${test_version} ${test_status}" >> "${snippet}/output-checks.txt"
  sort "${snippet}/output-checks.txt" | uniq > "${snippet}/output-checks.tmp"
  mv "${snippet}/output-checks.tmp" "${snippet}/output-checks.txt"

  sed -n "/## Compatibility/q;p" "${snippet}/README.md" > "${snippet}/README.tmp"

  bash .github/scripts/readme.sh "${snippet}" >> "${snippet}/README.tmp"
  mv "${snippet}/README.tmp" "${snippet}/README.md"
done

echo
