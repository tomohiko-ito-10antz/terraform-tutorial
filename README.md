# terraform-tutorial

## Build

```sh
docker build --tag terraform-tutorial .
```

## Run

```sh
docker run -it --platform linux/amd64 -v $(pwd):/work terraform-tutorial
```