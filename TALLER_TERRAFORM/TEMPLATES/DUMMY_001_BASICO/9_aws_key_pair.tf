
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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAB/AqBFCgRpE+gpFz3NibVuQOQa8T1lYIiJrNlzwALFAlwV6UXkjjiEPcIJDqeJHv0CUlnRdP6HXHljqnm05t+ZeVDWM5PA7bHrCv4Y9ZfEITB9v6E9/ln3XX0QrSY3Z4c9liiHx9rnIPZHVMoCrYdjsj8lPHCIi9Qb8c7J/FqiVsjm1BZJz6/50SqsU/kYiQEX9txVnYycQWlleF32TrGJI/p9/m9C9yYaxNU7w6Tmu/ORBQcEVLjvMhiMkAQo6Fd6px3lC9NWibYG1ChpW0pHeyGalKRqi9SvybaSMXG4i/v0x9tpX8lVTIjSLlKT4gISIeYeDuj8cjaFKNyo8o/axLigFb3WCz9yJTjpoY4bTZjUz3+vAm35lqyps19iBB4gffQdq6r3nlo5p2Yoyxbe73RODTzOe6JDmhjSr5ahdIVKluTArTKRTPFUBnuK5rdfhIYelyOCusBKTDTT4UsJDHJL4XhX/rlzREuubijj49lj9KxQkzvE0dK7I9ecaIWtRxgVHdGLn6WiZN7Qbif17AzRuEmXcsKloVYJIluw049t2NYU8Ozo2OwWMsKaoPlXkJi70bR/gqWwfj75XqnIWOYOPipbIfmePcsb3hdgY/aXYwFYAxOXPQXk9q4vYJlDf+TnY4VCdjk7r8d895SZhPzkyycXX9p2dHUalc="
}

###### CREANDO RECURSO: 'KEY-PAIR' [FORMA#2: 'FUNCTION'] ###
resource "aws_key_pair" "kp_002" {
  key_name   = "kp_002"
  public_key = "${file("taller_terraform_key.pem.pub")}"  //Referencia al archivo: '.pub'.
}

###### CREANDO RECURSO: 'KEY-PAIR' [FORMA#2: 'FUNCTION'] ###
resource "aws_key_pair" "kp_003" {
  key_name   = "kp_003"
  public_key = "${file("taller_terraform_key.pem.pub")}"  //Referencia al archivo: '.pub'.
}

