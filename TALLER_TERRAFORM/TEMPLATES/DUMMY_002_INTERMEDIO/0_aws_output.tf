
#--------------------------------------------------#
#------------- CONFIGURACIÓN: 'OUTPUTs' -----------#
#--------------------------------------------------# 
## IMPORTANTE #1: Se debe considerar este archivo para la 'IMPRESION' en consola
## de la informacion de diferentes RECURSOS de 'AWS'. 
 

###### IMPRIMIENTO OUTPUTs [IAM] ######:
//-------- 'ACCESS-KEY'- 'SECRET-KEY' --------:
output "OUT_INFO_RGUERRA" {
  value = {
    "_ACCESS_KEY"  = "${aws_iam_access_key.ak_rguerra.id}"
    "_SECRET_KEY"  = "${aws_iam_access_key.ak_rguerra.secret}" 
  }
}

output "OUT_INFO_MGRASO" {
  value = {
    "_ACCESS_KEY"  = "${aws_iam_access_key.ak_mgrasso.id}"
    "_SECRET_KEY"  = "${aws_iam_access_key.ak_mgrasso.secret}" 
  }
}

output "OUT_INFO_PCRIADO" {
  value = {
    "_ACCESS_KEY"  = "${aws_iam_access_key.ak_pcriado.id}"
    "_SECRET_KEY"  = "${aws_iam_access_key.ak_pcriado.secret}" 
  }
}

###### IMPRIMIENTO OUTPUTs [S3] ######:
//-------- 'BUCKET' --------: 
output "OUT_INFO_S3" {
  value = {
    "_bucket.id"  = "${aws_s3_bucket.bs3_001.id}"
    "_bucket.arn" = "${aws_s3_bucket.bs3_001.arn}"
    "_object.key" = "${aws_s3_bucket_object.obj_bs3_001.key}"
  }
}


###### IMPRIMIENTO OUTPUTs [API-GATEWAY] ######:
output "OUT_URI_API-GATEWAY_BE" {
  value = "${aws_api_gateway_integration.agi_001.uri}" 
}

