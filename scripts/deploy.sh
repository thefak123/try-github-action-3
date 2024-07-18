#
# Deploys the Node.js microservice to Kubernetes.
#
# Assumes the image has already been built and published to the container registry.
#
# Environment variables:
#
#   CONTAINER_REGISTRY - The hostname of your container registry.
#   VERSION - The version number of the image to deploy.
#
# Usage:
#
#   ./scripts/deploy.sh
#


set -u # or set -o nounset
: "$CONTAINER_REGISTRY"
: "$VERSION"

# - is a placeholder for a file
envsubst < ./scripts/kubernetes/deploy.yaml | kubectl apply -f -