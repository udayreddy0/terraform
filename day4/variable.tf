variable "ami" {
    description = "passing ami value"
    type = string
    default = "ami-02d3770deb1c746ec"
  
}
variable "instance_type" {
    type = string
    default = "t2.micro"
  
}
variable "key_name" {
    type = string
    default = "ter"
  
}
variable "name" {
  description = "The name of the EC2 instance."
  default = "u_d"
}