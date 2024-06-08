#!/bin/bash


# Check if at least one argument is provided
if [ $# -eq 0 ]; then
  echo "No link is provided please provid link to install the plugin"
  exit 1
fi

plugin_name=$1

github_prepand_for_link="https://github.com/"


plugin_link="$github_prepand_for_link$plugin_name"

plugin_name=${plugin_link##*/}

echo $plugin_link
echo $plugin_name

git submodule add $plugin_link  pack/nvim/start/$plugin_name
