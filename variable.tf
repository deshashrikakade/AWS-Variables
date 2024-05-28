variable "elbname" {
    type = string
}

variable "elbtimeout" {
    type = number
}

variable "instancetype" {
    type = list
    default = ["t2.micro", "t2.small"]
}

variable "instancename" {
    type = list
    default = ["Jenkins", "Ansible"]
}
