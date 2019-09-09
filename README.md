# A Puppet Demo Control Repository

* [What You Get From This control\-repo](#what-you-get-from-this-control-repo)
* [Copy This Repo Into Your Own Git Server](#copy-this-repo-into-your-own-git-server)


## What You Get From This Demo control-repo

This is a demo control repository that has working Roles (example\_role) and Profile code.  It is intended to demo what guidelines should be used to create role and profile, how they interact with other Puppet systems and explain some of the concepts behind the process.

The important files and items in this template are as follows:

* Basic example of roles (example\_role) and profiles.
* An example Puppetfile with various module references.
* An example Hiera configuration file and data directory with pre-created common.yaml and nodes directory.
* An [environment.conf](https://puppet.com/docs/puppet/5.3/config_file_environment.html) that correctly implements:
  * A site directory for roles, profiles, and any custom modules for your organization.
  * A config\_version script.
* An example [config\_version](https://puppet.com/docs/puppet/5.3/config_file_environment.html#configversion) script that outputs:
  * Hostname of the master the catalog was compiled on
  * Puppet Environment the catalog was compiled from
  * git commit ID of the code that was used during a Puppet run.

Here's a visual representation of the structure of this repository:

```
.
|___ hiera.yaml                           # Hiera's configuration file. The Hiera hierarchy is defined here.
|___ LICENSE
|___ Puppetfile
|___ metadata.json
|___ spec                                 # This is the testing directory
|___ docs                                 # Addition info to assist in understaning
| |___ git_learning_materials.md
|___ README.md
|___ Rakefile
|___ environment.conf                     # Environment-specific settings. Configures the moduelpath and config_version.
|___ scripts
| |___ config_version.rb                  # A config_version script for r10k.
| |___ code_manager_config_version.rb     # A config_version script for Code Manager.
| |___ config_version.sh                  # A wrapper that chooses the appropriate config_version script.
|___ site                                 # This directory contains site-specific modules and is added to $modulepath.
| |___ README.md
| |___ profile                            # The profile module.
| | |___ README.md
| |___ example_role                       # The example_role module.
| | |___ README.md
|___ Gemfile                              # Gemfile to install required gems for testing
|___ keys                                 # Hiera Key directory
| |___ public_key.pkcs7.pem               # This can be distributed in production repo for developers to encrypt heira data
| |___ private_key.pkcs7.pem              # **THIS SHOULD BE REMOVED AND NEVER BE IN A CONTROL REPO** Only added for example purposes
|___ manifests
| |___ site.pp                            # The "main" manifest that contains a default node definition.
|___ data                                 # Hiera data directory.
| |___ role                               # Role-specific data goes here.
| |___ nodes                              # Node-specific data goes here.
| |___ to_be_deleted.yaml                 # **THIS FILE HAS DEMO VALUES AND SHOULD BE DELETED IF THIS REPO IS GOING TO BE USED**
| |___ virtual                            # Virtualization type data
| | |___ virtualbox.yaml
| |___ os                                 # OS family specific data
```

