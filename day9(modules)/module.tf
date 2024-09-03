module "name" {
    source = "github.com/udayreddy0/cmd/day2"
}



module "name" {
   source = "../day2"
   ami = "ami-02d3770deb1c746ec"
   instance_type = "t2.micro"
   key_name = "ter"

}