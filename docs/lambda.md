# AWS Lambda

!!! warning
    This site is being merged into the broader [Observability Best Practices](https://aws-observability.github.io/observability-best-practices/recipes/) content. Please head over there for the latest updates, plus prescriptive guidance on the use of AWS observability tools.

!!! warning
    This site will be kept as-is until January 2023, when it will be decommissioned.

***

[AWS Lambda][lambda-main] is a serverless compute service that lets you run
code without provisioning or managing servers, creating workload-aware cluster 
scaling logic, maintaining event integrations, or managing runtimes.

Check out the following recipes:

## Logs

- [Deploy and Monitor a Serverless Application][aes-ws]

## Metrics

- [Introducing CloudWatch Lambda Insights][lambda-cwi]
- [Exporting Cloudwatch Metric Streams via Firehose and AWS Lambda to Amazon Managed Service for Prometheus](recipes/lambda-cw-metrics-go-amp.md)

## Traces

- [Auto-instrumenting a Python application with an AWS Distro for OpenTelemetry Lambda layer][lambda-layer-python-xray-adot]
- [Tracing AWS Lambda functions in AWS X-Ray with OpenTelemetry][lambda-xray-adot]

[lambda-main]: https://aws.amazon.com/lambda/
[aes-ws]: https://bookstore.aesworkshops.com/
[lambda-cwi]: https://aws.amazon.com/blogs/mt/introducing-cloudwatch-lambda-insights/
[lambda-xray-adot]: https://aws.amazon.com/blogs/opensource/tracing-aws-lambda-functions-in-aws-x-ray-with-opentelemetry/
[lambda-layer-python-xray-adot]: https://aws.amazon.com/blogs/opensource/auto-instrumenting-a-python-application-with-an-aws-distro-for-opentelemetry-lambda-layer/
