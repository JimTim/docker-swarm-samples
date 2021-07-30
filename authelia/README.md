# Authelia

## Prerequisites

```bash
printf "<jwt_secret_long>" | docker secret create authelia_jwt_secret -
printf "<session_secret_very_long>" | docker secret create authelia_session_secret -
printf "<mail_password>" | docker secret create authelia_mail_password -
```

Now get the configuration template and users_database into a fresh created authelia-config folder

```bash
mkdir -p authelia-config
curl https://raw.githubusercontent.com/JimTim/docker-swarm-samples/master/authelia/authelia-config/configuration.yml --output authelia-config/configuration.yml
curl https://raw.githubusercontent.com/JimTim/docker-swarm-samples/master/authelia/authelia-config/users_database.yml --output authelia-config/users_database.yml
```

Now update the configurations and generate a new password for the root user:

```bash
docker run authelia/authelia:latest authelia hash-password YOUR_PASSWORD
```

... and please change the username aswell!

As the last step of the prerequisites, we have to load the configs into docker

```bash
cat authelia-config/configuration.yml | docker config create authelia_config -
cat authelia-config/users_database.yml | docker config create authelia_users -
```

## Run it

```bash
docker stack deploy -c authelia.yml authelia
```

