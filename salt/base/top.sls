base:

  '*':
    - dev

  'role:nodejs':
    - match: grain
    - nodejs

  'role:zeromq':
    - match: grain
    - zeromq

  'role:postgres':
    - match: grain
    - postgres
    - postgres.dev
