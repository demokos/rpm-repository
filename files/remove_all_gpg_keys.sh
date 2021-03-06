#!/bin/bash

echo -n "Private keys to remove: "
for expiredKey in $(gpg2 --list-secret-keys | awk '/^sec.*/ {id=$2; sub(/^.*\//, "", id); print id}' | fmt -w 999 ); do
    echo -n "$expiredKey"
    # gpg2 --batch --quiet --delete-secret-keys.expect $expiredKey >/dev/null 2>&1
    ./delete-secret-keys.expect $expiredKey
    if [ $? -eq 0 ]; then
        echo -n "(OK), "
    else
        echo -n "(FAIL), "
    fi
done
echo done.

echo -n "Public keys to remove: "
for expiredKey in $(gpg2 --list-keys | awk '/^pub.*/ {id=$2; sub(/^.*\//, "", id); print id}' | fmt -w 999 ); do
    echo -n "$expiredKey"
    gpg2 --batch --quiet --delete-keys --yes $expiredKey >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -n "(OK), "
    else
        echo -n "(FAIL), "
    fi
done
echo done.

# echo -n "Update Keys: "
# for keyid in $(gpg -k | grep ^pub | grep -v expired: | grep -v revoked: | cut -d/ -f2 | cut -d' ' -f1); do
#     echo -n "$keyid"
#     gpg2 --batch --quiet --edit-key "$keyid" check clean cross-certify save quit > /dev/null 2>&1
#     if [ $? -eq 0 ]; then
#         echo -n "(OK), "
#     else
#         echo -n "(FAIL), "
#     fi
# done
# echo done.

gpg2 --batch --quiet --refresh-keys > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Refresh OK"
else
    echo "Refresh FAIL."
fi
