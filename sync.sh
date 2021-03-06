#!/bin/sh

set -ex

REPO_URL=https://jgantunes.github.io/helm-charts
CHARTS=ipfs-testbed
CHARTS_FOLDER=charts

helm init --client-only

for dir in $CHARTS;do
  helm package $dir
  mv $dir*.tgz $CHARTS_FOLDER
done

helm repo index $CHARTS_FOLDER --url $REPO_URL --merge ./index.yaml

set +ex
