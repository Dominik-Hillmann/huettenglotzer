#!/usr/bin/env bash

helm upgrade \
  --values chart/values.yaml \
  huettenglotzer ./chart \
  --install \
  --namespace huettenglotzer-prod \
  --create-namespace
