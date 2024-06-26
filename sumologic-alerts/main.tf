provider "aws" {
  region = var.region
}


resource "aws_sns_topic" "alert_topic" {
  name = var.sns_topic_name
}


resource "aws_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "SumoLogicAlertInstance"
  }
}


