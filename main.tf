resource "aws_elb" "aws_elb_1" {
  tags = merge(var.tags, {})

  availability_zones = [
    "us-east-1a",
  ]

  instances = [
    aws_subnet.aws_subnet_3,
    aws_subnet.aws_subnet_5,
    aws_subnet.aws_subnet_6,
  ]
}

resource "aws_vpc" "aws_vpc_2" {
  tags = merge(var.tags, {})
}

resource "aws_subnet" "aws_subnet_3" {
  vpc_id = aws_vpc.aws_vpc_2.id
  tags   = merge(var.tags, {})
}

resource "aws_s3_bucket" "aws_s3_bucket_4" {
  tags = merge(var.tags, {})
}

resource "aws_subnet" "aws_subnet_5" {
  vpc_id = aws_vpc.aws_vpc_2.id
  tags   = merge(var.tags, {})
}

resource "aws_subnet" "aws_subnet_6" {
  vpc_id = aws_vpc.aws_vpc_2.id
  tags   = merge(var.tags, {})
}

resource "aws_lambda_function" "aws_lambda_function_7" {
  tags          = merge(var.tags, {})
  function_name = ""

  vpc_config {
    security_group_ids = [
      aws_subnet.aws_subnet_5,
    ]
  }
}

resource "aws_instance" "f1_8" {
  tags              = merge(var.tags, {})
  subnet_id         = aws_subnet.aws_subnet_6.id
  availability_zone = aws_subnet.aws_subnet_6
}

resource "aws_db_instance" "db_instance_service1_c_c" {
  username             = "db_user1"
  storage_type         = "gp2"
  password             = "password1"
  parameter_group_name = "default.mysql5.7"
  instance_class       = "db.t2.micro"
  engine_version       = "5.7"
  engine               = "mysql"
  availability_zone    = aws_subnet.aws_subnet_5
  allocated_storage    = 20

  # Custom code not handled by Brainboard
  name              = "db_service1"
  subnet_group_name = aws_db_subnet_group.db_subnet_group.name
}

resource "aws_db_instance" "db_instance_service2_c_c" {
  username             = "db_user2"
  storage_type         = "gp2"
  password             = "password2"
  parameter_group_name = "default.mysql5.7"
  instance_class       = "db.t2.micro"
  engine_version       = "5.7"
  engine               = "mysql"
  availability_zone    = aws_subnet.aws_subnet_6
  allocated_storage    = 20

  # Custom code not handled by Brainboard
  subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  name              = "db_service2"
}

resource "aws_db_instance" "db_instance_service3_c_c_1_c" {
  username             = "db_user3"
  storage_type         = "gp2"
  password             = "password3"
  parameter_group_name = "default.mysql5.7"
  instance_class       = "db.t2.micro"
  engine_version       = "5.7"
  engine               = "mysql"
  availability_zone    = aws_subnet.aws_subnet_3
  allocated_storage    = 20

  # Custom code not handled by Brainboard
  subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  name              = "db_service3"
}


