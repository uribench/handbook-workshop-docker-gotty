# Handbook Workshop Dockerfile

The included Dockerfile is dedicated to the workshop on the Software Engineering Handbook.

This Dockerfile prepares an Alpine Linux deployment that includes [GoTTY](#notes-on-gotty), Python3, 
Pip, git, handbook-tools package, and a clone of the [handbook-workshop][3] GitHub repository. 

## Usage

The Dockerfile can be deployed in various ways. The following sections show two deploying examples:

1. [Deploying on 'Zeit now'](#deploying-on-zeit-now)
2. [Deploying Locally](#deploying-locally)

### Deploying on 'Zeit now'

['Zeit now'][2] is a simple solution to deploy, build and scale containers in the cloud.

To deploy the Dockerfile on 'Zeit now', run the following command from the location of the 
Dockerfile:

```bash
$ now
```

On a successful build, you will get back a URL that can be used with a browser.

### Deploying Locally with GoTTY Service

To deploy the Dockerfile locally, run the following commands from the location of the Dockerfile:

```bash
$ docker build -t handbook/gotty .
$ docker run -it --rm -v$PWD/files/home:/root -p3000:3000 handbook/gotty
```

Then use the browser to visit: `http://localhost:3000/`

Note: The above `docker run` command adds volume mapping to ease local development. 
Changing files in the files/home directory will be seen immediately in the local docker container.

### Deploying Locally as Console

To bypass GoTTY and run bash on the container directly, use the following command:

```bash
$ docker run -it --rm --entrypoint bash handbook/gotty
```

This override the entry point definition in the Dockerfile.


## Notes on GoTTY

[GoTTY][1] is a simple command line tool that turns your CLI tools into web applications. GoTTY does 
that by providing a websocket server that simply relays output from the TTY to clients and receives 
input from clients and forwards it to the TTY.

Usage of GoTTY: `gotty [options] <command> [<arguments...>]`

The deployed container runs a GoTTY server using the following command:

```bash
$ gotty [gotty-options] bash
```

This command instructs GoTTY to share the Linux `bash` terminal as a web application on a specified 
port (3000 in our case). Several `gotty-options` are provided by the `CMD` command in the included
Dockerfile.

GoTTY's default options can be configured by `~/.gotty` profile file. This repository uses a profile 
file at `files/home/.gotty` that is copied to `/root/` by the included Dockerfile. We use it to 
specify `port = 3000` and other simple options.

---

[1]: https://github.com/yudai/gotty
[2]: https://zeit.co/now
[3]: https://github.com/uribench/handbook-workshop
