resource "aws_eip" "EIP" {
  vpc              = true
  tags = {
    Name = "EIP"
  }

}
resource "aws_nat_gateway" "NATGW" {
    allocation_id = aws_eip.EIP.id
    subnet_id = "${aws_subnet.public_subnets[0].id}"

    tags = {
        Name  = "NATGW"
    }
    depends_on = [aws_eip.EIP,aws_subnet.public_subnets]
  
}