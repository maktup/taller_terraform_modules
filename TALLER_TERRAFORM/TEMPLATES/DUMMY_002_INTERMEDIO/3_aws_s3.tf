
#--------------------------------------------------#
#--------------- CONFIGURACION: 'S3' -------------#
#--------------------------------------------------#
## IMPORTANTE #1: Considerar la misma REGION que la inicial (PROVIDER).  
## IMPORTANTE #2: La idea es que esl SCRIPT: 'Install_MicroService_nodo1.sh', sea creado en un 'BUCKET'
## 'BUCKET' para luego ser accedido desde ahí por las 'INSTANCIAs EC32', para su instalación. 
## IMPORTANTE #3: El 'bucket' del 'S3' debe de ser único en el mundo. 


###### CREANDO RECURSOS: 'S3' ######:
resource "aws_s3_bucket" "bs3_001" {
  bucket        = "${var.const_bucket_s3}"
  acl           = "${var.const_estado_bucket_s3}"
  region        = "${var.const_region}"
  force_destroy = true

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_object" "obj_bs3_001" {
  bucket           = "${aws_s3_bucket.bs3_001.id}"
  key              = "${var.const_nombre_script_sh}"
  source           = "${var.const_directorio_script_sh}"
  content_encoding = "${var.const_content-type_bucket_s3}"
}

data "aws_s3_bucket_object" "obj_bs3_001" {
  bucket = "${aws_s3_bucket.bs3_001.id}"
  key    = "${var.const_nombre_script_sh}"

  depends_on = ["aws_s3_bucket.bs3_001", "aws_s3_bucket_object.obj_bs3_001"]
}

resource "aws_s3_bucket_policy" "polu_bs3_001" {
  bucket = "${aws_s3_bucket.bs3_001.id}"
  policy = "${var.const_policy_fullAccess_bucket_s3}"
}

