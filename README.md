<center>
<img alt="PenToBox logo" src="https://raw.githubusercontent.com/jehna/pentobox/master/logo/logo.svg?cache_bust=1" />
</center>

# PenToBox
> A simple Docker container for pentesting

Running Kali on a virtual machine may be an overkill, so this project aims to
have a working simple Docker container for pentesting.

## Getting started

Run the following command (on MacOS) to get started:

```shell
./start.sh
```

This loads the most recent, pre-built Docker container from Github Packages and
runs it locally on your machine.

Yhe `/work` directory is mounted automatically, so you can save your work
between sessions.

## Developing

Build the container locally via:

```shell
docker build .
```

And then you can edit the `./start.sh` to run your local container.

### Building/deploying

The container is built and deployed automatically with Github Actions to Github
Packages.

## Features

This project aims to be:
* Somewhat usable
* Easy to spawn
* Working with MacOS (ARM64)
* A constantly evolving tool to the author's personal needs

## Contributing

Right now this project is intended only for the author to use. If you're
interested in contributing, please reach out to me via a
[Github issue](https://github.com/jehna/pentobox/issues/new).


## Licensing

The code in this project is licensed under MIT license.
