#!/bin/bash

LEADERS=("Modi" "CBN" "PAWAN" "JAGAN")

echo "All leaders are: ${$LEADERS[$@]}"
echo "first leader is: ${$LEADERS[$0]}"
echo "third leader is: ${$LEADERS[$2]}"