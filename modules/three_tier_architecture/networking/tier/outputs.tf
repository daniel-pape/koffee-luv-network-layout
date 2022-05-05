output "subnet_ids" {
  value = {
    public_subnet_id = aws_subnet.module_public.id
    app_subnet_id    = aws_subnet.module_app.id
    db_subnet_id     = aws_subnet.module_db.id
  }
}