variable "tag_name" {
    type = list(string)
    default = [ "terraform","reddy","uday" ]
  
}
variable "instance_type" {
    type = string
    default = "t2.micro"
  
}
variable "keypair" {
    type = string
    default = "ter"
  
}
