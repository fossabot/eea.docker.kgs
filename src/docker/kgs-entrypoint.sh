#!/bin/bash

echo "Fixing permissions for external /data volumes"
mkdir -vp /data/logs /data/downloads/pdf /data/downloads/tmp /data/suggestions /plone/instance/src
chown -v plone:plone /data/logs /data/downloads /data/downloads/pdf /data/downloads/tmp /data/suggestions /plone/instance/src

exec gosu plone /plone-entrypoint.sh "$@"
