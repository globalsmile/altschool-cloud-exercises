# Deployment Documentation

This document outlines the deployment process, configurations, and tools used for setting up the application securely.

## Deployment Process

1. **Set Up Domain Name**: Ensure a domain name is registered for the application.
2. **Install Certbot**: Install Certbot for obtaining SSL certificates from Let's Encrypt.
3. **Obtain SSL Certificates**: Use Certbot to obtain SSL certificates for the domain.
4. **Configure Web Server**: Update Nginx or Apache configuration to enable HTTPS access.
5. **Test HTTPS Access**: Verify HTTPS access to the application.

## Configurations

### Nginx Configuration

```nginx
# Example Nginx configuration for enabling HTTPS access
server {
    listen 443 ssl;
    server_name yourdomain.com;

    ssl_certificate /etc/letsencrypt/live/yourdomain.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/yourdomain.com/privkey.pem;

    # Other SSL settings (e.g., SSL protocols, ciphers, etc.)

    location / {
        # Your application configuration
    }
}
```
# Apache Configuration
## Example Apache configuration for enabling HTTPS access
```
<VirtualHost *:443>
    ServerName yourdomain.com

    SSLEngine on
    SSLCertificateFile /etc/letsencrypt/live/yourdomain.com/fullchain.pem
    SSLCertificateKeyFile /etc/letsencrypt/live/yourdomain.com/privkey.pem

    # Other SSL settings (e.g., SSL protocols, ciphers, etc.)

    <Location />
        # Your application configuration
    </Location>
</VirtualHost>
```

# Tools Used
- Certbot: Used for obtaining SSL certificates from Let's Encrypt.
- Nginx: Web server used for serving the application and enabling HTTPS access.
- Apache: Alternative web server to Nginx, also used for enabling HTTPS access.

# Architecture Diagram

![simple web stack](https://github.com/globalsmile/altschool-cloud-exercises/assets/106287208/cf9db630-6b9a-498e-b67c-79fbff68d12f)

# Conclusion
This documentation provides a comprehensive overview of the deployment process, configurations, and tools used for setting up the application securely. By following these steps, you can ensure secure communication between clients and the server.
