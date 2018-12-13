# logrotate

[![Ansible Galaxy](https://img.shields.io/badge/galaxy-diodonfrost.logrotate-660198.svg)](https://galaxy.ansible.com/diodonfrost/logrotate)
[![Build Status](https://travis-ci.org/diodonfrost/ansible-role-logrotate.svg?branch=master)](https://travis-ci.org/diodonfrost/ansible-role-logrotate)

This role provide compliance for install and setup logroate on your target host.

## Requirements

This role was developed using Ansible 2.4 Backwards compatibility is not guaranteed.
Use `ansible-galaxy install diodonfrost.logroate` to install the role on your system.

Supported platforms:

```yaml
- name: EL
  versions:
    - 7
    - 6
- name: Fedora
  versions:
    - 29
    - 28
    - 27
    - 26
- name: Debian
  versions:
    - stretch
    - jessie
    - wheezy
    - squeeze
- name: Ubuntu
  versions:
    - bionic
    - xenial
    - trusty
    - precise
- name: OracleLinux
  versions:
    - 7
    - 6
- name: Amazon
  versions:
    - 2017.12
    - 2016.03
    - 2013.09
- name: opensuse
  versions:
    - 13.2
    - 42.1
    - 42.2
    - 42.3
- name: SLES
  versions:
    - 11
    - 12
    - 15
```

## Role Variables

```yaml
---
# defaults file for ansible-role-logrotate
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
  remote_user: root
  roles:
    - role: diodonfrost.logrotate
  vars:
    logrotate_applications:
      - name: nginx
        definitions:
          - logs:
              - '/var/log/nginx/nginx.log'
            options:
              - weekly
              - rotate 13
              - compress
              - delaycompress
              - missingok
              - notifempty
              - create 0640 nginx nginx
```

## Role Variables

This role has multiple variables. The defaults for all these variables are the following:

```yaml
---
# defaults file for ansible-role-logrotate

# define logrotate crontab job
logrotate_minute: "10"
logrotate_hour: "2"
logrotate_day: "*"
logrotate_weekday: "*"
logrotate_month: "*"

# Add custom settings in logroate configfile.
# Example:
# logroate_custom_options:
#   - noop = enabled
#   - report = true
#   - daemonize = false
logrotate_custom_options: []

# Set logroate application configurations
logrotate_applications: []
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
```

## License

Apache 2

## Author Information

This role was created in 2018 by diodonfrost.
