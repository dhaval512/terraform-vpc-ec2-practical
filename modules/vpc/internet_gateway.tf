resource "aws_internet_gateway" "IGW_TF" {
    depends_on = [aws_vpc.mainvpc, aws_subnet.public_subnets]
  vpc_id = aws_vpc.mainvpc.id

  tags = {
    Name = "IGW_TF"
  }

}
output "internetgateway" {
  value = aws_internet_gateway.IGW_TF.id

}