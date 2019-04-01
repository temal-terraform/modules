package main

import (
	"fmt"
	"testing"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/ec2"
	terragrunt_aws "github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
)

var tenant = "foo"
var environment = "bar"
var second_octet = "100"

func TestVpcModule(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "../vpc",
		Vars: map[string]interface{}{
			"tenant":       tenant,
			"environment":  environment,
			"second_octet": second_octet,
		},
	}

	// At the end of the test, undeploy terraform module code
	defer test_structure.RunTestStage(t, "cleanup_terraform", func() {
		terraform.Destroy(t, terraformOptions)
	})

	test_structure.RunTestStage(t, "deploy_terraform", func() {
		terraform.InitAndApply(t, terraformOptions)
	})

	test_structure.RunTestStage(t, "test_vpc", func() {
		validateVpc(t, terraformOptions)
	})
}

func validateVpc(t *testing.T, o *terraform.Options) {
	// Check CIDR block
	vpcCidrBlock := terraform.Output(t, o, "vpc_cidr_block")
	assert.Equal(t, "10."+second_octet+".0.0/16", vpcCidrBlock)

	// Check name
	// Get vpc id from terraform output
	vpcId := terraform.Output(t, o, "vpc_id")

	// Create session for aws sdk
	sess := session.Must(session.NewSessionWithOptions(session.Options{
		SharedConfigState: session.SharedConfigEnable,
	}))
	// Get newly created VPC from AWS
	svc := ec2.New(sess)
	input := &ec2.DescribeVpcsInput{
		VpcIds: []*string{
			aws.String(vpcId),
		},
	}
	result, err := svc.DescribeVpcs(input)
	if err != nil {
		fmt.Println(err)
	}
	vpc := result.Vpcs[0]

	// Get VPC name from previously created VPC object
	vpcName := terragrunt_aws.FindVpcName(vpc)
	assert.Equal(t, environment+"-"+tenant, vpcName)
}
