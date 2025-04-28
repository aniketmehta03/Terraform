variable username {
    type = string
}

output printname {
    value = "hello your name is ${var.username}"
}