# covenant

A Covenant docker-compose setup, using Traefik to front the server's ports.

## running

- Run `setup.sh` to clone the Covenant directory correctly.
- Run `docker-compose up`, or to run and detach, `docker-compose up -d`.

Data will persist in the `Covenant/Covenant/Data/` directory, so reboots should not be destructive.

## tls configuration

You can have letsencrypt certificates for this setup by:

- Running `touch acme.json && chmod 600 acme.json` next to the `docker-compose.yml` file.
- Setting an email account using the `ACME_EMAIL` value in the `.env` file.
- Uncommenting the `# ACME` section in the `docker-compose.yml` file under `services.traefik.command`.
- Uncomment all of the `*.certresolver` labels in the rest of the `docker-compose.yml` file.
- Restart!
