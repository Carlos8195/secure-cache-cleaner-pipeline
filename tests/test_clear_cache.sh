#!/bin/bash
set -e

echo "Running clear_cache.sh test..."

# Confirm script exists
test -f ./clear_cache.sh

# Confirm script is executable
test -x ./clear_cache.sh

# Run the script
./clear_cache.sh

echo "Test passed."
