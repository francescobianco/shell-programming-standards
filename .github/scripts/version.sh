#!/usr/bin/env sh

test_shell=$1

case $(basename "$1") in
  bash)
    ${test_shell} --version | head -n 1 | sed -ne 's/[^0-9]*\(\([0-9]\.\)\{0,4\}[0-9][^.]\).*/\1/p'
    ;;
  dash)
    dpkg -s dash | grep Version | sed -ne 's/[^0-9]*\(\([0-9]\.\)\{0,4\}[0-9][^.]\).*/\1/p'
    ;;
  ksh)
    ${test_shell} --version | head -n 1 | sed -ne 's/[^0-9]*\(\([0-9]\.\)\{0,4\}[0-9][^.]\).*/\1/p'
    ;;
  mksh)
    ${test_shell} --version | head -n 1 | sed -ne 's/[^0-9]*\(\([0-9]\.\)\{0,4\}[0-9][^.]\).*/\1/p'
    ;;
  posh)
    ${test_shell} --version | head -n 1 | sed -ne 's/[^0-9]*\(\([0-9]\.\)\{0,4\}[0-9][^.]\).*/\1/p'
    ;;
  zsh)
    ${test_shell} --version | head -n 1 | sed -ne 's/[^0-9]*\(\([0-9]\.\)\{0,4\}[0-9][^.]\).*/\1/p'
    ;;
  sh)
    ${test_shell} --version | head -n 1 | sed -ne 's/[^0-9]*\(\([0-9]\.\)\{0,4\}[0-9][^.]\).*/\1/p'
    ;;
  *)
    echo "Unknown shell: $1"
    exit 1
    ;;
esac
