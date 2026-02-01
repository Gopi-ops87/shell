#!/bin/bash

LEADERS=("Modi" "CBN" "PAWAN" "JAGAN")

echo "All leaders are: [$@]"
echo "first leader is: [$0]"
echo "third leader is: [$2]"