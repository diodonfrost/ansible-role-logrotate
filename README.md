# logrotate

[![Ansible Galaxy](https://img.shields.io/badge/galaxy-diodonfrost.logrotate-660198.svg)](https://galaxy.ansible.com/diodonfrost/logrotate)
[![Build Status](https://travis-ci.org/diodonfrost/ansible-role-logrotate.svg?branch=master)](https://travis-ci.org/diodonfrost/ansible-role-logrotate)

This role provide compliance for install and setup logrotate on your target host.

## Requirements

This role was developed using Ansible 2.4 Backwards compatibility is not guaranteed.
Use `ansible-galaxy install diodonfrost.logrotate` to install the role on your system.

Supported platforms:

```yaml
- name: EL
  versions:
    - 8
    - 7
    - 6
- name: Fedora
  versions:
    - 32
    - 31
    - 30
    - 29
    - 28
    - 27
    - 26
- name: Debian
  versions:
    - buster
    - stretch
    - jessie
- name: Ubuntu
  versions:
    - bionic
    - xenial
    - trusty
    - precise
- name: OracleLinux
  versions:
    - 8
    - 7
    - 6
- name: Amazon
  versions:
    - 2017.12
    - 2016.03
    - 2013.09
- name: opensuse
  versions:
    - 15
    - 13.2
    - 42.1
    - 42.2
    - 42.3
- name: SLES
  versions:
    - 11
    - 12
    - 15
- name: ArchLinux
  versions:
    - any
- name: Gentoo
  versions:
    - stage3
- name: FreeBSD
  versions:
    - 11.2
    - 10.4
    - 10.3
```

## Role Variables

This role has multiple variables. The defaults for all these variables are the following:

```yaml
---
# defaults file for ansible-role-logrotate

# How often to rotate logs, either daily, weekly or monthly.
logrotate_frequency: weekly

# By default keep 4 weeks worth of backlogs
logrotate_keep: 4

# compress log files
logrotate_compress: true

# Set logrotate custom application configurations
logrotate_entries: []
# Example:
# logrotate_entries:
#   - name: nginx
#     path: "/var/log/nginx/*.log"
#     options:
#       - weekly
#       - compress
#   - name: auditd
#     path: "/var/log/audit/audit.log"
#     options:
#       - weekly
#       - rotate 4
#       - compress
#       - size 100M
```


## Dependencies

None

## Example Playbook

This is a sample playbook file for deploying the Ansible Galaxy logrotate role in a localhost and installing logrotate.

```yaml
---
- hosts: localhost
  remote_user: root
  roles:
    - role: diodonfrost.logrotate
```

#### Example with nginx logs

```yaml
- hosts: localhost
  roles:
    - role: diodonfrost.logrotate
      vars:
        logrotate_entries:
          - name: nginx
            paths: /var/log/nginx/*.log
            options:
              - weekly
              - compress
          - name: rsyslog
            paths:
              - /var/log/kern.log
              - /var/log/message
              - /var/log/debug
            options:
              - weekly
              - rotate 4
              - compress
              - size 100M
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
kitchen test default-centos-8

# test on all machines
kitchen test

# for development, create environment
kitchen create default-centos-8

# Apply ansible playbook
kitchen converge default-centos-8

# Apply inspec tests
kitchen verify default-centos-8
```

### Testing with Virtualbox

```shell
# Specify kitchen file
set KITCHEN_YAML=.kitchen-vagrant.yml

# fast test on one machine
kitchen test default-centos-8
```

## License

Apache 2

## Author Information

This role was created in 2018 by diodonfrost.
