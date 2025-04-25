#!/usr/bin/env bash

docker build -t "dominikhillmann/huettenglotzer:$(cat VERSION)" .
