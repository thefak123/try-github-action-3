#
# Builds a Docker image.
#
# Environment variables:
#
#   CONTAINER_REGISTRY - The hostname of your container registry.
#   VERSION - The version number to tag the images with.
#
# Usage:
#
#       ./scripts/build-image.sh
#

# Basically try to build the image

# This make sure that $CONTAINER_REGISTRY" and "$VERSION" environtment variables are exist
set -u # or set -o nounset
: "$CONTAINER_REGISTRY"
: "$VERSION"

# You can directly run this script, like this : ./build-image.sh
docker build -t $CONTAINER_REGISTRY/video-streaming-local:$VERSION --file ./Dockerfile-prod .
