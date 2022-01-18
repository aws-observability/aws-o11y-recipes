# Terraform as Infrastructure as a Code to deploy Amazon Managed Service for Prometheus and configure Alert manager

In this recipe, we will demonstrate how you can use [Terraform](https://www.terraform.io/) to provision [Amazon Managed Service for Prometheus](https://aws.amazon.com/prometheus/) and configure rules management and alert manager to send notification to a [SNS](https://docs.aws.amazon.com/sns/) topic if a certain condition is met.


!!! note
    This guide will take approximately 30 minutes to complete.

## Prerequisites
You will need the following to complete the steps in this blog post:
* [Amazon EKS cluster](https://docs.aws.amazon.com/eks/latest/userguide/create-cluster.html) 
* [AWS CLI version 2](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
* [Terraform CLI](https://www.terraform.io/downloads)
* [AWS Distro for OpenTelemetry(ADOT)](https://aws-otel.github.io/)
* [eksctl](https://eksctl.io/)
* [kubectl](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)
* [jq](https://stedolan.github.io/jq/download/)
* [helm](https://helm.sh/)
* [SNS topic](https://docs.aws.amazon.com/sns/latest/dg/sns-create-topic.html)
* [awscurl](https://github.com/okigan/awscurl)

In the recipe, we will use a sample application in order to demonstrate the metric scraping using ADOT and remote write the metrics to the workspace. Fork and clone the sample app from the repository at aws-otel-community (https://github.com/aws-observability/aws-otel-community). Execute the below commands to deploy application inside the EKS cluster. 

This Prometheus sample app generates all 4 Prometheus metric types (counter, gauge, histogram, summary) and exposes them at the /metrics endpoint

A health check endpoint also exists at /

The following is a list of optional command line flags for configuration:

listen_address: (default = 0.0.0.0:8080)this defines the address and port that the sample app is exposed to. This is primarily to conform with the test framework requirements.
metric_count: (default=1) the amount of each type of metric to generate. The same amount of metrics is always generated per metric type.
label_count: (default=1) the amount of labels per metric to generate.
datapoint_count: (default=1) the number of data-points per metric to generate.

### Enabling Metric collection using AWS Distro for Opentelemetry
1. Fork and clone the sample app from the repository at aws-otel-community.
Then run the following commands.

```
cd ./sample-apps/prometheus
docker build . -t prometheus-sample-app:latest
```
2. Push this image to a registry such as Amazon ECR. You can use the following command to create a new ECR repository in your account. Make sure to set <YOUR_REGION> as well.

```
aws ecr create-repository \
    --repository-name prometheus-sample-app \
    --image-scanning-configuration scanOnPush=true \
    --region <YOUR_REGION>
```

4. Deploy the sample app in the cluster by copying this Kubernetes configuration and applying it. Change the image to the image that you just pushed by replacing {{PUBLIC_SAMPLE_APP_IMAGE}} in the prometheus-sample-app.yaml file.

```
curl https://raw.githubusercontent.com/aws-observability/aws-otel-collector/main/examples/eks/aws-prometheus/prometheus-sample-app.yaml -o prometheus-sample-app.yaml
kubectl apply -f prometheus-sample-app.yaml
```
4. Start a default instance of the ADOT Collector. To do so, first enter the following command to pull the Kubernetes configuration for ADOT Collector.

```
curl https://raw.githubusercontent.com/aws-observability/aws-otel-collector/main/examples/eks/aws-prometheus/prometheus-daemonset.yaml -o prometheus-daemonset.yaml
```
Then edit the template file, substituting the remote_write endpoint for your Amazon Managed Service for Prometheus workspace for YOUR_ENDPOINT and your Region for YOUR_REGION. Use the remote_write endpoint that is displayed in the Amazon Managed Service for Prometheus console when you look at your workspace details.
You'll also need to change YOUR_ACCOUNT_ID in the service account section of the Kubernetes configuration to your AWS account ID.
In this recipe, the ADOT Collector configuration uses an annotation (scrape=true) to tell which target endpoints to scrape. This allows the ADOT Collector to distinguish the sample app endpoint from kube-system endpoints in your cluster. You can remove this from the re-label configurations if you want to scrape a different sample app.
5. Enter the following command to deploy the ADOT collector.
```
kubectl apply -f eks-prometheus-daemonset.yaml
```

### Deploying the Terraform module to configure Amazon Managed service for Prometheus workspace, recording rules & alert manager

Now, we will  provision a Amazon Managed Service for Prometheus workspace and will define an alerting rule that causes the Alert Manager to send a notification if a certain condition (defined in ```expr```) holds true for a specified time period (```for```). Code in the Terraform language is stored in plain text files with the .tf file extension. There is also a JSON-based variant of the language that is named with the .tf.json file extension.

We will now use the [main.tf](./amp-alertmanager-terraform/main.tf) to deploy the resources using terraform. Make sure the varibale SNS_TOPIC in the main.tf is properly set

```
terraform init
terraform plan
terraform apply
```

Once the above steps are complete, verify the setup end-to-end by using awscurl and query the endpoint. Look for the metric “metric:recording_rule”, and, if you successfully find the metric, then you’ve successfully created a recording rule:

```
awscurl https://aps-workspaces.us-east-1.amazonaws.com/workspaces/$WORKSPACE_ID/api/v1/rules  --service="aps"
awscurl https://aps-workspaces.us-east-1.amazonaws.com/workspaces/$WORKSPACE_ID/alertmanager/api/v2/alerts --service="aps" -H "Content-Type: application/json"
```

## Clean up

Run the following command to terminate the Amazon Managed Service for Prometheus workspace. Make sure you delete the EKS Cluster created as well:


```
terraform destroy
```

