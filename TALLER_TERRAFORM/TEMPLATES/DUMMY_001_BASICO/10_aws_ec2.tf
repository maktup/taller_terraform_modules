
#-------------------------------------------------------------#
#--------------- CONFIGURACION: 'INSTANCE' (EC2) -------------#
#-------------------------------------------------------------#
## IMPORTANTE #1: Ese # de AMI ingresado es el de 'REDHAT'. Este nombre NO CAMBIA si se permanece en la mismas REGION. 
## Pero si se CAMBIA de REGION si !. En este caso se maneja el de VIRGINIA. 

## IMPORTANTE #2: El 'COUNT' creará el # de 'INSTANCIAS' requeridas, en base a dicha IMAGEN (AMI). 
## Una vez CREADA la INSTANCIA, se debe ir a su 'DNS PUBLICO' & validar que responda haciendo:
## EJEMPLO: 'pin ec2-54-167-83-82.compute-1.amazonaws.com'.  

## IMPORTANTE #3: Asignar bien la REFERENCIA a la 'SUBNET'. 
## IMPORTANTE #4: Asignar bien la REFERENCIA a los 'SECURITY-GROUPs'.
## IMPORTANTE #5: Asignar bien la REFERENCIA a la 'VPC'. 
## IMPORTANTE #6: Asignar bien la IP.
## IMPORTANTE #7: Asignar bien la REFERENCIA al 'KEY-NAME' => 'kp_dummy_001' (id). 

## IMPORTANTE #8: Asignar bien la REFERENCIA en el 'user_data' para ejecutar el SCRIPT (en 'ARCHIVO' o en 'CODIGO'), 
## para la instalación de 'SOFTWARE' dentro de la 'INSTANCIA (EC2)' respectiva, osea en la 'MAQUINA VIRTUAL'.


###### CREANDO RECURSOS: 'INSTANCIAs (EC2)' ######:
resource "aws_instance" "ec2_001" {
  ami                         = "ami-0c322300a1dd5dc79" //'IMAGEN' de REDHAT.
  instance_type               = "t2.micro"              //Tipo de 'IMAGEN' pequeña.
  private_ip                  = "10.0.1.10"
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.sn_001.id}"                          //Obtener el ID de la 'SUBNET'. 
  vpc_security_group_ids      = ["${aws_security_group.sg_001.id}"]                //Obtener los IDs de 'SECURITY-GROUPs'. 
  key_name                    = "${aws_key_pair.kp_001.id}"                        //Obtener el ID del 'KEY-PAIR'. 
  user_data                   = "${file("SCRIPTS/Install_MicroService_nodo1.sh")}" //Referencia al archivo: '.sh'.

  tags = {
    Name  = "INST. (EC2) #001"
    Owner = "Terraform"
    Env   = "Desarrollo"
  }
}

resource "aws_instance" "ec2_002" {
  ami                         = "ami-0c322300a1dd5dc79" //'IMAGEN' de REDHAT.
  instance_type               = "t2.micro"              //Tipo de 'IMAGEN' pequeña.
  private_ip                  = "10.0.2.10"
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.sn_002.id}"                          //Obtener el ID de la 'SUBNET'. 
  vpc_security_group_ids      = ["${aws_security_group.sg_001.id}"]                //Obtener los IDs de 'SECURITY-GROUPs'.
  key_name                    = "${aws_key_pair.kp_002.id}"                        //Obtener el ID del 'KEY-PAIR'. 
  user_data                   = "${file("SCRIPTS/Install_MicroService_nodo1.sh")}" //Referencia al archivo: '.sh'.

  tags = {
    Name  = "INST. (EC2) #002"
    Owner = "Terraform"
    Env   = "Desarrollo"
  }
}

resource "aws_instance" "ec2_003" {
  ami                         = "ami-0c322300a1dd5dc79" //'IMAGEN' de REDHAT.
  instance_type               = "t2.micro"              //Tipo de 'IMAGEN' pequeña.
  private_ip                  = "10.0.3.10"
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.sn_003.id}"                          //Obtener el ID de la 'SUBNET'. 
  vpc_security_group_ids      = ["${aws_security_group.sg_001.id}"]                //Obtener los IDs de 'SECURITY-GROUPs'.
  key_name                    = "${aws_key_pair.kp_003.id}"                        //Obtener el ID del 'KEY-PAIR'. 
  user_data                   = "${file("SCRIPTS/Install_MicroService_nodo1.sh")}" //Referencia al archivo: '.sh'.

  tags = {
    Name  = "INST. (EC2) #003"
    Owner = "Terraform"
    Env   = "Desarrollo"
  }
}

