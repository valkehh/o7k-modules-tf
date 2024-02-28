#cloud-config
keyboard: {layout: se, toggle: null, variant: ''}
locale: en_US.UTF-8
users:
  - name: ubuntu
    groups: sudo
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    lock_passwd: true
    ssh_authorized_keys:
%{ for key in ssh_keys ~}
      - ${key}
%{ endfor ~}
