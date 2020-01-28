FROM alpine/helm:2.16.1 AS helm
FROM google/cloud-sdk:277.0.0-alpine AS gcloud

FROM alpine:3.11

RUN apk add --update --no-cache python3 \
    && rm -rf /var/cache/apk/*

COPY --from=helm /usr/bin/helm /usr/local/bin/helm
COPY --from=gcloud /google-cloud-sdk/bin/gcloud /usr/lib/google-cloud-sdk/bin/gcloud
COPY --from=gcloud /google-cloud-sdk/lib /usr/lib/google-cloud-sdk/lib

ENTRYPOINT ["/usr/local/bin/helm"]
