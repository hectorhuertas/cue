package kube

import (
	"encoding/yaml"
	"tool/cli"
)

command: build: {
	task: print: cli.Print & {
		text: yaml.MarshalStream(objects)
	}
}

command: make: {
	task: print: cli.Print & {
		text: yaml.Marshal(kube)
	}
}

objects: [ for kind in kube for object in kind { object } ]
