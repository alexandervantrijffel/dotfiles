#!/bin/sh
TORUN=${1:-.}
reflex -r '\.go$' -s -- sh -c 'go run -tags=debug . 2>&1 | zap-pretty'

# agozap() {
#   TORUN=${1:-.}
#   echo Running $TORUN}
#   reflex -r '\.go$' -s -- sh -c "go run -tags=debug ${TORUN} 2>&1 | zap-pretty"
# }
