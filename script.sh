#!/usr/bin/env sh

# naming
echo "What is the package name?"
read PACKAGE_NAME
if [ -e $PACKAGE_NAME ]; then
  echo "There is already a folder with this name"
  echo $PACKAGE_NAME
  exit 1
fi

# git
printf '\n'
git clone https://github.com/chlouzada/ts-lib $PACKAGE_NAME
rm -rf $PACKAGE_NAME/.git
git init $PACKAGE_NAME
git -C $PACKAGE_NAME branch -m main

# package.json
printf '\nSetup package.json\n'
PACKAGE_JSON=$(cat $PACKAGE_NAME/package.json)
PACKAGE_JSON=$(echo $PACKAGE_JSON | jq ".name = \"$PACKAGE_NAME\"")
echo $PACKAGE_JSON > $PACKAGE_NAME/package.json

# npm
printf '\n Installing dependencies\n'
npm install --prefix $PACKAGE_NAME
