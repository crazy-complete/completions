#!/bin/bash

cd "$(dirname "$0")"

find . | grep '.pkg.yaml' | sed 's|^./|- "|; s|$|"|' > index.yaml
