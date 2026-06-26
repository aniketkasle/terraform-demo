

# resource "aws_instance" "Test_instance" {
#     instance_type = "t2.micro"


# }

variable "bucket_name" {
    description = "new bucket name"
    type = list(string)

}

resource "aws_s3_bucket" "s3_name" {
    count = length(var.bucket_name)
    bucket = var.bucket_name[count.index]

  tags = {"env" = "Dev",
  "owner" = "Ineo-dev-team",
  "project" = "ineo-dev"
  }

}