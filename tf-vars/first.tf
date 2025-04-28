variable age {
    type = number
}

variable username {
    type = string
}

output printname {
    value = "hello/ your name is ${var.username} and you age is ${var.age}"
}