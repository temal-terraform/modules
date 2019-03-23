# VPC module

This module creates the following things in an eu-central-1
AWS account:

- A VPC with a configurable 10.x/16 IPv4 CIDR block
- Three subnets (public, private, spare) in all availability zones
- A DHCP configuration containing the AWS ntp server
- A default SecurityGroup (allowing port 22 incoming and port 32768-65535
  outgoing)
- A second SecurityGroup (allowing all internal traffic for the 10/8 IPv4 CIDR
  block)
- Network ACLs in the public subnets (allowing incoming and outgoing traffic
  on ports 22,80,443,587,1024-65535)
- An InternetGateway to allow connections to the public internet
- Routing tables for all subnets

## Module input variables

### Required

- `tenant` - Tenant name
- `environment` - Environment name
- `second_octet` - The second octet of an IPv4 CIDR bloc (e.g. 123 for
  10.123.0.0/16)

## Module output variables

None

## Usage

```
terragrunt = {
  terraform {
    source = "git::git@github.com:temal-terraform/modules.git//vpc?ref=v0.0.1"
  }
}
```

## Todo

- Differentiate if this module is used with a NAT instance or a NAT gateway
- IPv6
