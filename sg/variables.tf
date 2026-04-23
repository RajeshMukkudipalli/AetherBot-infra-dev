variable "project" {
    type = string
    }

variable "environment" {
    type = string
}

variable "frontend_sg_name" {
    type = string
    default = "frontend-sg"
}

variable "frontend_sg_description" {
    type = string
    default = "Allowing port no 80"
}

variable "sg_tags "{
    type = map(string)
    default = {
        
    }
}