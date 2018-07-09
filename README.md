# Handbook Workshop Dockerfile

The included Dockerfile is dedicated to the workshop on the Software Engineering Handbook.

This Dockerfile prepares an Alpine Linux deployment that includes [GoTTY][1], Python3, Pip, git, 
handbook-tools package, and a clone of the handbook-workshop GitHUb repository.

It can be deployed in various ways. The following sections show two deploying examples:

1. [Deploying on 'Zeit now'](#deploying-on-zeit-now)
2. [Deploying Locally](#deploying-locally)

## Deploying on 'Zeit now'

['Zeit now'][2] is a simple solution to deploy, build and scale containers in the cloud.

To deploy the Dockerfile on 'Zeit now', run the following command from the location of the 
Dockerfile:

```bash
$ now
```

On a successful build, you will get back a URL that can be used with a browser.

The container that is running on 'Zeit now' is running GoTTY server that shares the Linux terminal 
as a web application on a specified port (3000 in our case).

## Deploying Locally

To deploy the Dockerfile locally, run the following commands from the location of the Dockerfile:

```bash
$ docker build -t gotty .
$ docker run -p3000:3000 -it --rm gotty
```

Then use the browser to visit: `http://localhost:3000/`

---

[1]: https://github.com/yudai/gotty
[2]: https://zeit.co/now
