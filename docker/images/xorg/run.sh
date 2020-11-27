REPO_ROOT=$(dirname $(readlink -f $0))/../../..
IMAGE=$(basename $(dirname $0))

# Export desktop environment shell configuration
eval "$($REPO_ROOT/docker/scripts/environment.sh)"

# Start the x11 container
docker run \
  --cap-add SYS_ADMIN \
  --cap-add SYS_TTY_CONFIG \
  --detach \
  --device /dev/dri \
  --device /dev/input \
  --device /dev/snd \
  --device /dev/tty$DESKTOP_ENVIRONMENT_HOST_TTY \
  --device /dev/video0 \
  --env DISPLAY=${DISPLAY-:1} \
  --group-add audio \
  --group-add input \
  --group-add plugdev \
  --group-add tty \
  --group-add video \
  --interactive \
  --name $DESKTOP_ENVIRONMENT_CONTAINER_NAME-$IMAGE \
  --network $DESKTOP_ENVIRONMENT_DOCKER_NETWORK \
  --rm \
  --volume /dev/displaylink:/dev/displaylink \
  --volume /dev/shm:/dev/shm \
  --volume /run/udev:/run/udev \
  --volume DESKTOP_ENVIRONMENT_STATE_TMUX:$DESKTOP_ENVIRONMENT_STATE_TMUX \
  --volume DESKTOP_ENVIRONMENT_STATE_X11:$DESKTOP_ENVIRONMENT_STATE_X11 \
  $DESKTOP_ENVIRONMENT_REGISTRY/$DESKTOP_ENVIRONMENT_CONTAINER_IMAGE-$IMAGE:$DESKTOP_ENVIRONMENT_CONTAINER_TAG \
  $@
