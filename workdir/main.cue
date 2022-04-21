package kube

import (
	"github.com/utilitywarehouse/system-cue/alert"
	"github.com/utilitywarehouse/system-cue/alert/group/aws"
)

_env: {configMapName: "alerts", fileName: "infra"}
_env: {groupName: "infra"}

_aws: aws & {#env: _env}

_data: "\(_aws.alertGroup.name)": _aws.alertGroup

_alert: alert & {#data: _data} & {#env: _env}

kube: _alert.kube
