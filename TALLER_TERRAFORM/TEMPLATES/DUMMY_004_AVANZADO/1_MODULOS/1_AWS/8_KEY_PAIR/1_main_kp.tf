
#-------------------------------------------------#
#-------- CONFIGURACION: 'KEY-PAIR' --------#
#-------------------------------------------------# 
## IMPORTANTE #1: Como TODO está 'MODULARIZADO', es importante preguntarnos: 
## 1. ¿QUE DESEAMOS 'PERSONALIZAR' ... DE LO QUE YA ESTÁ?.
## 2. ¿QUE DESEAMOS 'REUTILIZAR' ... DE LO QUE YA ESTÁ?.

## IMPORTANTE #2: Lo que se desea 'PERSONALIZAR', se tendrá que 'SOBREESCRIBIR'. 
## IMPORTANTE #3: Lo definidos como 'DINAMICOS' son 'REFERENCIAS EXTERNAS' a otros 'MÓDULOS'.
## Estos deberán der 'DECLARADOS' como CONSTANTE para ser luego 'SOBREESCRITOS' en: 'main_*_desa'.   

## IMPORTANTE #4: SI existen valores 'DUPLICADOS' entre los 'MÓDULOS', estos se tendrán
## que considerar & registrar 'INDEPENDIENTEMENTE' por 'MÓDULO'.


###### CREANDO RECURSOS: 'KEY-PAIR' ######:  
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

 