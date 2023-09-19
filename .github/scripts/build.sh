#!/usr/bin/env sh

test_name=$1
test_shell=$2
test_version=$(sh .github/scripts/version.sh $2)

find sps/* -type d | while read -r snippet; do
  echo "==> ${snippet}"
  ${test_shell} "${snippet}/code.sh" > "${snippet}/output-actual.txt"

  if diff "${snippet}/output-expected.txt" "${snippet}/output-actual.txt"; then
    test_status="ok"
  else
    test_status="fail"
  fi

  ## Update output-checks.txt
  check_replace="s/^${test_name} ${test_version} .*$/${test_name} ${test_version} ${test_status}/g"
  sed -e "$check_replace" "${snippet}/output-checks.txt" > "${snippet}/output-checks.tmp"
  mv "${snippet}/output-checks.tmp" "${snippet}/output-checks.txt"
  echo "${test_name} ${test_version} ${test_status}" >> "${snippet}/output-checks.txt"
  sort "${snippet}/output-checks.txt" | uniq > "${snippet}/output-checks.tmp"
  mv "${snippet}/output-checks.tmp" "${snippet}/output-checks.txt"

  sed -n "/## Compatibility/q;p" "${snippet}/README.md" > "${snippet}/README.tmp"

  sh .github/scripts/readme.sh "${snippet}" >> "${snippet}/README.tmp"
  mv "${snippet}/README.tmp" "${snippet}/README.md"
done
