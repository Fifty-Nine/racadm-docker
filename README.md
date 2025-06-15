# racadm-docker
Yet Another Racadm In A Docker Container Thing

I found that most of the extant projects that provide `racadm` in a container
environment rely on a CentOS package manager that is now broken due to link rot.
This container is based on the most recent supported (now EOL) release of racadm
on an Ubuntu Jammy base.

# How to Use

This container acts as a drop-in replacement for the `racadm` command. Assuming
you have docker running, just spin it up and pass `racadm` options as you would
normally:

```
docker run --rm -ti ghcr.io/fifty-nine/racadm-docker:main -r 192.168.0.120 -u racuser1 -p aygqt12a getsysinfo
```

I recommend putting this into an alias or wrapper script to avoid e.g.
forgetting to pass `--rm`:

```
alias racadm='docker run --rm -ti ghcr.io/fifty-nine/racadm-docker:main'
racadm -r 192.168.0.120 -u racuser1 -p aygqt12a getsysinfo
```
