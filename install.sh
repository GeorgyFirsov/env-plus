#!/bin/zsh

if [[ $# -ne 1 ]]; then
    echo "Wrong number of arguments. Usage: ./install.sh </path/to/profile-file>" >&2
    return 1
fi

CURRENT_DIR=$(dirname -- "$(readlink -f -- "$0";)";)
ENVPLUS=$CURRENT_DIR/src
ENVS_DIR=~/.envs
PROFILE_FILE=$1

if [ ! -f $PROFILE_FILE ]; then
    echo "Profile file doesn't exist"
    return 1
fi

echo "[i] Using the following 'env-plus' scripts directory: $ENVPLUS" >&1
echo "[i] Profile file: $PROFILE_FILE" >&1

#
# Write header
#

echo "" >> $PROFILE_FILE
echo "# Begin environment management section" >> $PROFILE_FILE
echo "#" >> $PROFILE_FILE

#
# Set variables
#

echo "[i] Setting environment variables" >&1

echo "export ENVPLUS=$ENVPLUS" >> $PROFILE_FILE
echo "export ENVS=$ENVS_DIR" >> $PROFILE_FILE

echo "[+] Environment variables are written"

#
# Now let's add commands
#

echo "[i] Adding components to profile file" >&1

echo "alias runenv=\"source \$ENVPLUS/runenv.sh\"" >> $PROFILE_FILE
echo "alias addenv=\"source \$ENVPLUS/addenv.sh\"" >> $PROFILE_FILE
echo "alias subenv=\"source \$ENVPLUS/subenv.sh\"" >> $PROFILE_FILE
echo "alias mkenv=\"\$ENVPLUS/mkenv.sh\"" >> $PROFILE_FILE
echo "alias rmenv=\"\$ENVPLUS/rmenv.sh\"" >> $PROFILE_FILE

echo "[+] Components are successfully added to profile file" >&1

#
# Write trailer
#

echo "#" >> $PROFILE_FILE
echo "# End environment management section" >> $PROFILE_FILE
echo "" >> $PROFILE_FILE

#
# Set permissions
#

echo "[i] Setting 'execute' permission for added scripts via 'chmod u+x \$ENVPLUS/*.sh'" >&1

chmod u+x $ENVPLUS/*.sh

echo "[+] Permissions are configured" >&1

#
# Done
#

echo "[+] Installation completed. Please source your profile file or restart terminal" >&1

