FROM alpine/helm:2.16.1 AS helm
FROM google/cloud-sdk:277.0.0-alpine AS gcloud

FROM alpine:3.11

COPY --from=helm /usr/bin/helm /usr/local/bin/helm
COPY --from=gcloud /google-cloud-sdk/bin/gcloud /usr/local/bin/gcloud

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
