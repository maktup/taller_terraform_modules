
#----------------------------------------------------#
#------------- OUTPUT [PRINCIPAL]: 'DESA' -----------#
#----------------------------------------------------# 
## IMPORTANTE #1: Este archivo 'OUTPUT' referenciará a los 'OUPTUTs' de cada 'MÓDULO', para IMPRIMIR. 
## Si NO se referencia desde aquí, NO se imprimirá nada.  


########################################################
########### IMPRIMIENTO 'OUTPUTs' [ESTÁTICO] ###########
########################################################
 
//--------------- IMPRIMIENTO '[IAM]' ---------------//
output "const_grp_administrators" {
  value = "${module.modulo_iam.const_grp_administrators}"
}
output "const_grp_developers" {
  value = "${module.modulo_iam.const_grp_developers}"
}
output "const_grp_architects" {
  value = "${module.modulo_iam.const_grp_architects}"
}
output "const_grp_others" {
  value = "${module.modulo_iam.const_grp_others}"
}
output "const_usuario_001" {
  value = "${module.modulo_iam.const_usuario_001}"
}
output "const_usuario_002" {
  value = "${module.modulo_iam.const_usuario_002}"
}
output "const_usuario_003" {
  value = "${module.modulo_iam.const_usuario_003}"
}
output "const_info_RGUERRA" {
  value = "${module.modulo_iam.const_info_RGUERRA}"
}
output "const_info_MGRASO" {
  value = "${module.modulo_iam.const_info_MGRASO}"
}
output "const_info_PCRIADO" {
  value = "${module.modulo_iam.const_info_PCRIADO}"
}


//--------------- IMPRIMIENTO '[S3]' ---------------//
output "const_region" {
  value = "${module.modulo_s3.const_region}"
}
output "const_nombre_script_sh" {
  value = "${module.modulo_s3.const_nombre_script_sh}"
}
output "const_directorio_script_sh" {
  value = "${module.modulo_s3.const_directorio_script_sh}"
}
output "const_content-type_bucket_s3" {
  value = "${module.modulo_s3.const_content-type_bucket_s3}"
}
output "const_policy_fullAccess_bucket_s3" {
  value = "${module.modulo_s3.const_policy_fullAccess_bucket_s3}"
}


########################################################
########### IMPRIMIENTO 'OUTPUTs' [DINÁMICO] ###########
########################################################
//--------------- IMPRIMIENTO '[IAM]' ---------------//
output "const_id_group_admin_iam" {
  value = "${module.modulo_iam.const_id_group_admin_iam}"
}
output "const_id_user_admin_iam" {
  value = "${module.modulo_iam.const_id_user_admin_iam}"
}


//--------------- IMPRIMIENTO '[S3]' ---------------//
output "const_id_bucket_s3" {
  value = "${module.modulo_s3.const_id_bucket_s3}"
}
output "const_id_object_s3" {
  value = "${module.modulo_s3.const_id_object_s3}"
}


//--------------- IMPRIMIENTO '[VPC]' ---------------//
output "const_id_vpc" {
  value = "${module.modulo_vpc.const_id_vpc}"
}
output "const_cidrblok_vpc" {
  value = "${module.modulo_vpc.const_cidrblok_vpc}"
}


//--------------- IMPRIMIENTO '[SUBNET]' ---------------//
//NO exite. 


//----------- IMPRIMIENTO '[INTERNET_GATEWAY]' -----------//
output "const_id_ig" {
  value = "${module.modulo_internet_gateway.const_id_ig}"
}

//----------- IMPRIMIENTO '[ROUTE_TABLE]' -----------//
output "const_id_01_rt" {
  value = "${module.modulo_route_table.const_id_01_rt}"
}

output "const_ext_lista_ids_subnets" {
  value = "${module.modulo_subnet.const_ext_lista_ids_subnets}"
}

//----------- IMPRIMIENTO '[SECURITY_GROUP]' -----------//
output "const_id_sg" {
  value = "${module.modulo_security_group.const_id_sg}"
}

//----------- IMPRIMIENTO '[KEY-PAIR]' -----------//
output "const_ext_lista_ids_kp" {
  value = "${module.modulo_key_pair.const_ext_lista_ids_kp}"
}
output "const_contenido_public_keyPair" {
  value = "${module.modulo_key_pair.const_contenido_public_keyPair}"
}
output "const_archivo_public_keyPair" {
  value = "${module.modulo_key_pair.const_archivo_public_keyPair}"
}
output "const_kp_01_id" {
  value = "${module.modulo_key_pair.const_kp_01_id}"
}
output "const_kp_02_id" {
  value = "${module.modulo_key_pair.const_kp_02_id}"
}
output "const_kp_03_id" {
  value = "${module.modulo_key_pair.const_kp_03_id}"
}

//----------- IMPRIMIENTO '[EC2]' -----------//
output "const_ext_lista_ids_ec2" {
  value = "${module.modulo_ec2.const_ext_lista_ids_ec2}"
}

//----------- IMPRIMIENTO '[KEY-PAIR]' -----------//
output "const_ext_list_ids_eip" {
  value = "${module.modulo_eip.const_ext_list_ids_eip}"
}

//----------- IMPRIMIENTO '[ELB]' -----------//
output "const_ext_id_elb" {
  value = "${module.modulo_elb.const_ext_id_elb}"
}
output "const_ext_dns_name_elb" {
  value = "${module.modulo_elb.const_ext_dns_name_elb}"
}
output "const_ext_zone_id_elb" {
  value = "${module.modulo_elb.const_ext_zone_id_elb}"
}

//----------- IMPRIMIENTO '[ROUTE-53]' -----------//
output "const_ext_id_zone_r53" {
  value = "${module.modulo_route53.const_ext_id_zone_r53}"
}

//----------- IMPRIMIENTO '[API-GATEWAY]' -----------//
output "const_ext_id_rest_ag" {
  value = "${module.modulo_api_gateway.const_ext_id_rest_ag}"
}

//----------- IMPRIMIENTO '[AUTOSCALING]' -----------//
output "const_ext_ids_lc_as" {
  value = "${module.modulo_autoscaling.const_ext_ids_lc_as}"
}
output "const_ext_ids_asg_as" {
  value = "${module.modulo_autoscaling.const_ext_ids_asg_as}"
}
output "const_ext_name_asg_as" {
  value = "${module.modulo_autoscaling.const_ext_name_asg_as}"
}
output "const_ext_arn_policy_up_as" {
  value = "${module.modulo_autoscaling.const_ext_arn_policy_up_as}"
}
output "const_ext_arn_policy_down_as" {
  value = "${module.modulo_autoscaling.const_ext_arn_policy_down_as}"
}

//----------- IMPRIMIENTO '[CLOUD-WATCH]' -----------//
output "const_ext_id_alarm_up_cw" {
  value = "${module.modulo_cloudwatch.const_ext_id_alarm_up_cw}"
}
output "const_ext_id_alarm_down_cw" {
  value = "${module.modulo_cloudwatch.const_ext_id_alarm_down_cw}"
}

