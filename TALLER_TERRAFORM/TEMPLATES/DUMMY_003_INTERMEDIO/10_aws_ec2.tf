
#-------------------------------------------------------------#
#--------------- CONFIGURACION: 'INSTANCE' (EC2) -------------#
#-------------------------------------------------------------#
## IMPORTANTE #1: La CREACION de las 'INSTANCIAS' (EC2)' están siendo 'DINÁMICAS'.
## IMPORTANTE #2: El # de AMI ingresado es el de 'REDHAT'. Este nombre NO CAMBIA si se permanece en la mismas REGION. 
## Pero si se CAMBIA de REGIÓN si !. En este caso se maneja el de VIRGINIA. 

## IMPORTANTE #3: El 'COUNT' creará el # de 'INSTANCIAS' requeridas, en base a dicha IMAGEN (AMI). 
## Una vez CREADA la INSTANCIA, se debe ir a su 'DNS PUBLICO' & validar que responda haciendo:
## EJEMPLO: 'pin ec2-54-167-83-82.compute-1.amazonaws.com'.  

## IMPORTANTE #4: Asignar bien la REFERENCIA a la 'SUBNET'. 
## IMPORTANTE #5: Asignar bien la REFERENCIA a los 'SECURITY-GROUPs'.
## IMPORTANTE #6: Asignar bien la REFERENCIA a la 'VPC'. 
## IMPORTANTE #7: Asignar bien la IP.
## IMPORTANTE #8: Asignar bien la REFERENCIA al 'KEY-NAME' => 'kp_dummy_001' (id). 

## IMPORTANTE #9: Asignar bien la REFERENCIA en el 'user_data' para ejecutar el SCRIPT (en 'ARCHIVO' o en 'CODIGO'), 
## para la instalación de 'SOFTWARE' dentro de la 'INSTANCIA (EC2)' respectiva, osea en la 'MAQUINA VIRTUAL'.


###### CREANDO RECURSOS: 'INSTANCIAs (EC2)' ######:
resource "aws_instance" "ec2_generic" {
  count                       = "${length(var.const_lista_datos_instancia.*)}"                                                                 //IMPORTANTE: Obtiene el TAMAÑO de la 'LISTA' (ESTRUCTURA) para iterar.
  ami                         = "${var.const_tipo_imagen_redhat}"                                                                              //'IMAGEN' de REDHAT.
  instance_type               = "${var.const_tipo_instancia}"                                                                                  //Tipo de 'IMAGEN' pequeña.
  private_ip                  = "${var.const_lista_datos_instancia.*.ip[count.index]}"                                                         //Obtiene las IPs 'DINÁMICAMENTE' de la LISTA.
  subnet_id                   = "${aws_subnet.sn_generic[var.const_lista_datos_instancia.*.posicion[count.index]].id}"                         //Obtener el ID de la 'SUBNET' (posiciones 'DINÁMICAMENTE' de la LISTA).   
  vpc_security_group_ids      = ["${aws_security_group.sg_generic.id}"]                                                                        //Obtener los IDs de 'SECURITY-GROUPs'.
  key_name                    = "${element("${[aws_key_pair.kp_001.id, aws_key_pair.kp_002.key_name, aws_key_pair.kp_003.id]}", count.index)}" //Obtener los IDs de 'KEY-PAIRs'.
  user_data                   = "${file("${var.const_directorio_script_sh}")}"                                                                 //Referencia al archivo: '.sh'.
  associate_public_ip_address = true

  tags = {
    Name  = "INST. (EC2) #00${(count.index + 1)}" //Se agrega +1, para que el 'CONTADOR'arranque 1 & NO de 0.
    Owner = "Terraform"
    Env   = "Desarrollo"
  }
}

