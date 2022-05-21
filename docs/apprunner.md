# AWS App Runner

[AWS App Runner][apprunner-main] is a fully managed service that makes it easy for developers to quickly deploy containerized web applications and APIs at scale and with little to no infrastructure experience. 
You can start with your source code or a container image, and App Runner will fully manage all infrastructure including servers, networking, and load balancing for your application. 
App Runner provides you with a service URL that receives HTTPS requests to your application. As an option, App Runner can also configure a continuous deployment pipeline for you.



Check out the following recipes:

## Traces
- [Getting Started with AWS X-Ray tracing for App Runner using AWS Distro for OpenTelemetry](apprunner-xray-adot)
- [AWS Blog | Observability for AWS App Runner VPC networking](https://aws.amazon.com/blogs/containers/observability-for-aws-app-runner-vpc-networking/)
- [AWS Blog | Tracing an AWS App Runner service using AWS X-Ray with OpenTelemetry](https://aws.amazon.com/blogs/containers/tracing-an-aws-app-runner-service-using-aws-x-ray-with-opentelemetry/)
- [AWS Blog | Enabling AWS X-Ray tracing for AWS App Runner service using AWS Copilot CLI](https://aws.amazon.com/blogs/containers/enabling-aws-x-ray-tracing-for-aws-app-runner-service-using-aws-copilot-cli/)


## Logs

- [Viewing App Runner logs streamed to CloudWatch Logs][apprunner-cwl]

## Metrics

- [Viewing App Runner service metrics reported to CloudWatch](apprunner-cwm)



[apprunner-main]: https://aws.amazon.com/apprunner/
[aes-ws]: https://bookstore.aesworkshops.com/
[apprunner-cwl]: https://docs.aws.amazon.com/apprunner/latest/dg/monitor-cwl.html
[apprunner-cwm]: https://docs.aws.amazon.com/apprunner/latest/dg/monitor-cw.html
[apprunner-xray-adot]: https://aws-otel.github.io/docs/getting-started/apprunner
