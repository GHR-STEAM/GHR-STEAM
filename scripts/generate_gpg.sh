#!/usr/bin/env bash
set -e
echo "Generating GPG key interactively..."
gpg --full-generate-key
echo "Export public key (copy and add to GitHub -> Settings -> SSH and GPG keys):"
gpg --armor --export YOUR_KEY_ID
echo "Then run:"
echo "git config --global user.signingkey YOUR_KEY_ID"
echo "git config --global commit.gpgSign true"
