output printfirst {
    value = "${join("--->",var.users)}"
}

output helloworld {
    value = "${upper(var.users[0])}"
}

output helloworlds {
    value = "${lower(var.users[0])}"
}

output helloworldss {
    value = "${title(var.users[0])}"
}