provider "aws" {
    region="us-east-1"
}
resource "aws_instance""EC2_1inctest"{
    ami = "ami-0c02fb55956c7d316"
    instance_type = "t2.micro"
    tags={
        Name="EC2_1inctest"
        project="Terraform"    }
}
resource "aws_sns_topic" "ec2_start_stop_topic" {
    name = "ec2-start-stop-topic"
}
//optional   
resource "aws_iam_role" "lamda_role"{
    name = "lambda_ec2_start_stop_role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "lambda.amazonaws.com"
                }
            },
        ]
    })
}
resource "aws_lambda_function" "ec2_example"{
    function_name ="example_lambda"
    runtime = "python3.9"
    handler="lambda_function.lambda_handler"
    role = aws_iam_role.lamda_role.arn 
    filename ="lambda.zip"
    source_code_hash = filebase64sha256("lambda.zip")
    timeout =10
    memory_size =128 
    }