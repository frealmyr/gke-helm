# gke-helm

Manage GKE clusters using helm, built with gcloud binary as this is required for using GKE provided kubectl contexts.

*Example ZSH function for aliasing helm to docker image:*

```
#!/usr/local/bin/zsh

# Run helm commands with docker

function helm() {

if [[ -z "$DOCKER_RAND_ID" ]]; then
  DOCKER_RAND_ID=$RANDOM
fi

docker run --name "$DOCKER_RAND_ID" --rm -ti \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  -v $HOME/.kube/config:/root/.kube/config \
  -v $HOME/.config/gcloud:/root/.config/gcloud \
  frealmyr/gke-helm:v2.16.1 $argv
}
```

