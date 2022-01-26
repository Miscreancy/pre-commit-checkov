#!/usr/bin/env bash

set -eo pipefail

function argparse {
  declare -a -g args=()

  argv=($@)
  pattern='^.*\.tf$'

  for item in ${argv[@]}; do
    if [[ $item =~ $pattern ]]; then
      args+=("-f")
    fi
    args+=("$item")
  done
}

function checkov_runner {
	checkov ${args[@]}
}

function main {
	argparse "$@"
	checkov_runner
}

main "$@"
