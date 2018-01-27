#!/bin/sh
if [[ "$OSTYPE" == "darwin"* ]]; then
  brew services start mysql
fi
rails server
