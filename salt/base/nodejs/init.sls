git:
  pkg.installed

openssl:
  pkg.installed

node-user:
  group.present:
    - name: node
  user.present:
    - name: node
    - password: x
    - shell: /bin/sh
    - home: /home/node
    - groups:
      - node
    - require:
      - group: node

nvm-install:
  cmd.script:
    - source: salt://nodejs/node.sh
    - cwd: /tmp
    - unless: test -x /usr/local/bin/node
    - require:
      - pkg: git
      - pkg: openssl

/etc/init.d/pm2-init.sh:
  file.managed:
    - source: salt://nodejs/pm2-init.sh
    - mode: 755

pm2-init.sh:
  service:
    - running
    - enable: true
