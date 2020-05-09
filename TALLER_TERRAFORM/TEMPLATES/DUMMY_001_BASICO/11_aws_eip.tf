
#-------------------------------------------------------------#
#---------------- CONFIGURACION: 'ELASTIC-IP' ----------------#
#-------------------------------------------------------------#
## IMPORTANTE #1: Las 'EIP' se usan pára que las IPs sean 'PERMANENTES' (NO CAMBIEN), en las 'INSTANCIAS (EC2)'.
## Estas se VALIDAN ya que una vez aplicadas, las IPs se ponen en un tono AZUL.

## IMPORTANTE #2: Estas 'IPs-PUBLICAS' (FIJAS) generadas, se van a mantener & NO van a cambiar hasta 
## que las INSTANCIAS no se destruyan. 

 
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
  instance_id   = "${aws_instance.ec2_001.id}" //Referencia a 'EC2'.
  allocation_id = "${aws_eip.eip_001.id}"      //Referencia a 'EIP'.
}

resource "aws_eip_association" "assign_eip_to_ec2_002" {
  instance_id   = "${aws_instance.ec2_002.id}" //Referencia a 'EC2'.
  allocation_id = "${aws_eip.eip_002.id}"      //Referencia a 'EIP'.
}

resource "aws_eip_association" "assign_eip_to_ec2_003" {
  instance_id   = "${aws_instance.ec2_003.id}" //Referencia a 'EC2'.
  allocation_id = "${aws_eip.eip_003.id}"      //Referencia a 'EIP'.
}

