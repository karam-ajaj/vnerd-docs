---
comments: true
---

# Authelia

Open-Source Authentication and Authorization Server

Authelia, an open-source authentication and authorization server, is designed to fortify the security of web applications and services. With a focus on simplicity and extensibility, Authelia serves as a robust solution for implementing single sign-on (SSO), two-factor authentication (2FA), and fine-grained access control policies.

## Key Features

- **Single Sign-On (SSO):** Authelia streamlines user access by providing a unified authentication experience across multiple applications.

- **Protocol Support:** Seamlessly integrate with authentication protocols such as LDAP, OAuth 2.0, and OpenID Connect for standardized and secure user authentication.

- **Two-Factor Authentication (2FA):** Enhance account security with Authelia's support for two-factor authentication, adding an extra layer of verification.

- **Fine-Grained Access Control:** Tailor access control policies based on user roles and permissions, allowing administrators precise control over resource accessibility.

## Getting Started

Explore the comprehensive documentation to get started with Authelia, whether you are a security professional, DevOps engineer, or a developer seeking robust authentication solutions.

[Authelia Documentation](https://docs.authelia.com/)

## Community

Connect with the vibrant Authelia community through forums and chat channels. Stay informed about updates, bug fixes, and community-driven enhancements.

[Authelia GitHub Repository](https://github.com/authelia/authelia)

Welcome to the world of Authelia, where security meets simplicity!


## Volumes
```bash
/nfs-nas-swarm/config/swarmpit
/nfs-nas-swarm/data/swarmpit
```

## Deployment

Edit configuration files in /nfs-nas-swarm/config/authelia
```yaml
###############################################################
#                   Authelia configuration                    #
###############################################################

server:
  host: 0.0.0.0
  port: 9091

log:
  level: warn

# This secret can also be set using the env variables AUTHELIA_JWT_SECRET_FILE
# I used this site to generate the secret: https://www.grc.com/passwords.htm
jwt_secret: {secret}

# https://docs.authelia.com/configuration/miscellaneous.html#default-redirection-url
default_redirection_url: https://authelia.vnerd.nl

totp:
  issuer: authelia.vnerd.nl
  period: 30
  skew: 1

authentication_backend:
  file:
    path: /config/users_database.yml
    # customize passwords based on https://docs.authelia.com/configuration/authentication/file.html
    password:
      algorithm: argon2id
      iterations: 1
      salt_length: 16
      parallelism: 8
      memory: 1024 # blocks this much of the RAM. Tune this.

# https://docs.authelia.com/configuration/access-control.html
access_control:
  default_policy: two_factor
  rules:
    - domain: "test.vnerd.nl"
      policy: one_factor

    - domain: "whoami-authelia-2fa.vnerd.nl"
      policy: two_factor

    - domain: "*.vnerd.nl"
      policy: one_factor

session:
  name: authelia_session
  # This secret can also be set using the env variables AUTHELIA_SESSION_SECRET_FILE
  # Used a different secret, but the same site as jwt_secret above.
  secret: {secret}
  expiration: 3M # 3 months
  inactivity: 1M # 1 month
  domain: vnerd.nl # Should match whatever your root protected domain is

regulation:
  max_retries: 3
  find_time: 120
  ban_time: 300

storage:
  encryption_key: {encryption_key}
  local:
    path: /config/db.sqlite3


notifier:
  # smtp:
  #   username: SMTP_USERNAME
  #   # This secret can also be set using the env variables AUTHELIA_NOTIFIER_SMTP_PASSWORD_FILE
  #   # password: # use docker secret file instead AUTHELIA_NOTIFIER_SMTP_PASSWORD_FILE
  #   host: SMTP_HOST
  #   port: 587 #465
  #   sender: batman@example.com # customize for your setup

  # For testing purpose, notifications can be sent in a file. Be sure map the volume in docker-compose.
  filesystem:
    filename: /config/notification.txt

```

You will need to register a device for second factor authentication and confirm by clicking on a link sent by email
Upon registering, you can grab this link easily by running the following command:

```bash
grep -Eo '"https://.*" ' ./authelia/notification.txt.
```

## docker swarm file


``` yaml linenums="1" 
--8<-- "/docs/github-repos/portainer-compose/stacks/authelia.yml"
```

## Notes
To apply the MFA on a website using traefik, you should connect the router to the Authelia middleware by specifying this parameter in the traefik router using labels
```yaml
traefik.http.routers.{service_name}-https.middlewares: authelia@docker
```