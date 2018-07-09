# Handbook Workshop

The included Dockerfile is dedicated to the workshop on the Software Engineering Handbook.

It prepares an Alpine Linux deployment for ['Zeit now'][1]. This deployment includes [GoTTY][2],
Python3, Pip, git, handbook-tools package, and clone of the handbook-workshop GitHUb repository.

## Deploying on 'Zeit now'

To deploy the Dockerfile on 'Zeit now', run the following command from the location of the 
Dockerfile:

```bash
$ now
```

On successful build, you will get back a URL that can be used with a browser.

The container that is running on 'Zeit now' is running GoTTY server that shares the linux terminal 
as a web application on a specified port (3000 in our case).

## Deploying Locally

To deploy the Dockerfile locally, run the following commands from the location of the Dockerfile:

```bash
$ docker build -t gotty .
$ docker run -p3000:3000 -it --rm gotty
```

Then use the browser to visit: `http://localhost:3000/`

---

[1]: https://zeit.co/now
[2]: https://github.com/yudai/gotty
