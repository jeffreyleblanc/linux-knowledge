# AWS Topics

## AWS Access

### Web Interfaces

* For web servcies start at <https://d-{HEX}.awsapps.com/start#/>
    * Will vary depending on how complex setup
* And choose the Account you need to use

### AWS CLI With SSO

To log in the aws cli:

```sh
# setup access
$ BROWSER=firefox aws configure sso
#=> Check Firefox for a new tab with instructions
#=> Choose the account

# Confirm access
$ aws sts get-caller-identity
$ cat .aws/config
```

Alternatively (newer):

```sh
# If want to setup anew
$ rm -rf ~/.aws/*

# Then run the following and note entries:
$ aws configure sso
# SSO session name (Recommended): default
# SSO start URL [None]: https://d-{HEX}.awsapps.com/start#/
# SSO region [None]: us-east-1
# SSO registration scopes [sso:account:access]:
# Attempting to automatically open the SSO authorization page in your default browser.
# If the browser does not open or you wish to use a different device to authorize this request, open the following URL:
#
# https://device.sso.us-east-1.amazonaws.com/
#
# Then enter the code:
#
# AAAA-BBBB
# There are {N} AWS accounts available to you.
# Using the account ID {NUM}
# The only role available to you is: AdministratorAccess
# Using the role name "AdministratorAccess"
# CLI default client Region [None]: us-east-1
# CLI default output format [None]:
# CLI profile name [AdministratorAccess-{NUM}]: default
#
# To use this profile, specify the profile name using --profile, as shown:
#
# aws s3 ls --profile default

# Then to check
$ aws sts get-caller-identity
```

Also `~/.aws/config` will look something like:

```
[default]
sso_session = default
sso_account_id = {ID_NUMBER}
sso_role_name = AdministratorAccess
region = us-east-1
[sso-session default]
sso_start_url = https://d-{HEX}.awsapps.com/start#/
sso_region = us-east-1
sso_registration_scopes = sso:account:access
```


## Amazon Services Overview

* Virtual Private Cloud (VPC)
    * With Amazon Virtual Private Cloud (Amazon VPC), you can launch AWS resources in a logically isolated virtual network that you've defined. This virtual network closely resembles a traditional network that you'd operate in your own data center, with the benefits of using the scalable infrastructure of AWS.
    * <https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html>
* AWS Identity and Access Management (IAM)
    * Securely manage identities and access to AWS services and resources
    * <https://aws.amazon.com/iam/>
* Amazon EC2
    * Secure and resizable compute capacity to support virtually any workload
    * <https://aws.amazon.com/pm/ec2/>
* Amazon Route 53
    * Amazon Route 53 is a highly available and scalable Domain Name System (DNS) web service. Route 53 connects user requests to internet applications running on AWS or on-premises.
    * <https://aws.amazon.com/route53/>


## Instance Metadata

<https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html#instancedata-data-retrieval>

```sh
# General endpoint
$ curl http://169.254.169.254/latest/meta-data/
#> list options

# Get public IP
$ curl http://169.254.169.254/latest/meta-data/public-ipv4
#> public IP

# LAN IP, in vanilla case same as eth0
$ curl http://169.254.169.254/latest/meta-data/local-ipv4
#> LAN IP
```

