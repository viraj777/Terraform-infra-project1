variable "port" {
    type = map
    default = {1 = 80,2 = 443,3 = 22, 4 = 8080}
}




variable "services" {
    type = map
    default = {"Jenkins" = "./Jenkins_install.txt","Ansible-controller" = "./Ansible installation.txt","node1" = "","node2" = ""}
}
