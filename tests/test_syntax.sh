#!/bin/bash

echo "Checking PHP syntax..."

for file in $(find . -name "*.php"); do
    php -l "$file"
    if [ $? != 0 ]; then
        echo "❌ Syntax error in $file"
        exit 1
    fi
done

echo "✔️ All PHP files have valid syntax."
