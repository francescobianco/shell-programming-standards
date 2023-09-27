#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Missing shell nane"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Missing shell binary"
  exit 1
fi

