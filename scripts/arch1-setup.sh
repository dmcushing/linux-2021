#!/bin/bash
# Set Up for Postal Codes Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
useradd -m -s /bin/bash archuser 2>/dev/null
groupadd archgroup 2>/dev/null
rm -Rf ~/Arch1
mkdir ~/Arch1
cp /scripts/data/words ~/Arch1/
chown -R linuxuser:linuxuser ~/Arch1

# install bzip2 if needed
package_name="bzip2"

# Check if the package is installed
if ! dpkg -l | grep -q "^ii  $package_name "; then
    echo "Package '$package_name' is not installed. Installing..."
    
    # Use your package manager to install the package
    apt-get update
    apt-get install -y $package_name
    
    # Check if the installation was successful
    if [ $? -eq 0 ]; then
        echo "Package '$package_name' has been successfully installed."
    else
        echo "Error: Failed to install package '$package_name'."
    fi
else
    echo "Package '$package_name' is already installed."
fi
echo -e "Done setting up."