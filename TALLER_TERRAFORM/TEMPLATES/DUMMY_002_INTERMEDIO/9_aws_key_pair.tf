
#-------------------------------------------------------#
#--------------- CONFIGURACION: 'KEY-PAIR' -------------#
#-------------------------------------------------------#
## IMPORTANTE #1: Est 'KEY-PAIR' es necesario para poder acceder 'REMOTAMENTE' por SSH a AWS- 
## IMPORTANTE #2: Considerar los 2 tipos de formas que se tiene: (HARDCODE & por FUNCTION). 
## IMPORTANTE #3: El valor del 'public_key' se obtiene del archivo: 'taller_terraform_key.pem.pub' 
## en base a USUARIO de CONEXION creado manualmente. 
 

###### CREANDO RECURSO: 'KEY-PAIR' [FORMA#1: 'HARDCODE'] ###
resource "aws_key_pair" "kp_001" {
  key_name   = "kp_001"
  public_key = "${var.const_contenido_public_keyPair}"
}

###### CREANDO RECURSO: 'KEY-PAIR' [FORMA#2: 'FUNCTION'] ###
resource "aws_key_pair" "kp_002" {
  key_name   = "kp_002"
  public_key = "${file("${var.const_archivo_public_keyPair}")}"  //Referencia al archivo: '.pub'.
}

###### CREANDO RECURSO: 'KEY-PAIR' [FORMA#2: 'FUNCTION'] ###
resource "aws_key_pair" "kp_003" {
  key_name   = "kp_003"
  public_key = "${file("${var.const_archivo_public_keyPair}")}"  //Referencia al archivo: '.pub'.
}

