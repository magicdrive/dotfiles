#! /bin/sh

gem list --no-versions | xargs gem uninstall -aIx
exit 0
