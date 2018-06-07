Ansible Role: rpm-repository

- hosts: rpm
  vars:
    path_repo: /share/CentOS
    path_repo_base: "{{ path_repo }}/6/local"
    path_repo_rpm: "{{ path_repo_base }}/x86_64"
    path_httpd_repo: /var/www/html/CentOS
    yum_repo_name: ngi-test
  roles:
    - role: demokos.rpm-repository
      become: yes
