#!/usr/bin/env bash

image_name="dominikhillmann/huettenglotzer:$(cat VERSION)"
docker login && docker push "${image_name}"
