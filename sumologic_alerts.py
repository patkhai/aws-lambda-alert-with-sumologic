import json
import boto3
import logging

# Configure logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

ec2 = boto3.client('ec2')
sns = boto3.client('sns')

# Replace with your EC2 instance ID and SNS topic ARN
INSTANCE_ID = ''
SNS_TOPIC_ARN = ''


def lambda_handler(event, context):
    try:
        # Restart the EC2 instance
        logger.info(f"Restarting EC2 instance: {INSTANCE_ID}")
        ec2.reboot_instances(InstanceIds=[INSTANCE_ID])
        logger.info(f"EC2 instance {INSTANCE_ID} restarted successfully.")

        # Send a notification to SNS
        message = f"EC2 instance {INSTANCE_ID} has been restarted due to a Sumo Logic alert."
        response = sns.publish(
            TopicArn=SNS_TOPIC_ARN,
            Message=message,
            Subject='EC2 Instance Restart Notification'
        )
        logger.info(f"Notification sent to SNS topic: {SNS_TOPIC_ARN}")
        return {
            'statusCode': 200,
            'body': json.dumps('EC2 instance restarted and notification sent.')
        }
    except Exception as e:
        logger.error(f"Error restarting EC2 instance: {str(e)}")
        return {
            'statusCode': 500,
            'body': json.dumps(f"Error: {str(e)}")
        }
