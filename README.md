# terraform-aws-bestpractise

This attempts to emulate the AWS best practise guide for isolation of availability zones
(Terraforming probably isn't best practise but its a WIP)

To use this you'll need to generate `keys/ami_keys (private) and keys/ami_keys.pub`
```
ssh-keygen #Generate a keypair in `./keys`
ssh-add -K keys/ami_keys
terraform apply
ssh -A ec2-user@$(terraform output bastion-eu-west1a)
#Should be able to connect to private servers now!
```
![image](resources/linux-bastion-hosts-on-aws-architecture.png)
