# Ansible Role: rpm-repository

[![Build Status](https://travis-ci.org/vahubert/ansible-role-rpm-repository.svg?branch=master)](https://travis-ci.org/vahubert/ansible-role-rpm-repository)

Install a RHEL/CentO repository CI on RHEL/CentOS 7.

## Role Variables


## Dependencies

  - vahubert.apache

## Example Playbook

```yaml
- hosts: repo
  vars:
    rpm_repo_name: ngi-test
    rpm_repo_mail: it@ngigroup.fr
    rpm_repo_architecture:
      - x86_64
    rpm_repo_version:
      - 6
    rpm_repo_path: /share/CentOS
    rpm_repo_httpd_conf_dir: /etc/httpd/conf.d/
    rpm_repo_httpd_path: /var/www/html/CentOS
    gpg_regenerate_key: true
  roles:
    - role: vahubert.java
      become: yes
```

## License

MIT (Expat) / BSD

## Author Information

This role was created in 2014 by [Jeff Geerling](https://www.jeffgeerling.com/), author of [Ansible for DevOps](https://www.ansiblefordevops.com/).
