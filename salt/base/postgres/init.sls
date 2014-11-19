postgres-repo:
  pkgrepo.managed:
    - humanname: postgres
    - name: deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main
    - dist: wheezy-pgdg
    - file: /etc/apt/sources.list.d/pgdg.list
    - key_url: https://www.postgresql.org/media/keys/ACCC4CF8.asc
    - require_in:
      - postgressql-9.3
      - postgressql-client-9.3

postgresql-9.3:
  pkg.installed

postgresql-client-9.3:
  pkg.installed

postgresql:
  service:
    - running
    - enable: true
    - watch:
      - pkg: postgresql-9.3
      - file: /etc/postgresql/9.3/main/postgresql.conf
      - file: /etc/postgresql/9.3/main/pg_hba.conf