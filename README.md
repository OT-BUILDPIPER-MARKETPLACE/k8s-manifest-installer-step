# k8s-manifest-instsaller-step

I'll let people to use all the available OpsTree k8's manifest apply, update and delete via this step

## Setup
* Clone the code available at [k8s-manifest-installer-step](https://github.com/OT-BUILDPIPER-MARKETPLACE/k8s-manifest-installer-step)

* Build the docker image

```
git submodule init
git submodule update
docker build -t ot/k8s-manifest-installer:0.1 .
```
