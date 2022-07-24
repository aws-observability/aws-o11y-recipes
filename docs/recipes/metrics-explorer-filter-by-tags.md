# Using Amazon CloudWatch Metrics explorer to aggregate and visualize metrics filtered by resource tags

In this recipe we show you how to use Metrics explorer to filter, aggregate, and visualize metrics by resource tags and resource properties - [Use metrics explorer to monitor resources by their tags and properties][metrics-explorer] 

</br>There are number of ways to create visualizations with Metrics explorer; in this walkthrough we simply leverage the AWS Console.

!!! note
    This guide will take approximately 5 minutes to complete.

## Prerequisites

* Access to AWS account
* Access to Amazon CloudWatch Metrics Explorer via AWS Console
* Resource tags set for the relevant resources 


## Metrics Explorer tag based queries and visualizations

1. Open the CloudWatch console 

2. Under <b>Metrics</b>, click on the <b>Explorer</b> menu </br>
<img src="../images/metrics-explorer-filter-by-tags/metrics-explorer-cw-menu.png" alt="Screen shot of the CloudWatch menu" width="271" height="382" style="vertical-align:left">

3. You can either choose from one of the <b>Generic templates</b> or a <b>Service based templates</b> list; in this example we used the <b>EC2 Instances by type</b> template
<img src="../images/metrics-explorer-filter-by-tags/metrics-explorer-templates-ec2-by-type.png" alt="Screen shot of Explorer templates" width="250" height="601" style="vertical-align:left">

4. Choose metrics you would like to explore (remove obsolete once, and add other metrics you would like to see)
<img src="../images/metrics-explorer-filter-by-tags/metrics-explorer-ec2-metrics.png" alt="Screen shot of EC2 metrics" width="424" height="393" style="vertical-align:left">

5. Under <b>From</b>, choose a resource tag or a resource property you are looking for; in below example we are using Tag named a <b>Name</b>, with <b>TeamX</b> as a value showing number of CPU and Network metrics for different EC2 instances with <b>Name: TeamX</b> Tag set
<img src="../images/metrics-explorer-filter-by-tags/metrics-explorer-templates-ec2-tag-team-x-y.png" alt="Screen shot of EC2 metrics" width="386" height="176" style="vertical-align:left>

6. You can combine time series using an aggregation function under <b>Aggregated by</b>; in the below example TeamX metrics are aggregated by <b>Availability Zone</b>
<img src="../images/metrics-explorer-filter-by-tags/metrics-explorer-ec2-by-tag-name-dashboard.png" alt="Screen shot of EC2 metrics" style="vertical-align:left">

Alternatively, you could aggregate <b>TeamX</b> and <b>TeamY</b> by the <b>Team</b> Tag, or choose any other configuration that suits your use-case
<img src="../images/metrics-explorer-filter-by-tags/metrics-explorer-ec2-by-tag-team-dashboard.png" alt="Screen shot of EC2 metrics" style="vertical-align:left">

## Dynamic visualizations
You can easily customize your visualizations by using <b>From</b>, <b>Aggregated by</b> and <b>Split by</b> options. Metrics explorer visualizations are dynamic, so any new tagged resource automatically appears in the explorer widget.

## Reference

For more information on Metrics explorer please refer to following article:
https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Metrics-Explorer.html

[metrics-explorer]: https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Metrics-Explorer.html
