variable "usersage" {
    type = map 
    default = {
        aniket = 24
        ronak = 23
    }
}

variable username {
    type = string
}

output "userage" {
    value = "My name is ${var.username} and my age is ${lookup(var.usersage,"${var.username}")}"
}