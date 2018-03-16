terraform {
  backend "s3" {
    region  = "eu-west-1"
    bucket  = "tf-state-dev001-vpc"
    key     = "tf_vpc.tfstate"
    encrypt = true
  }
}

  
