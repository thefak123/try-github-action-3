#
# Publishes a Docker image.
#
# Environment variables:
#
#   CONTAINER_REGISTRY - The hostname of your container registry.
#   REGISTRY_UN - User name for your container registry.
#   REGISTRY_PW - Password for your container registry.
#   VERSION - The version number to tag the images with.
#
# Usage:
#
#       ./scripts/push-image.sh
#
# Basically try to upload the create image into container registry

# This make sure that all of defined environtment variables are exist
set -u # or set -o nounset
: "$CONTAINER_REGISTRY"
: "$VERSION"
: "$REGISTRY_UN"
: "$REGISTRY_PW"

# First login to container registry
docker login $CONTAINER_REGISTRY --username $REGISTRY_UN --password $REGISTRY_PW

# Then upload it
docker push $CONTAINER_REGISTRY/video-streaming-local:$VERSION
