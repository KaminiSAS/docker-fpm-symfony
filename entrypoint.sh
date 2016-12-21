#! /bin/sh

# Setup permissions
# See http://symfony.com/doc/current/setup/file_permissions.html
setfacl -R -m u:"$HTTPD_USER":rwX -m u:"$CONSOLE_USER":rwX var
setfacl -dR -m u:"$HTTPD_USER":rwX -m u:"$CONSOLE_USER":rwX var

exec "$@"
