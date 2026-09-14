#!/bin/bash

push_url=$(git remote get-url --push origin 2>/dev/null)

echo
if [ "$push_url" = "no_push" ]; then
    echo "Push Status: DISABLED"
else
    echo "Push Status: ENABLED"
    echo "Push URL: $push_url"
fi

echo
echo "1) Disable push"
echo "2) Enable push"
read -p "Choose [1/2]: " choice

case "$choice" in
    1)
        git remote set-url --push origin no_push
        echo "Push Status: DISABLED"
        ;;
    2)
        git config --unset-all remote.origin.pushurl 2>/dev/null || true
        echo "Push Status: ENABLED"
        ;;
    *)
        echo "Invalid choice."
        exit 1
        ;;
esac