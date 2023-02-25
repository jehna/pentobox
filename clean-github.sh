#!/bin/bash
set -eou pipefail

echo 'Make sure to run:'
echo 'gh auth login --scopes read:packages,delete:packages'

PACKAGES_WITHOUT_TAGS=$(gh api /users/jehna/packages/container/pentobox/versions --paginate | jq -r '.[] | select(.metadata.container.tags | length == 0) | .id')

if [ -z "$PACKAGES_WITHOUT_TAGS" ]; then
  echo 'No packages to delete'
  exit 0
fi

for PACKAGE in $PACKAGES_WITHOUT_TAGS; do
  echo "Deleting package $PACKAGE"
  gh api "/users/jehna/packages/container/pentobox/versions/$PACKAGE" -X DELETE &
done

wait # Wait for all the deletions to finish

echo 'Done'
