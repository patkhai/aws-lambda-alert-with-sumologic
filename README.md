# Setting up Sumologic alerts for AWS Lambda

- In the Sumo Logic UI, go to Manage Data > Monitors > Metric Monitors.
Click on Create Metric Monitor.
Name your monitor and provide a description.
Set the data source to the query you created.


- Quickly create or launch new micro EC2 instances for this test. 

- Set up your AWS Lambda either with Terraform or AWS Console to test out the function

- Set up your SNS Topic along with the AWS lambda function you created

- Using AWS API Gateway (maybe) to create new REST API and POST method for the API. Integrate the method with the lambda function. 

- In Sumologic, configure the alert to send a POST request to the API Gateway endpoint. 

- Make sure you delete everything after creating. 