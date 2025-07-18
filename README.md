# 📦 Repository Archived

This repository has been **archived** and is no longer actively maintained.

All functionality previously found here has been migrated to the `atlas-index` repository.

👉 Please visit [AtlasOfLivingAustralia/atlas-index](https://github.com/AtlasOfLivingAustralia/atlas-index) for ongoing development and updates.

Thank you for your interest and support!



### specimenbrowser   [![Build Status](https://travis-ci.com/AtlasOfLivingAustralia/specimenbrowser.svg?branch=master)](https://travis-ci.com/AtlasOfLivingAustralia/specimenbrowser)

Browsing application for specimen images in Australian collections.
This application make use of biocache, collectory and image services.

Deploying a new version of specimenbrowser to Nexus
===================================================

Before deploying a new version, check that the dependency versions are up to date in grails-app/conf/BuildConfig.groovy.

Travis-CI is used to deploy new versions of specimenbrowser to Nexus. This is done automatically by updating the version number in the application.properties file and pushing to GitHub.

Once the new version of specimenbrowser is deployed to Nexus, the version number in ansible-inventories needs to change. To do this, the version number must be changed in: 

https://github.com/AtlasOfLivingAustralia/ansible-inventories/blob/master/specimens.ala.org.au

Deploying the current Nexus deployed version of SpecimenBrowser to a virtual machine
====================================================================================

If you have not yet installed Ansible, Vagrant, or VirtualBox, use the instructions at the [ALA Install README.md file](https://github.com/AtlasOfLivingAustralia/ala-install/blob/master/README.md) to install those first for your operating system.

Then, to deploy SpecimenBrowser onto a local virtual box install use the following instructions:

```
$ cd gitrepos
$ git clone git@github.com:AtlasOfLivingAustralia/ala-install.git
$ (cd ala-install/vagrant/ubuntu-trusty && vagrant up)
```

Add a line to your /etc/hosts file with the following information, replacing '10.1.1.3' with whatever IP address is assigned to the virtual machine that Vagrant starts up in VirtualBox:

```
10.1.1.3 specimens.ala.org.au
```

Then you can clone the ansible instructions and install it onto the given machine:

```
$ git clone git@github.com:AtlasOfLivingAustralia/ansible-inventories.git
$ ansible-playbook -i ansible-inventories/specimens.ala.org.au ala-install/ansible/specimenbrowser-standalone.yml
 --private-key ~/.vagrant.d/insecure_private_key -vvvv --user vagrant --sudo
```

Deploying to AWS EC2 production server
======================================

After testing locally, the same ansible scripts can be used to deploy to the production server which is an AWS EC2 server.

Comment out any testing line for specimens.ala.org.au in your /etc/hosts file and add the following line:

```
54.153.224.165 specimens.ala.org.au
```

Then deploy to that machine using the following command, replacing "MY_USER_NAME" with your login username:

```
$ ansible-playbook --user MY_USER_NAME -i ansible-inventories/specimens.ala.org.au ala-install/ansible/specimenbrowser-standalone.yml --private-key ~/.ssh/id_rsa -vvvv --sudo --ask-sudo-pass
```
