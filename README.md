vagrant-debian-stable-i386-extras
=================================

Expands on a Debian 7.7 base box.

## Base Box
Used [Bento](https://github.com/opscode/bento "Bento") Debian 7.7 i386

## Extras
* Bootstraps Salt
* Installs snake-oil ssl keys (for development use)
* Installs Postgres 9.3
* Installs ZeroMQ 4.0.5
* Installs Node.js 0.11.*
* Updates npm to latest
* Installs pm2

## Known Issues
Salt reports an error

> UnicodeEncodeError: 'ascii' codec can't encode characters in position 36753-36755: ordinal not in range(128)

but the error is produced when attempting to show the final results. It has installed correctly. The processes was
then finished by hand. This should not be an issue with the final box.