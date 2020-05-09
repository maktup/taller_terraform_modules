
#--------------------------------------------------#
#--------------- CONFIGURACION: 'IAM' -------------#
#--------------------------------------------------# 
## IMPORTANTE #1: Como TODO está 'MODULARIZADO', es importante preguntarnos: 
## 1. ¿QUE DESEAMOS 'PERSONALIZAR' ... DE LO QUE YA ESTÁ?.
## 2. ¿QUE DESEAMOS 'REUTILIZAR' ... DE LO QUE YA ESTÁ?.

## IMPORTANTE #2: Lo que se desea 'PERSONALIZAR', se tendrá que 'SOBREESCRIBIR'. 
## IMPORTANTE #3: Lo definidos como 'DINAMICOS' son 'REFERENCIAS EXTERNAS' a otros 'MÓDULOS'.
## Estos deberán der 'DECLARADOS' como CONSTANTE para ser luego 'SOBREESCRITOS' en: 'main_*_desa'.   

## IMPORTANTE #4: SI existen valores 'DUPLICADOS' entre los 'MÓDULOS', estos se tendrán
## que considerar & registrar 'INDEPENDIENTEMENTE' por 'MÓDULO'.


###### CREANDO RECURSOS: 'GRUPOS' ######:  
resource "aws_iam_group" "grp_administrators" {
  name = "${var.const_grupo_administradores}"     //Este valor debe ser 'SOBREESCRITO'. 
  path = "${var.const_filsystem_administradores}" //Este valor debe ser 'SOBREESCRITO'. 
}

resource "aws_iam_group" "grp_developers" {
  name = "${var.const_grupo_programadores}"       //Este valor debe ser 'SOBREESCRITO'. 
  path = "${var.const_filsystem_desarrolladores}" //Este valor debe ser 'SOBREESCRITO'. 
}

resource "aws_iam_group" "grp_architects" {
  name = "${var.const_grupo_arquitectos}"     //Este valor debe ser 'SOBREESCRITO'. 
  path = "${var.const_filsystem_arquitectos}" //Este valor debe ser 'SOBREESCRITO'. 
}

resource "aws_iam_group" "grp_others" {
  name = "${var.const_grupo_otros}"     //Este valor debe ser 'SOBREESCRITO'. 
  path = "${var.const_filsystem_otros}" //Este valor debe ser 'SOBREESCRITO'. 
}


###### CREANDO RECURSOS: 'USUARIOS' ######:
resource "aws_iam_user" "usr_cguerra" {
  name          = "${var.const_usuario_001}" //Este valor debe ser 'SOBREESCRITO'. 
  force_destroy = true
}

resource "aws_iam_user" "usr_mgrasso" {
  name          = "${var.const_usuario_002}" //Este valor debe ser 'SOBREESCRITO'. 
  force_destroy = true
}

resource "aws_iam_user" "usr_pcriado" {
  name          = "${var.const_usuario_003}" //Este valor debe ser 'SOBREESCRITO'. 
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
  user = "${aws_iam_user.usr_cguerra.name}" //Este valor debe ser 'IMPRESO'. 
}

resource "aws_iam_access_key" "ak_pcriado" {
  user = "${aws_iam_user.usr_pcriado.name}" //Este valor debe ser 'IMPRESO'. 
}

resource "aws_iam_access_key" "ak_mgrasso" {
  user = "${aws_iam_user.usr_mgrasso.name}" //Este valor debe ser 'IMPRESO'. 
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

