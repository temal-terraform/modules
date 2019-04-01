package main

import (
	"testing"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/service/ec2"
	terragrunt_aws "github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

var tenant = "foo"
var environment = "bar"
var second_octet = "100"

func TestVpcModule(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../vpc",
		Vars: map[string]interface{}{
			"tenant":       tenant,
			"environment":  environment,
			"second_octet": second_octet,
		},
	}
	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
	validateVpc(t, terraformOptions)
}

func validateVpc(t *testing.T, o *terraform.Options) {
	// Check CIDR block
	vpc_cidr_block := terraform.Output(t, o, "vpc_cidr_block")
	assert.Equal(t, "10."+second_octet+".0.0/16", vpc_cidr_block)

	// Check name
	vpc_id := terraform.Output(t, o, "vpc_id")
	vpc := ec2.Vpc{VpcId: aws.String(vpc_id)}
	vpc_name := terragrunt_aws.FindVpcName(&vpc)
	assert.Equal(t, environment+"-"+tenant, vpc_name)
}
