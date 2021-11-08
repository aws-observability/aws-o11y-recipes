# Cloudwatch Metric Stream Exporter

###### This project is not maintained and should be used as is.
### Description
The Cloudwatch Metric Stream Exporter allows for users to send their metrics coming through Cloudwatch Metric Streams directly to Amazon Managed Prometheus (AMP) via remote write protocol. 



### Prerequisites
* Node 
* Golang

### Setup Guide
1. Clone repo
2. On the root of the repo, do `npm install` to install the dependencies for the root.
3. `cd cdk && npm install` to install; the dependencies for the cdk.
4. Update AMP workspace url and AMP region in `config.yaml` and the extra parameters (S3 Bucket Name, Kinesis Firehose Name).
5. At the root of the repo, run npm build to automatically build the cdk pipeline and deploy a stack to the AWS account. The CDK uses the stored AWS credentials in `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`. The golang binary is deployed with the code in `lambda/main.go`.
6. Navigate to https://console.aws.amazon.com/cloudwatch/home#metric-streams:streamsList and click `Create Metric Stream`.
7. Select the namespaces to be exported to the metric stream.
8. Select Kinesis Firehose as the destination, and choose the Firehose created by the cdk (should have a name starting with CdkStackKinesisFirehoseStream...)
8. Choose JSON format as the exported metric format.

### Assumptions
* The Cloudwatch Metric Stream Exporter only sends metrics to AMP as the remote_write destination.


### Design
* The exporter uses the AWS CDK to generate a stack consisting of:
    * Lambda Function 
    * S3 Bucket
    * Kinesis Firehose