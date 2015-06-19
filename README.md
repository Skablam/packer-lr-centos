# packer-lr-centos

Basic packer configuration to create default images for Vagrant AWS and VMWare

NB VMWare support has yet to be tested - owing to way in which vmware provide their software I have been unable to obtain a version of the player that is compatible with the version of the api that I have access to. Subsequently I am currently having to manually build vmware images from the provisioning scripts :(

Usage: 

NB The packer binary is just called 'packer' when downloaded however several linux distributions already contain a binary on the default user path called 'packer' - it was therefore necessary to rename the (HashiCorp) packer binary (to packer.io in this case)

Validate the template - this checks the syntax and configuration of the template

```$ packer validate packer.json```

Build the template - builds images for aws and vagrant (not vmware - see above)

```$ packer.io build --except=vmware packer.json```

NB in order for packer to build aws images (amis) it requires an aws credentials file and a seed ami to be present. See https://www.packer.io/docs for details
