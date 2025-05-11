provider "aws" {
  region = "sa-east-1"
}

# Criação do bucket S3
resource "aws_s3_bucket" "deploy_bucket" {
  bucket        = "meu-bucket-deploy-automacao-luiz"
  force_destroy = true

  tags = {
    Owner       = "luiz"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

# Configuração do bucket como site estático
resource "aws_s3_bucket_website_configuration" "static_site" {
  bucket = aws_s3_bucket.deploy_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

# Tornar o bucket público para leitura
resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.deploy_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = "*",
      Action    = ["s3:GetObject"],
      Resource  = "${aws_s3_bucket.deploy_bucket.arn}/*"
    }]
  })
}
