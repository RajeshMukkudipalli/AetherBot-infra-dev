resource "aws_instance" "bastion" {
    ami = locals.ami_id
    instance_type = t3.micro
    subnet_id = var.subnet_id
    key_name = var.key_name

    tags = merge(var.bastion_tags, local.common_tags, {
        Name = "${var.project}-${var.environment}-bastion"
    })
}