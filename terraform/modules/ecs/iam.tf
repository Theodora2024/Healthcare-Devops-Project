
resource "aws_iam_role_policy_attachment" "execution_policy" {
  role       = var.execution_role_arn
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}