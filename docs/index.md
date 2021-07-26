# Welcome!

We are covering recipes for observability (o11y) solutions at AWS on this site.
This includes managed services such as [Amazon Managed Service for Prometheus][amp]
(AMP) as well as libraries & agents, for example as provided by [OpenTelemetry][otel]
or [Fluent Bit][fluentbit]. We want to address the needs of both developers and
infrastructure folks.

The way we think about the o11y space is as follows: we decompose it into
[six dimensions][dimensions] you can then combine to arrive at a specifc solution:

| **dimension** | **examples** |
|---------------|--------------|
| destinations  | [AMP][amp] &middot; [AMG][amg] &middot; [CW][cw] &middot; [X-Ray][xray] &middot; [Jaeger][jaeger] |
|               | [AES][aes] &middot; [S3][s3] &middot; [Kafka][kafka] |
| agents        | [ADOT][adot] &middot; [Fluent Bit][fluentbit] &middot; CW agent &middot; X-Ray agent |
| languages     | Java &middot; Python &middot; .NET &middot; JavaScript &middot; Go &middot; Rust |
| infra & databases  | [VPC flow logs][vpcfl] &middot; [EKS CP][kubecpl] &middot;  [exporters][promex]  |
|                         | [S3 mon][s3mon] &middot; [SQS tracing][sqstrace] &middot; [RDS mon][rdsmon] &middot; [DynamoDB][dynamodb] |
| compute unit | [Batch][batch] &middot; [ECS][ecs] &middot; [EKS][eks] &middot; [AEB][beans] &middot; [Lambda][lambda] |
| compute engine | [Fargate][fargate] &middot; [EC2][ec2] &middot; [Lightsail][lightsail] |

For example, you might be looking for a solution to:

!!! question "Examplary solution specification"
    I need a logging solution for a Python app I'm running on EKS on Fargate
    with the goal to store the logs in an S3 bucket for further consumption

1. *Destination*: S3 bucket for further consumption
1. *Agent*: FluentBit
1. *Language*: Python
1. *Infra & DB*: N/A
1. *Compute unit*: Kubernetes (EKS)
1. *Compute engine*: EC2

Not every dimension needs to be specified and sometimes it's hard to decide where
to start. Try different paths and compare the pros and cons of certain recipes.

To simplify navigation, we're grouping the six dimension into the following
catagories:

- **By Compute**: covering compute engines and units
- **By Infra & Data**: covering infrastructure and databases
- **By Language**: covering languages
- **By Destination**: covering telemetry and analytics
- **Tasks**: covering anomaly detection, alerting, troubleshooting, and more

[Learn more about dimensions …](dimensions/)

## How to use

You can either use the top navigation menu to browse to a specific index page,
starting with a rough selection. For example, `By Compute` -> `EKS` ->
`Fargate` -> `Logs`.

Alternatively, you can search the site pressing `/` or the `s` key:

![o11y space](images/search.png)

## How to contribute

Start a [discussion][discussion] on what you plan to do and we take it from there.

## Learn more

The recipes on this site are a good practices collection. In addition, there 
are a number of places where you can learn more about the status of open source
projects we use as well as about the managed services from the recipes, so 
check out:

- [observability @ aws][o11yataws], a playlist of AWS folks talking about 
  their projects and services.
- [AWS observability workshops](workshops/), to try out the offerings in a
  structured manner.
- The [AWS monitoring and observability][o11yhome] homepage with pointers
  to case studies and partners.

[aes]: https://aws.amazon.com/elasticsearch-service/ "Amazon Elasticsearch Service"
[adot]: https://aws-otel.github.io/ "AWS Distro for OpenTelemetry"
[amg]: https://aws.amazon.com/grafana/ "Amazon Managed Service for Grafana"
[amp]: https://aws.amazon.com/prometheus/ "Amazon Managed Service for Prometheus"
[batch]: https://aws.amazon.com/batch/ "AWS Batch"
[beans]: https://aws.amazon.com/elasticbeanstalk/ "AWS Elastic Beanstalk"
[cw]: https://aws.amazon.com/cloudwatch/ "Amazon CloudWatch"
[dimensions]: ../dimensions
[dynamodb]: https://aws.amazon.com/dynamodb/ "Amazon DynamoDB"
[ec2]: https://aws.amazon.com/ec2/ "Amazon EC2"
[ecs]: https://aws.amazon.com/ecs/ "Amazon Elastic Container Service"
[eks]: https://aws.amazon.com/eks/ "Amazon Elastic Kubernetes Service"
[fargate]: https://aws.amazon.com/fargate/ "AWS Fargate"
[fluentbit]: https://fluentbit.io/ "Fluent Bit"
[jaeger]: https://www.jaegertracing.io/ "Jaeger"
[kafka]: https://kafka.apache.org/ "Apache Kafka"
[kubecpl]: https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html "Amazon EKS control plane logging"
[lambda]: https://aws.amazon.com/lambda/ "AWS Lambda"
[lightsail]: https://aws.amazon.com/lightsail/ "Amazon Lightsail"
[otel]: https://opentelemetry.io/ "OpenTelemetry"
[promex]: https://prometheus.io/docs/instrumenting/exporters/ "Prometheus exporters and integrations"
[rdsmon]: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.LoggingAndMonitoring.html "Logging and monitoring in Amazon RDS"
[s3]: https://aws.amazon.com/s3/ "Amazon S3"
[s3mon]: https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-incident-response.html "Logging and monitoring in Amazon S3"
[sqstrace]: https://docs.aws.amazon.com/xray/latest/devguide/xray-services-sqs.html "Amazon SQS and AWS X-Ray"
[vpcfl]: https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html "VPC Flow Logs"
[xray]: https://aws.amazon.com/xray/ "AWS X-Ray"
[discussion]: https://github.com/aws-observability/aws-o11y-recipes/discussions
[o11yataws]: https://www.youtube.com/playlist?list=PLaiiCkpc1U7Wy7XwkpfgyOhIf_06IK3U_
[o11yhome]: https://aws.amazon.com/products/management-and-governance/use-cases/monitoring-and-observability/
