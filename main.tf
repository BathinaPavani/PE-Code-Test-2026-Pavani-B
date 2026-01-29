provider "aws" {
    region     = "us-east-1"
    profile    = "default"
}

resource "aws_instance" "ec2_instance_pro_test" {
    ami           = "ami-0c02fb55956c7d316"
    instance_type = "t2.micro"
    tags = {
        Name    = "pro_test_instance"
        project = "pro_test_project"
    }
}

resource "aws_sns_topic" "ec2_sns_alerts" {
    name = "ec2-sns-alerts"
}

// optional
resource "aws_iam_role" "lambda_iam_role" {
    name = "lambda_iam_role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "lambda.amazonaws.com"
                }
            }
        ]
    })
}

resource "aws_lambda_function" "example" {
    function_name    = "example_lambda"
    runtime          = "python3.9"
    handler          = "lambda_function.lambda_handler"
    role             = aws_iam_role.lambda_iam_role.arn
    filename         = "lambda.zip"
    source_code_hash = filebase64sha256("lambda.zip")
    timeout          = 10
    memory_size      = 128
}


