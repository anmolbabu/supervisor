#!/usr/bin/bash -e

set -x
oc whoami
oc project
set +x

function oc_process_apply() {
  echo -e "\n Processing template - $1 ($2)\n"
  oc process -f $1 --param-file=$2 | oc apply -f -
}

here=`dirname $0`
template="${here}/template.yaml"
envfile="${here}/supervisor.env"

oc_process_apply "$template" "$envfile"