package kube

import (
	 "github.com/utilitywarehouse/system-cue/alert"
	otra "github.com/utilitywarehouse/system-cue/alert/test/alertGroups/test"
	otro "github.com/utilitywarehouse/system-cue/alert/test/alertGroups/test"
)

_env: {wonky: "BALUMBA",var1: "VAR1", var2: "VAR2", faraday: false, provider: "AWS", tier: "EXP-1"}
_env: {configMapName: "one"}
_env: {fileName: "two"}

_envs: {
  "otro": {name: "UNO", _env}
  "otra": {name: "DOS", _env}
}

_otro: otro & {#env: _envs.otro}
_otra: otra & {#env: _envs.otra}

_alertGroupDataMap: "\(_otro.alertGroup.name)": _otro.alertGroup
_alertGroupDataMap: "\(_otra.alertGroup.name)": _otra.alertGroup

_alertGroupDataMap: DOS: rules: rule2: record: "awesome"

_alert: alert & {#data: _alertGroupDataMap} & {#env: _env}
_alert: alert & {#env: disable: groups: hidden: true}
_alert: alert & {#env: disable: rules: UNO: rule1: true}

kube: _alert.kube
