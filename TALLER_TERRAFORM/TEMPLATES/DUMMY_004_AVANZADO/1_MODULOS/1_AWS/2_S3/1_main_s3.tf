
#--------------------------------------------------#
#--------------- CONFIGURACION: 'S3' --------------#
#--------------------------------------------------#
## IMPORTANTE #1: Como TODO está 'MODULARIZADO', es importante preguntarnos: 
## 1. ¿QUE DESEAMOS 'PERSONALIZAR' ... DE LO QUE YA ESTÁ?.
## 2. ¿QUE DESEAMOS 'REUTILIZAR' ... DE LO QUE YA ESTÁ?.

## IMPORTANTE #2: Lo que se desea 'PERSONALIZAR', se tendrá que 'SOBREESCRIBIR'. 
## IMPORTANTE #3: Lo definidos como 'DINAMICOS' son 'REFERENCIAS EXTERNAS' a otros 'MÓDULOS'.
## Estos deberán der 'DECLARADOS' como CONSTANTE para ser luego 'SOBREESCRITOS' en: 'main_*_desa'.   

## IMPORTANTE #4: SI existen valores 'DUPLICADOS' entre los 'MÓDULOS', estos se tendrán
## que considerar & registrar 'INDEPENDIENTEMENTE' por 'MÓDULO'.


###### CREANDO RECURSOS: 'S3' ######:
resource "aws_s3_bucket" "bs3_001" {
  bucket        = "${var.const_bucket_s3}"
  acl           = "${var.const_estado_bucket_s3}"
  region        = "${var.const_region}" //Este valor debe ser 'SOBREESCRITO'.
  force_destroy = true

  versioning {
    enabled = true
  }
}
 

resource "aws_s3_bucket_object" "obj_bs3_001" {
  bucket           = "${aws_s3_bucket.bs3_001.id}"         
  key              = "${var.const_nombre_script_sh}"       //Este valor debe ser 'SOBREESCRITO'. 
  source           = "${var.const_directorio_script_sh}"   //Este valor debe ser 'SOBREESCRITO'.
  content_encoding = "${var.const_content-type_bucket_s3}" //Este valor debe ser 'SOBREESCRITO'.
}

data "aws_s3_bucket_object" "obj_bs3_001" {
  bucket = "${aws_s3_bucket.bs3_001.id}"
  key    = "${var.const_nombre_script_sh}" //Este valor debe ser 'SOBREESCRITO'.

  depends_on = ["aws_s3_bucket.bs3_001", "aws_s3_bucket_object.obj_bs3_001"]
}

resource "aws_s3_bucket_policy" "polu_bs3_001" {
  bucket = "${aws_s3_bucket.bs3_001.id}"
  policy = "${var.const_policy_fullAccess_bucket_s3}" //Este valor debe ser 'SOBREESCRITO'.
}

