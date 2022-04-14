#!/bin/bash

export my_dir=$(pwd)

echo "Loading configuration..."
source "${my_dir}"/"${FLUX}"

git config --global user.email "${GITHUB_EMAIL}"
git config --global user.name "${GITHUB_USER}"

mkdir -p "${ROM_DIR}"
cd "${ROM_DIR}"

source "${my_dir}"/config.sh