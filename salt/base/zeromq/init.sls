build-essential:
  pkg.installed

zeromq-install:
  cmd.script:
    - source: salt://zeromq/zeromq.sh
    - cwd: /tmp
    - unless: test -e /usr/local/lib/libzmq.so.4
    - require:
      - pkg: build-essential