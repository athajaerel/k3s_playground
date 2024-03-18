#!/bin/bash
set -uxo pipefail

# pipe 2>/dev/null to silence debug output

ROLES=$(find roles -nowarn -type d -maxdepth 1 -mindepth 1 -exec basename {} \;)

for ROLE in ${ROLES}; do
	# Role is used if it's mentioned in a play
	grep -q "${ROLE}" *.yml
	if [ $? -eq 0 ]; then
		continue
	fi
	# Role is used if it's mentioned in a meta dep
	grep -q "${ROLE}" roles/*/meta/main.yml
	if [ $? -eq 0 ]; then
		continue
	fi
	echo "Role ${ROLE} is not used"
done
