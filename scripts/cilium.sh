#!/usr/bin/env bash

set -e
set -o pipefail

cilium install --wait
cilium hibble enable --ui
