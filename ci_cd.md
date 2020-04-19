### Sentry config

The DSN needs to be supplied by the build environment.

For native Android, this is via a properties file in: `app/src/main/resources` which is created by the following custom script in Codemagic and for Flutter, this is via a Dart file created at build time also by this script:
```shell
#!/usr/bin/env sh
set -e # exit on first failed commandset
mkdir -p $FCI_BUILD_DIR/android/app/src/main/resources
echo dsn=$SENTRY_DSN > $FCI_BUILD_DIR/android/app/src/main/resources/sentry.properties
echo "const DSN='$SENTRY_DSN';" > $FCI_BUILD_DIR/lib/env.dart
```