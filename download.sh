#!/bin/bash

# Get the URL of the latest release
url="https://github.com/ecmwf/eccodes/releases/latest"
final_url=$(curl -sSL -w %{url_effective} -o /dev/null "$url")

# Extract the version number from the final URL
version=$(echo "$final_url" | sed -n 's#.*/tag/\(.*\)$#\1#p')
echo "Version: $version"

# Write the version to the version.txt file
echo "$version" > version.txt

# Download the tarball from the release URL
download_url="https://confluence.ecmwf.int/download/attachments/45757960/eccodes-$version-Source.tar.gz"
echo "Downloading from URL: $download_url"
wget "$download_url" -O "eccodes-$version.tar.gz"