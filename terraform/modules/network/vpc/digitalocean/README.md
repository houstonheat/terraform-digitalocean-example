## DigitalOcean network module
This directory contains code as a basic network module of DigitalOcean network resources for a complete project configuration.

### Resources
* `digitalocean_vpc` - VPCs are virtual networks containing resources that can communicate with each other in full isolation, using private IP addresses.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enable\_vpc | A boolean flag to enable/disable vpc. | `bool` | `true` | no |
| ip\_ragne | The range of IP addresses for the VPC in CIDR notation. Network ranges cannot overlap with other networks in the same account and must be in range of private addresses as defined in RFC1918. It may not be larger than /16 or smaller than /24. | `string` | `"10.10.0.0/16"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| region | The region to create VPC, like `london-1` , `bangalore-1` ,`newyork-3` `toronto-1`. | `string` | `"bangalore-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| created\_at | The date and time of when the VPC was created. |
| default | A boolean indicating whether or not the VPC is the default one for the region. |
| id | The unique identifier for the VPC.. |
| urn | The uniform resource name (URN) for the VPC. |