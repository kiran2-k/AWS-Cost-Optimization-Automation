# AWS Cost Optimization Automation

## Project Overview

Cloud environments often accumulate unused resources such as unattached Amazon EBS volumes, which continue to incur storage costs even when they are no longer in use. Manually identifying and removing these resources is time-consuming and error-prone.

This project automates the identification of unused Amazon EBS volumes using a serverless AWS architecture. A Python-based AWS Lambda function runs on a scheduled basis using Amazon EventBridge, scans all EBS volumes in the AWS account, identifies unattached (`available`) volumes, records detailed execution logs in Amazon CloudWatch, and sends an execution report through Amazon SNS.

To ensure safe operation, the solution supports **Dry Run Mode**, allowing validation without deleting any resources. When deletion is enabled, the Lambda function can automatically remove unused EBS volumes after validation.

---

## Problem Statement

Organizations often leave unattached EBS volumes in their AWS accounts after EC2 instances are terminated. These unused volumes continue to generate storage charges and increase cloud costs.

This project provides an automated solution to:

* Detect unused EBS volumes
* Prevent unnecessary AWS storage costs
* Eliminate manual monitoring
* Improve cloud governance and operational efficiency

---

## Solution Architecture

**Workflow**

1. Amazon EventBridge triggers the Lambda function on a schedule.
2. AWS Lambda executes the Python automation.
3. Boto3 scans all Amazon EBS volumes.
4. The function filters volumes in the **available** state.
5. Information about unused volumes is written to Amazon CloudWatch Logs.
6. An execution summary is sent through Amazon SNS.
7. If deletion mode is enabled, the Lambda safely deletes the unused EBS volumes.

---

## AWS Services Used

* AWS Lambda
* Amazon EC2 (EBS)
* Amazon EventBridge
* Amazon CloudWatch
* Amazon SNS
* AWS IAM
* Python
* Boto3
* Terraform (Infrastructure as Code)
* Git & GitHub

---

## Key Features

* Automated daily EBS volume scanning
* Serverless architecture
* Dry Run mode for safe testing
* Automatic deletion of unused volumes (optional)
* CloudWatch logging for monitoring
* SNS email notifications
* Least-privilege IAM permissions
* Infrastructure managed with Terraform
* Easy deployment and maintenance

---

## Project Workflow

```text
EventBridge Scheduler
        │
        ▼
AWS Lambda (Python)
        │
        ▼
Describe EBS Volumes
        │
        ▼
Filter Available Volumes
        │
 ┌──────┴───────────┐
 │                  │
 ▼                  ▼
CloudWatch Logs   SNS Notification
        │
        ▼
(Optional) Delete Unused Volumes
```

---

## Testing Performed

The project was tested using multiple scenarios:

* No unused EBS volumes
* Single unused EBS volume
* Multiple unused EBS volumes
* Attached EBS volume (ignored)
* Dry Run mode
* Delete mode
* EventBridge scheduled execution
* SNS email notification
* CloudWatch log verification

---

## Benefits

* Reduces unnecessary AWS storage costs
* Eliminates manual operational tasks
* Improves cloud resource governance
* Provides complete execution visibility
* Easy to extend for snapshots, Elastic IPs, and network interfaces

---

## Future Enhancements

* Cleanup of unused EBS snapshots
* Release unused Elastic IP addresses
* Remove unused Elastic Network Interfaces (ENIs)
* AWS Cost Explorer integration
* AWS Budgets integration
* Resource tagging support
* Multi-region scanning
* AWS Config compliance checks

---

## Skills Demonstrated

* AWS Lambda
* Python Automation
* Boto3
* Amazon EC2
* Amazon EBS
* Amazon EventBridge
* Amazon SNS
* Amazon CloudWatch
* IAM Security
* Terraform
* Infrastructure as Code (IaC)
* Git & GitHub
* DevOps Automation
* AWS Cost Optimization
