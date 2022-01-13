############################################################
# Dockerfile that builds a Project Zomboid Gameserver
############################################################
FROM cm2network/steamcmd:root

LABEL maintainer="tjobarow@gmail.com"
ENV STEAMAPPID 380870
ENV STEAMAPP project-zomboid
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"
ENV DLURL https://raw.githubusercontent.com/CM2Walki/Squad:Q



RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		wget=1.20.1-1.1 \
	&& wget "${DLURL}/master/etc/entry.sh" -O "${HOMEDIR}/entry.sh" \
	&& mkdir -p "${STEAMAPPDIR}" \
	&& chmod 755 "${HOMEDIR}/entry.sh" "${STEAMAPPDIR}" \
	&& chown "${USER}:${USER}" "${HOMEDIR}/entry.sh" "${STEAMAPPDIR}" \
	&& rm -rf /var/lib/apt/lists/*

# Steam ports
ENV STEAM_PORT_1=8766  \
    STEAM_PORT_2=8767 \
    RCON_PORT=27015 \
    RCON_PASSWORD="rcon-password" \
    SERVER_NAME="pzserver" \
    SERVER_PASSWORD="pz_server" \
    SERVER_PUBLIC_NAME="Project Zomboid Server" \
    SERVER_PUBLIC_DESC="Project Zomboid Server" \
    ADMIN_PASSWORD="pz_server" \
    SERVER_PORT=16261 \
    PLAYER_PORTS=16262-16272

USER ${USER}

WORKDIR ${HOMEDIR}

#Export ports
EXPOSE ${STEAM_PORT_1}/udp ${STEAM_PORT_2}/udp ${SERVER_PORT}/udp ${PLAYER_PORTS} ${RCON_PORT}

CMD ["bash", "entry.sh"]

RUN mkdir ${HOMEDIR}/server-data && \
    chown ${USER}:${USER} ${HOMEDIR}/server-data
    ln -s ${HOMEDIR}/server-data ${HOMEDIR}/Zomboid/Server

VOLUME ["/server-data","/server-data"]
