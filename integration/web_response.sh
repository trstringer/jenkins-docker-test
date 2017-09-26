#!/bin/bash

for (( i=0; i < 10; i++ ))
do
    curl localhost:8000
    if [ $? -eq 0 ]; then
        echo "passed integration test"
        exit 0
    fi
    echo "iteration $i was unsuccessful"
    sleep 1
done

echo "failed integration test"
exit 1
