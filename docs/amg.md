# Amazon Managed Grafana

[Amazon Managed Grafana][amg-main] is a fully managed service based on open 
source Grafana, enabling you to analyze your metrics, logs, and traces without
having to provision servers, configure and update software, or do the heavy 
lifting involved in securing and scaling Grafana in production. You can create,
explore, and share observability dashboards with your team, connecting to
multiple data sources.

Check out the following recipes:

- [Getting Started][amg-gettingstarted]
- [Using Terraform for automation][amg-tf-automation]
- [Direct SAML integration with identity providers][amg-saml]
- [Integrating Google authentication via SAMLv2][amg-google-idps]
- [Integrating identity providers (OneLogin, Ping Identity, Okta, and Azure AD) to SSO][amg-idps]
- [Monitoring hybrid environments][amg-hybridenvs]
- [Setting up cross-account data source using customer managed IAM roles][amg-xacc-ds]
- [Managing Grafana and Loki in a regulated multitenant environment][grafana-loki-regenv]
- [Workshop for Getting Started][amg-oow]

[amg-main]: https://aws.amazon.com/grafana/
[amg-gettingstarted]: https://aws.amazon.com/blogs/mt/amazon-managed-grafana-getting-started/
[amg-tf-automation]: recipes/amg-automation-tf.md
[amg-saml]: https://aws.amazon.com/blogs/mt/amazon-managed-grafana-supports-direct-saml-integration-with-identity-providers/
[amg-google-idps]: recipes/amg-google-auth-saml.md
[amg-idps]: https://aws.amazon.com/blogs/opensource/integrating-identity-providers-such-as-onelogin-ping-identity-okta-and-azure-ad-to-sso-into-aws-managed-service-for-grafana/
[amg-hybridenvs]: https://aws.amazon.com/blogs/mt/monitoring-hybrid-environments-using-amazon-managed-service-for-grafana/
[amg-xacc-ds]: https://aws.amazon.com/blogs/opensource/setting-up-amazon-managed-grafana-cross-account-data-source-using-customer-managed-iam-roles/
[grafana-loki-regenv]: https://aws.amazon.com/blogs/opensource/how-to-manage-grafana-and-loki-in-a-regulated-multitenant-environment/
[amg-oow]: https://observability.workshop.aws/en/amg.html
