# terraform-tutorial

## Build

```sh
docker build --tag terraform-tutorial .
```

## Run

```sh
docker run -it --platform linux/amd64 -v $(pwd)/work:/work terraform-tutorial
```

## Trouble shooting

* The following error: `Error: Failed to download module Could not download module ...: error downloading ...: /usr/bin/git exited with 128: fatal: detected dubious ownership in repository at ...`

```sh
# in the container
git config --global --add safe.directory "*"
```

* `Error: storage.NewClient() failed: dialing: google: could not find default credentials. See https://developers.google.com/accounts/docs/application-default-credentials for more information.`

```sh
# in the container
gcloud init --skip-diagnostics
gcloud auth application-default login
```