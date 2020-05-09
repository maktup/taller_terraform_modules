
#--------------------------------------------------#
#--------------- CONFIGURACION: 'IAM' -------------#
#--------------------------------------------------# 
## IMPORTANTE #1: Se debe tener un USUARIO creado en AWS manualmente al cual se le asigne las 'POLÍTICAS':
##  - arn:aws:iam::aws:policy/AdministratorAccess (*)
##  - arn:aws:iam::aws:policy/AmazonEC2FullAccess
##  - arn:aws:iam::aws:policy/IAMFullAccess
##  - arn:aws:iam::aws:policy/IAMUserChangePassword
##  - arn:aws:iam::aws:policy/AmazonRoute53FullAccess

## IMPORTANTE #2: Ejecutar 1 sola vez la ASIGNACION de politicas ('aws_iam_policy_attachment'), ya que si  
## deja ACTIVA (el de: 'poly_AdministratorAccess') & se ejecuta el: 'terraform destroy', se ELIMINARÁ la   
## politica de: 'AdministratorAccess' propia del USUARIO creado MANUALMENTE & que se usa para la conexion    
## para el: 'provider' AWS. Debido a ello, NO se podrá ejecutar luego el: 'terraform apply'.

## IMPORTANTE #3: El GRUPO: 'grp_others', solo podrá mirar a nivel de 'POLITICA'. 
## IMPORTANTE #4: El ROL creado es para el acceso a 'S3' desde otros recursos de AWS. 


###### CREANDO RECURSOS: 'GRUPOS' ######:  
resource "aws_iam_group" "grp_administrators" {
  name = "${var.const_grupo_administradores}"
  path = "${var.const_filsystem_administradores}"
}

resource "aws_iam_group" "grp_developers" {
  name = "${var.const_grupo_programadores}"
  path = "${var.const_filsystem_desarrolladores}"
}

resource "aws_iam_group" "grp_architects" {
  name = "${var.const_grupo_arquitectos}"
  path = "${var.const_filsystem_arquitectos}"
}

resource "aws_iam_group" "grp_others" {
  name = "${var.const_grupo_otros}"
  path = "${var.const_filsystem_otros}"
}


###### CREANDO RECURSOS: 'USUARIOS' ######:
resource "aws_iam_user" "usr_cguerra" {
  name          = "${var.const_usuario_001}"
  force_destroy = true
}

resource "aws_iam_user" "usr_mgrasso" {
  name          = "${var.const_usuario_002}"
  force_destroy = true
}

resource "aws_iam_user" "usr_pcriado" {
  name          = "${var.const_usuario_003}"
  force_destroy = true
}


###### ASIGNANDO RECURSOS: 'USUARIOS => GRUPOS' ######:
resource "aws_iam_group_membership" "assign_usr_to_grp_001" {
  name  = "assign_user_to_group_001"
  users = ["${aws_iam_user.usr_mgrasso.name}"]
  group = "${aws_iam_group.grp_developers.name}"
}

resource "aws_iam_group_membership" "assign_usr_to_grp_002" {
  name  = "assign_user_to_group_002"
  users = ["${aws_iam_user.usr_cguerra.name}"]
  group = "${aws_iam_group.grp_architects.name}"
}

resource "aws_iam_group_membership" "assign_usr_to_grp_003" {
  name  = "assign_user_to_group_003"
  users = ["${aws_iam_user.usr_pcriado.name}"]
  group = "${aws_iam_group.grp_others.name}"
}

resource "aws_iam_group_membership" "assign_usr_to_grp_004" {
  name  = "assign_user_to_group_004"
  users = ["${aws_iam_user.usr_cguerra.name}"]
  group = "${aws_iam_group.grp_administrators.name}"
}


###### ASIGNANDO RECURSOS: 'ACCESSS-KEY' ######:
###### IMPORTANTE: Son las 'LLAVES' de 'USUARIOS' generadas & requeridas para la 'CONEXION REMOTA' con AWS. 
resource "aws_iam_access_key" "ak_rguerra" {
  user = "${aws_iam_user.usr_cguerra.name}"
}

resource "aws_iam_access_key" "ak_pcriado" {
  user = "${aws_iam_user.usr_pcriado.name}"
}

resource "aws_iam_access_key" "ak_mgrasso" {
  user = "${aws_iam_user.usr_mgrasso.name}"
}


# ###### CREANDO RECURSO: 'POLITICAS' ######: 
# resource "aws_iam_policy_attachment" "poly_AdministratorAccess" {
#   name = "poly_AdministratorAccess"
#   groups = ["${aws_iam_group.grp_administrators.name}", 
#             "${aws_iam_group.grp_architects.name}"]
#   policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
# }

resource "aws_iam_policy_attachment" "poly_AmazonEC2FullAccess" {
  name       = "poly_AmazonEC2FullAccess"
  groups     = ["${aws_iam_group.grp_administrators.name}", "${aws_iam_group.grp_architects.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_policy_attachment" "poly_IAMFullAccess" {
  name       = "poly_IAMFullAccess"
  groups     = ["${aws_iam_group.grp_administrators.name}", "${aws_iam_group.grp_architects.name}", "${aws_iam_group.grp_developers.name}"]
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

resource "aws_iam_policy_attachment" "poly_IAMUserChangePassword" {
  name       = "poly_IAMUserChangePassword"
  groups     = ["${aws_iam_group.grp_administrators.name}", "${aws_iam_group.grp_architects.name}", "${aws_iam_group.grp_developers.name}"]
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_policy_attachment" "poly_AmazonRoute53FullAccess" {
  name       = "poly_AmazonRoute53FullAccess"
  groups     = ["${aws_iam_group.grp_administrators.name}", "${aws_iam_group.grp_architects.name}", "${aws_iam_group.grp_developers.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
}

