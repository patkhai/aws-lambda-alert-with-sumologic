variable "region" {
  description = "AWS region to deploy resources"
  default     = "us-west-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = ""  # Replace with your preferred AMI
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  default     = "RestartEC2Instance"
}

variable "sns_topic_name" {
  description = "Name of the SNS topic"
  default     = "EC2RestartNotification"
}
