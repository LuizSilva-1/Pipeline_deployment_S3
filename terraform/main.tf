provider "aws" {
  region = "us-east-1"
}

# Criação do bucket com nome único
resource "aws_s3_bucket" "deploy_bucket" {
  bucket        = "meepo-arc-luiz-puc-minas"
  force_destroy = true

  tags = {
    Owner       = "luiz"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

# Desbloqueia o acesso público (obrigatório para sites estáticos)
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.deploy_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Configura como site estático
resource "aws_s3_bucket_website_configuration" "static_site" {
  bucket = aws_s3_bucket.deploy_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

# Permite leitura pública do conteúdo
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
