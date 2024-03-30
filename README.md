# check-usage

## What is this?
This is a very simple and flexible kubectl plugin that outputs 
1. Pod CPU/Memory requests/limits and real usage at the moment.
2. Node CPU/Memory sizing and real usage across the node level.

## How to use it?
The plugin supports selecting the following options:
1. `resource` This allows you to select which resource's usage to track. Currently supports pods and nodes.
2. `namespace` This is specific to pod level queries. You can use the namespace flag to set the namespace to use.
3. `label` This is a filter/selector of both pod and node level resources using labels as selectors. You still need to pass in the namespace for pods for this flag to work.
Examples input
```
    kubectl check-usage -n default -r pod
    kubectl check-usage -r node
    kubectl check-usage -r node -l traderepublic.com/instancegroup=cashbalance
```
Example output
```
#> kubectl check-usage -r node -l traderepublic.com/instancegroup=cashbalance
Node resource usage requested!
NodeName                                          CPU           CPUUsage            Mem           MemUsage 
ip-10-0-49-171.eu-central-1.compute.internal      "8"           "50m"               "32329184Ki"  "1289232Ki" 
ip-10-0-64-117.eu-central-1.compute.internal      "8"           "50m"               "32329176Ki"  "1485144Ki" 
ip-10-0-85-198.eu-central-1.compute.internal      "8"           "38m"               "32329184Ki"  "1391892Ki" 

```

## Prerequisites
The plugin would need 
1. `kubectl` cli installed.
2. `jq` installed, atleast version 1.6 or above.
3. Metrics server installation(this plugin relies on metrics server installed to be able to get usage figures correctly.). If you are using a managed kubernetes cluster and unsure if metrics-server is installed check if `kubectl top node` returns an output. If yes then its installed.

## Releasing new version
1. Create PR towards main.
2. Include the keyword `release` in commit message.
