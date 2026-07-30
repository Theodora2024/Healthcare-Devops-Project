resource "aws_secretsmanager_secret" "healthcare" {

  name = "${var.project_name}-${var.environment}-secret"

}

resource "aws_secretsmanager_secret_version" "healthcare" {

  secret_id = aws_secretsmanager_secret.healthcare.id

  secret_string = jsonencode({

    DATABASE_URL = var.database_url

    SECRET_KEY = var.secret_key

    DB_USERNAME = var.db_username

    DB_PASSWORD = var.db_password

  })

}