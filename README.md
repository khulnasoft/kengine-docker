[![kengine on DockerHub][dockerhub-image]][dockerhub-url]
[![Docker Build][gh-actions-image]][gh-actions-url]

# [kengine](https://hub.docker.com/_/kengine)

This is the repo where the official `kengine` Docker image sources live.

**Please see https://hub.docker.com/_/kengine for documentation.**

If you have an issue or suggestion for the Docker image, please [open an issue](https://github.com/khulnasoft/kengine-docker/issues/new).

If you'd like to suggest updates to the [image documentation](https://hub.docker.com/_/kengine), see https://github.com/docker-library/docs/tree/master/kengine.

## Release instructions (for maintainers)

The release process is currently semi-automated, held together with shell scripts and gomplate (and duct tape).

1. update the `stackbrew-config.yaml` file (update `kengine_version`) and save
2. run `make` (note that you'll need [`gomplate`](https://docs.gomplate.ca/installing/) on your path)
3. commit all changed Dockerfiles and `stackbrew-config.yaml` and issue a PR
4. once the CI passes and the PR is merged, pull and run `make all` - this should update the `library/kengine` file
5. commit the updated `library/kengine` file and push directly to `master`
6. Finally, issue a PR for [`docker-library/official-images/library/kengine`](https://github.com/docker-library/official-images/blob/master/library/kengine) containing the updated `library/kengine` file

## License

View [license information](https://github.com/khulnasoft/kengine/blob/master/LICENSE) for the software contained in this image.

[gh-actions-image]: https://github.com/khulnasoft/kengine-docker/workflows/Docker%20Build/badge.svg?branch=master
[gh-actions-url]: https://github.com/khulnasoft/kengine-docker/actions?workflow=Docker%20Build&branch=master

[dockerhub-image]: https://img.shields.io/badge/docker-ready-blue.svg
[dockerhub-url]: https://hub.docker.com/_/kengine
