#! /bin/sh -
reflex -r '\.go$' -s -- sh -c 'go run -tags=debug . 2>&1 | pp'
