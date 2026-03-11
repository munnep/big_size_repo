#!/bin/bash

# Number of iterations - change this as needed
ITERATIONS=${1:-100}

echo "Starting $ITERATIONS push iterations..."

for i in $(seq 1 $ITERATIONS); do
    echo "=== Iteration $i of $ITERATIONS ==="
    
    # Make a small noop change (update timestamp in a file)
    echo "# Noop change - iteration $i - $(date)" >> noop_changes.txt
    
    # Git add
    git add noop_changes.txt
    
    # Git commit
    git commit -m "Noop change iteration $i"
    
    # Git push
    git push
    
    if [ $? -ne 0 ]; then
        echo "Push failed at iteration $i"
        exit 1
    fi
    
    echo "Completed iteration $i"
    echo ""
done

echo "All $ITERATIONS iterations completed successfully!"
