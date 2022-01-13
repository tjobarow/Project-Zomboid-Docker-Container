#!/bin/bash

#Change to user home dir
cd {$HOMEDIR}

#Make directory for steam pz server install
mkdir steam_install

#Use steamcmd to download and install pz dedicated server
bash ${HOMEDIR}/steamcmd/steamcmd.sh +force_install_dir "{$HOMEDIR}/steam_install" +login anonymous +app_update 380870 +quit

#Make default directory
mkdir Zomboid/Server

#Download config files and unpack tar.gz.
wget 
