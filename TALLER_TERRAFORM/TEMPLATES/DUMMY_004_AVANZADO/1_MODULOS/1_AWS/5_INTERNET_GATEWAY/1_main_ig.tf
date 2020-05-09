
#-------------------------------------------------#
#------- CONFIGURACION: 'INTERNET-GATEWAY' -------#
#-------------------------------------------------# 
## IMPORTANTE #1: Como TODO está 'MODULARIZADO', es importante preguntarnos: 
## 1. ¿QUE DESEAMOS 'PERSONALIZAR' ... DE LO QUE YA ESTÁ?.
## 2. ¿QUE DESEAMOS 'REUTILIZAR' ... DE LO QUE YA ESTÁ?.

## IMPORTANTE #2: Lo que se desea 'PERSONALIZAR', se tendrá que 'SOBREESCRIBIR'. 
## IMPORTANTE #3: Lo definidos como 'DINAMICOS' son 'REFERENCIAS EXTERNAS' a otros 'MÓDULOS'.
## Estos deberán der 'DECLARADOS' como CONSTANTE para ser luego 'SOBREESCRITOS' en: 'main_*_desa'.   

## IMPORTANTE #4: SI existen valores 'DUPLICADOS' entre los 'MÓDULOS', estos se tendrán
## que considerar & registrar 'INDEPENDIENTEMENTE' por 'MÓDULO'.


###### CREANDO RECURSOS: 'INTERNET-GATEWAY ######:  
 resource "aws_internet_gateway" "igw_001" {
  vpc_id = "${var.const_ext_vpc_id}" //Este valor es 'DINÁMICO'. 

  tags = {
    Name = "INTERNET-GATEWAY #001"
  }  
}

