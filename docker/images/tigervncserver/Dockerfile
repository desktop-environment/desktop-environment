ARG DESKTOP_ENVIRONMENT_BASE
FROM $DESKTOP_ENVIRONMENT_BASE:latest

# Ensure the x server session is blank
RUN mkdir $HOME/.vnc && \
  echo sleep infinity > $HOME/.vnc/xstartup && \
  chmod +x $HOME/.vnc/xstartup

# Start vncserver
ENTRYPOINT ["vncserver"]
