
#-------------------------------------------------#
#-------------- CONFIGURACION: 'EC2' -------------#
#-------------------------------------------------# 
## IMPORTANTE #1: Como TODO está 'MODULARIZADO', es importante preguntarnos: 
## 1. ¿QUE DESEAMOS 'PERSONALIZAR' ... DE LO QUE YA ESTÁ?.
## 2. ¿QUE DESEAMOS 'REUTILIZAR' ... DE LO QUE YA ESTÁ?.

## IMPORTANTE #2: Lo que se desea 'PERSONALIZAR', se tendrá que 'SOBREESCRIBIR'. 
## IMPORTANTE #3: Lo definidos como 'DINAMICOS' son 'REFERENCIAS EXTERNAS' a otros 'MÓDULOS'.
## Estos deberán der 'DECLARADOS' como CONSTANTE para ser luego 'SOBREESCRITOS' en: 'main_*_desa'.   

## IMPORTANTE #4: SI existen valores 'DUPLICADOS' entre los 'MÓDULOS', estos se tendrán
## que considerar & registrar 'INDEPENDIENTEMENTE' por 'MÓDULO'.


###### CREANDO RECURSOS: 'EC2' ######:  
resource "aws_instance" "ec2_generic" {
 
  count                       = "${length(var.const_lista_datos_instancia)}"
  ami                         = "${var.const_tipo_imagen_redhat}"
  instance_type               = "${var.const_tipo_instancia}"
  private_ip                  = "${var.const_lista_datos_instancia.*.ip[count.index]}" 
  subnet_id                   = "${element(var.const_ext_lista_ids_subnets, count.index)}" //Este valor es 'DINÁMICO'
  vpc_security_group_ids      = ["${var.const_ext_id_sg}"]                                 //Este valor es 'DINÁMICO'                                          
  key_name                    = "${element(var.const_ext_lista_ids_kp, count.index)}"      //Este valor es 'DINÁMICO'
  user_data                   = "${file("${var.const_directorio_script_sh}")}"
  associate_public_ip_address = true

  tags = {
    Name  = "INST. (EC2) #00${(count.index + 1)}" 
    Owner = "Terraform"
    Env   = "Desarrollo"
  }
}

