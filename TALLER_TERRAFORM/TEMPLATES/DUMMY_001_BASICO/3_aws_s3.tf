
#--------------------------------------------------#
#--------------- CONFIGURACION: 'S3' -------------#
#--------------------------------------------------#
## IMPORTANTE #1: Considerar la misma REGION que la inicial (PROVIDER).  
## IMPORTANTE #2: La idea es que esl SCRIPT: 'Install_MicroService_nodo1.sh', sea creado en un 'BUCKET'
## 'BUCKET' para luego ser accedido desde ahí por las 'INSTANCIAs EC32', para su instalación. 
## IMPORTANTE #3: El 'bucket' del 'S3' debe de ser único en el mundo. 


###### CREANDO RECURSOS: 'S3' ######:
resource "aws_s3_bucket" "bs3_001" {
  bucket        = "capacitacion-terraform"
  acl           = "private"
  region        = "us-east-1"
  force_destroy = true

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_object" "obj_bs3_001" {
  bucket           = "${aws_s3_bucket.bs3_001.id}"
  key              = "Install_MicroService_nodo1.sh"
  source           = "SCRIPTS/Install_MicroService_nodo1.sh"
  content_encoding = "text/plain"
}

data "aws_s3_bucket_object" "obj_bs3_001" {
  bucket = "${aws_s3_bucket.bs3_001.id}"
  key    = "Install_MicroService_nodo1.sh"

  depends_on = ["aws_s3_bucket.bs3_001", "aws_s3_bucket_object.obj_bs3_001"]
}

resource "aws_s3_bucket_policy" "polu_bs3_001" {
  bucket = "${aws_s3_bucket.bs3_001.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "MY_BUCKET_POLICY",
  "Statement": [
    {
      "Sid": "IPAllow",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.bs3_001.id}/*"
    }
  ]
}
POLICY
}

