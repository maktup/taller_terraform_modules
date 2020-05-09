
#-------------------------------------------------#
#-------------- CONFIGURACION: 'EIP' -------------#
#-------------------------------------------------# 
## IMPORTANTE #1: Como TODO está 'MODULARIZADO', es importante preguntarnos: 
## 1. ¿QUE DESEAMOS 'PERSONALIZAR' ... DE LO QUE YA ESTÁ?.
## 2. ¿QUE DESEAMOS 'REUTILIZAR' ... DE LO QUE YA ESTÁ?.

## IMPORTANTE #2: Lo que se desea 'PERSONALIZAR', se tendrá que 'SOBREESCRIBIR'. 
## IMPORTANTE #3: Lo definidos como 'DINAMICOS' son 'REFERENCIAS EXTERNAS' a otros 'MÓDULOS'.
## Estos deberán der 'DECLARADOS' como CONSTANTE para ser luego 'SOBREESCRITOS' en: 'main_*_desa'.   

## IMPORTANTE #4: SI existen valores 'DUPLICADOS' entre los 'MÓDULOS', estos se tendrán
## que considerar & registrar 'INDEPENDIENTEMENTE' por 'MÓDULO'.


###### CREANDO RECURSOS: 'ELASTIC-IP' ######:
resource "aws_eip" "eip_001" {
  vpc = true

  tags = {
    Name = "EIP #001"
  }
}

resource "aws_eip" "eip_002" {
  vpc = true

  tags = {
    Name = "EIP #002"
  }
}

resource "aws_eip" "eip_003" {
  vpc = true

  tags = {
    Name = "EIP #003"
  }
}

resource "aws_eip_association" "assign_eip_to_ec2_001" {
  instance_id   = "${var.const_ext_lista_ec2_id[0]}" ///Este valor es 'DINÁMICO'
  allocation_id = "${aws_eip.eip_001.id}"              
}

resource "aws_eip_association" "assign_eip_to_ec2_002" {
  instance_id   = "${var.const_ext_lista_ec2_id[1]}" ///Este valor es 'DINÁMICO'
  allocation_id = "${aws_eip.eip_002.id}"              
}

resource "aws_eip_association" "assign_eip_to_ec2_003" {
  instance_id   = "${var.const_ext_lista_ec2_id[2]}" ///Este valor es 'DINÁMICO'
  allocation_id = "${aws_eip.eip_003.id}"         
}

 