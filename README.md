# Sensu Core Stack
This is the [Sensu Core](https://docs.sensu.io/sensu-core/latest/) monitoring framework running in Docker containers.

> Sensu is often described as the “monitoring router”. Essentially, Sensu takes the results of “check” scripts run across many systems, and if certain conditions are met, passes their information to one or more “handlers”. Checks are used, for example, to determine if a service like Apache is up or down. - [sensuapp.org](https://sensuapp.org/docs/latest/overview)

## Build
```make build-sensu build-uchiwa```

## Deploy
```make compose-up```

NOTE: Sensu transport is [redis](https://hub.docker.com/_/redis) only with no authentication; [redislabs/redisinsight](https://hub.docker.com/r/redislabs/redisinsight) is enabled

## Usage

### Web Admin Panel

The default configuration maps the Uchiwa frontend to [http://localhost:3000](http://localhost:3000). Default credentials (*change those!*) are:

- **User**: `hiro`
- **Password**: `nakamura`

### Add Your Own Checks

You'll have to create your own Docker image and extend `anroots/sensu-client` and `anroots/sensu-server` to add your own configuration and checks. See Dockerfiles in [server/example](server/example) and [client/example](client/example) directories. Official documentation on checks can be read [here](https://sensuapp.org/docs/latest/checks).

```Dockerfile
FROM anroots/sensu-server:0.3.0

COPY conf.d /etc/sensu/conf.d
```

### Add Your Own Plugins

[sensu-plugins](https://github.com/sensu-plugins) lists many Sensu plugins that can be used to perform different checks. To install a new plugin, typically add to [sensu/Dockerfile](./sensu/Dockerfile).

### Sending Alerts

This image does not come with built-in event handlers - you'll have to choose and configure one yourself. Documentation on handlers can be found [here](https://sensuapp.org/docs/latest/getting-started-with-handlers).

#### E-mail Handler

The following is an example on how to configure Sensu to send e-mails on failing checks.

First of all, we need to install a handler to the Sensu server. Extend `anroots/sensu-server` and install the e-mail handler:

```
# Dockerfile
FROM anroots/sensu-server:example
RUN sensu-install -p mailer
COPY mail.json /etc/sensu/conf.d/
```

Next, add the settings of the e-mail server to use:

```json
# mail.json
{
  "mailer": {
    "mail_from": "server@sensu.sqroot.eu",
    "mail_to": "ando@sqroot.eu",
    "smtp_address": "smtp.mailgun.org",
    "smtp_port": "587",
    "smtp_domain": "sensu.sqroot.eu",
    "smtp_username": "postmaster@sensu.sqroot.eu",
    "smtp_password": "<password>"
  }
}
```

Finally, tell Sensu that the handler exists. It can either be a default handler for all checks or specified on per-check basis.

```json
# Override handlers specified in server.tmpl
"handlers":{
  "default":{
    "type":"set",
    "handlers":[
      "mail"
    ]
  },
  "mail":{
    "type": "pipe",
    "command": "handler-mailer.rb"
  }
}
```

## Change Log

Please see [CHANGELOG](CHANGELOG.md) for more information what has changed recently.

## Contributing

Please see [CONTRIBUTING](CONTRIBUTING.md) for details.

## Security

If you discover any security related issues, please fork, fix and raise a pull request

## Credits

- [Ando Roots](http://sqroot.eu)
- [All Contributors](../../contributors)

## Licence

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
