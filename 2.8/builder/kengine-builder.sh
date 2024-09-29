#!/bin/sh
set -eu

args=""
for p; do
	args="$args --with $p"
done

echo "Warning: the kengine-builder script is deprecated and will be removed in the future.
Instead, you should use the xkengine command:

    xkengine build $args
" >&2

# version is inferred from $KENGINE_VERSION (set in the Dockerfile)
# output will be placed in the working dir (/usr/bin as set in the Dockerfile)
xkengine build $args
