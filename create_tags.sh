#!/bin/bash

# Function to create a tag
create_tag() {
    git tag $1
}

# Export the function so that it's available to parallel
export -f create_tag

# Generate 30000 UUIDs, and create a tag for each using parallel processing
seq 30000 | parallel -N0 -j $(nproc) 'uuidgen | xargs -I {} bash -c "create_tag {}"'
