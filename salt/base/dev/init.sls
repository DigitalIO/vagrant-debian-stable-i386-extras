"ssl-cert":
  pkg.installed

vagrant-ssl:
  user.present:
    - name: vagrant
    - groups:
      - "ssl-cert"
    - require:
      - pkg: "ssl-cert"