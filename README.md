# PE-Code-Test-2026-Pavani-B
Step1:
I am implementing Task 1 of the coding test.
I am using Sumo Logic to identify slow API responses.
This query filters logs for the /api/data endpoint and checks for response times greater than 3 seconds.
After validating the query results, I created a log monitor that triggers an alert if more than five such events occur within a ten-minute window.
This helps detect application performance issues early.

“The query returned no results because there were no /api/data requests exceeding 3 seconds in the selected time window. This indicates normal application performance at the time of analysis. The alert is still correctly configured and will trigger automatically when the threshold condition is met in the future.”

STEP 2: AWS LOGIN & REGION
I opened a browser
Went to https://aws.amazon.com
Clicked Sign in to the Console
Logged into my AWS account
From the top-right corner, I selected the region:
US East (N. Virginia – us-east-1)
“I used the us-east-1 region for all resources.” 


STEP 3: CREATE EC2 INSTANCE
In AWS Console search bar, I typed EC2
Clicked EC2
Clicked Launch instance
Entered name: AutoRecoveryEC2
Selected Amazon Linux 2 AMI
Selected instance type: t2.micro
Created or selected a key pair
Allowed default security group
Clicked Launch instance
Waited until instance status showed Running
“This EC2 instance represents the application server.” 


STEP 4: CREATE SNS TOPIC
In AWS Console search bar, I typed SNS
Clicked Simple Notification Service
Clicked Topics
Clicked Create topic
Selected Standard
Topic name: ec2-restart-alerts
Clicked Create topic 
review

STEP 5: CREATE SNS SUBSCRIPTION

Opened the SNS topic
Clicked Create subscription
Selected protocol: Email
Entered my email address
Clicked Create subscription
Opened my email inbox
Clicked Confirm subscription
“This enables email notifications.” 



STEP 6: CREATE LAMBDA FUNCTION
In AWS Console search bar, I typed Lambda
Clicked Lambda
Clicked Create function
Selected Author from scratch
Function name: ec2_restart_lambda
Runtime: Python
Clicked Create function 


STEP 7: ADD LAMBDA CODE
Opened the Lambda function
Scrolled to Code source
Replaced the default code with Python code to:
○ Reboot EC2
○ Publish SNS notification
Clicked Deploy 



STEP 8: CONFIGURE ENVIRONMENT VARIABLES
Clicked Configuration
Clicked Environment variables
Added:
INSTANCE_ID = EC2 instance ID
SNS_TOPIC_ARN = SNS topic ARN
Clicked Save 


STEP 9: FIX IAM PERMISSIONS
In Lambda, clicked Configuration
Clicked Permissions
Clicked the Execution role
Clicked Add permissions
Attached:
 AmazonEC2FullAccess
 AmazonSNSFullAccess
Saved changes
“This allows Lambda to reboot EC2 and publish to SNS.” 



STEP 10: TEST LAMBDA FUNCTION
Clicked Test
Created a test event
Clicked Test
Verified:
○ Lambda succeeded
○ EC2 rebooted
○ SNS email received 



STEP 11: TERRAFORM SETUP (VS CODE)
Opened Visual Studio Code
Clicked File → Open Folder
Selected pacerpro-terraform
Created file: main.tf
Added Terraform code for:
○ AWS provider
○ EC2 instance
○ SNS topic 



STEP 12: OPEN TERMINAL IN VS CODE
Clicked Terminal
Clicked New Terminal
Selected Git Bash 


STEP 13: RUN TERRAFORM COMMANDS
In terminal, I ran:
terraform init
terraform plan
terraform apply
“Terraform apply completed successfully.” 


STEP 14: GIT & GITHUB
Ran git init
Ran git add .
Ran git commit
Created a GitHub repository
Added remote
Pushed code to GitHub 

