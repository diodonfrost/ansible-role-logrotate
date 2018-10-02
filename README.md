# logrotate

This role provide compliance for install and setup logroate on your target host.

## Requirements

This role was developed using Ansible 2.4 Backwards compatibility is not guaranteed.
Use `ansible-galaxy install diodonfrost.logroate` to install the role on your system.

Supported platforms:

```yaml
- name: EL
  versions:
    - 6
    - 7
- name: Fedora
  versions:
    - 28
    - 27
    - 26
- name: Debian
  versions:
    - stretch
    - jessie
- name: Ubuntu
  versions:
    - bionic
    - artful
    - xenial
    - trusty
    - precise
```

## Role Variables

```yaml
---
# defaults file for ansible-role-logrotate
```

## Dependencies

None

## Example Playbook

This is a sample playbook file for deploying the Ansible Galaxy mariadb role in a localhost and installing logrotate.

```yaml
---
- hosts: localhost
  become: true
  roles:
    - role: diodonfrost.logrotate
```

## Local Testing

The preferred way of locally testing the role is to use Docker. You will have to install Docker on your system.

You can also use vagrant and Virtualbox with vagrant to run tests locally. You will have to install Virtualbox and Vagrant on your system.
 For all our tests we use test-kitchen.

Next install test-kitchen:

```shell
# Install dependencies
gem install bundler
bundle install
```

### Testing with Docker

```shell
# List all tests with kitchen
kitchen list

# fast test on one machine
kitchen test default-centos-7

# test on all machines
kitchen test

# for development, create environment
kitchen create default-centos-7

# Apply ansible playbook
kitchen converge default-centos-7

# Apply inspec tests
kitchen verify default-centos-7
```

### Testing with Virtualbox

```shell
# Specify kitchen file on Windows
set KITCHEN_YAML=.kitchen-vagrant.yml

# fast test on one machine
kitchen test default-centos-7


## License

Apache 2

## Author Information

This role was created in 2018 by diodonfrost.
