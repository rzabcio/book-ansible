Vagrant in WSL
================================

Link: https://github.com/deluxebrain/wsl-vagrant-hyperv-setup

TLDR
--------------------------------
# Enable Hyper-V and set the VAGRANT_DEFAULT_PROVIDER environment variable to "hyperv"
# Install Vagrant from the official Vagrant repository
# Set the `VAGRANT_WSL_ENABLE_WINDOWS_ACCESS` environment variable to "1"
# Store your Vagrant project repos within your user home directory on the Windows file system
# Set the VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH environment variable to your Windows user home folder
# Run WSL as administrator
# Select the "Default Switch" Hyper-V switch
