REPO_ROOT=$(dirname $(readlink -f $0))/../..

# Export desktop environment shell configuration
export $($REPO_ROOT/docker/scripts/environment.sh)

# Destroy the desktop environment cloud virtual machine
$REPO_ROOT/terraform/scripts/terraform.sh apply \
  -auto-approve \
  -var DESKTOP_ENVIRONMENT_CONTAINER=$DESKTOP_ENVIRONMENT_CONTAINER \
  -var DESKTOP_ENVIRONMENT_REGISTRY=$DESKTOP_ENVIRONMENT_REGISTRY \
  -var owner_host=$(hostname) \
  -var owner_name=$(whoami)
