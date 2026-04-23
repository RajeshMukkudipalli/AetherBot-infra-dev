resource "aws_instance" "bastion" {
    ami = locals.ami_id
    instance_type = t3.micro
    vpc_security_group_ids = local.bastion_sg_id
    subnet_id = aws_subnet.public.id
    
}