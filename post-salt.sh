#!/bin/bash

# Clean up apt-get
apt-get autoremove -y --purge
apt-get clean -y
apt-get purge

# Remove /tmp/
rm -rf /tmp/*