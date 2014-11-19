postgres:
  user.present:
    - password: $6$8lK5PF4C$QnFB82bZjupfnxZlF.q2ACZ0XgAmNR/3PkFLeOdVZJVPaOG5jRTVD/hbpRckRJxK14VLTlWfoOLw5peTwgxiF.
    - groups:
      - postgres
      - "ssl-cert"

/etc/postgresql/9.3/main/postgresql.conf:
  file.managed:
    - source: salt://postgres/dev/dev_postgresql.conf

/etc/postgresql/9.3/main/pg_hba.conf:
  file.managed:
    - source: salt://postgres/dev/dev_pg_hba.conf
