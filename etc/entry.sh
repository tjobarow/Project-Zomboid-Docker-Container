#!/bin/bash
cd {$HOMEDIR}
mkdir steam_install
bash ${HOMEDIR}/steamcmd/steamcmd.sh +force_install_dir "{$HOMEDIR}/steam_install" +login anonymous +app_update 380870 +quit

#Make default directory
mkdir Zomboid/Server
#Download config files and unpack tar.gz.
wget 
