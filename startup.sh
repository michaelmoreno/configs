#!/bin/bash
dotfilesDir=$(pwd)

function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M);

  # IF EXISTING SYMLINK
  if [ -h/${1} ]; then
    echo "Removing existing symlink: ${dest}"
    rm ${dest}

  # IF EXISTING FILE
  elif [ -f "${dest}" ]; then
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

    # IF EXISTING DIRECTORY
  elif [ -d "${dest}" ]; then
      echo "Backing up directory: ${dest}"
      mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest};
}