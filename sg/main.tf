module "frontend" {
    source = "git::https://github.com/RajeshMukkudipalli/terraform-aws-securitygrooup.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.frontend_sg_name
    sg_description = var.frontend_sg_description
    vpc_id = local.vpc_id
}


module "bastion" {
    source = "git::https://github.com/RajeshMukkudipalli/terraform-aws-securitygrooup.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.bastion_sg_name
    sg_description = var.bastion_sg_description
    vpc_id = local.vpc_id
}


# bastion is accepting connections from laptop on port 22
resource "aws_security_group_rule" "bastion_laptop" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = module.bastion.sg_id
  
}