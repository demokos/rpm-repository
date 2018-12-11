# Ansible Role: rpm-repository

[![Build Status](https://travis-ci.org/vahubert/ansible-role-rpm-repository.svg?branch=master)](https://travis-ci.org/vahubert/ansible-role-rpm-repository)

Install a CentOS repository CI on CentOS 7.

## Role Variables


## Dependencies

  - vahubert.apache

## Example Playbook

```yaml
- hosts: repo
  vars:
    rpm_repository_name: ngi-test
    rpm_repository_mail: it@ngigroup.fr
    rpm_repository_os_architecture:
      - x86_64
    rpm_repository_os_version:
      - 6
    rpm_repository_path: /share/CentOS
    rpm_repository_httpd_conf_dir: /etc/httpd/conf.d/
    rpm_repository_path: /var/www/html/CentOS
    rpm_repository_regenerate_gpg_key: true
  roles:
    - role: vahubert.java
      become: yes
```

## License

All rights reserved

## Author Information

Valentin HUBERT <vhubert@ngigroup.fr>
