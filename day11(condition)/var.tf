variable "tag_name" {
    type = list(string)
    default = [ "terraform","touf","aws" ]
  
}
variable "instance_type" {
    type = string
    default = "t2.micro"
    validation {
    condition     = contains(["t2.micro", "t2.small", "t2.medium"], var.instance_type)
    error_message = "Instance type must be one of 't2.micro', 't2.small', or 't2.medium'."
  }
  
}
variable "keypair" {
    type = string
    default = "ter"
  
}