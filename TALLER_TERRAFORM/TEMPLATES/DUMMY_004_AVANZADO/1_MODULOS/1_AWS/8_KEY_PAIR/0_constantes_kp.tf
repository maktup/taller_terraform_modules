
#--------------------------------------------------#
#------------ CONFIGURACIÓN: 'VARIABLES' ----------#
#--------------------------------------------------# 
## IMPORTANTE #1: Los valores que se queden aquí en 'default', serán justamente los valores
## por 'DEFECTO' que se manejarán. Ya que los demás serán 'SOBREESCRITOS' externamente.

## IMPORTANTE #2: No es necsario 'DOCUMENTAR', ya que esta se manejará en el 'constantes_*' (EXTERNO). 

## IMPORTANTE #3: Los valores ingresados podrán ser:
## - ESTÁTICOS: SI se especificarán: 'default' como valor base.
## - DINÁMICOS: NO se especificarán valor alguno como base (REFERENCIAN IDs).
##   Estos para identificarlos tendrán como identificador: 'const_ext_*'. 


###################### [ESTÁTICOS] ######################
variable "const_contenido_public_keyPair" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAB/AqBFCgRpE+gpFz3NibVuQOQa8T1lYIiJrNlzwALFAlwV6UXkjjiEPcIJDqeJHv0CUlnRdP6HXHljqnm05t+ZeVDWM5PA7bHrCv4Y9ZfEITB9v6E9/ln3XX0QrSY3Z4c9liiHx9rnIPZHVMoCrYdjsj8lPHCIi9Qb8c7J/FqiVsjm1BZJz6/50SqsU/kYiQEX9txVnYycQWlleF32TrGJI/p9/m9C9yYaxNU7w6Tmu/ORBQcEVLjvMhiMkAQo6Fd6px3lC9NWibYG1ChpW0pHeyGalKRqi9SvybaSMXG4i/v0x9tpX8lVTIjSLlKT4gISIeYeDuj8cjaFKNyo8o/axLigFb3WCz9yJTjpoY4bTZjUz3+vAm35lqyps19iBB4gffQdq6r3nlo5p2Yoyxbe73RODTzOe6JDmhjSr5ahdIVKluTArTKRTPFUBnuK5rdfhIYelyOCusBKTDTT4UsJDHJL4XhX/rlzREuubijj49lj9KxQkzvE0dK7I9ecaIWtRxgVHdGLn6WiZN7Qbif17AzRuEmXcsKloVYJIluw049t2NYU8Ozo2OwWMsKaoPlXkJi70bR/gqWwfj75XqnIWOYOPipbIfmePcsb3hdgY/aXYwFYAxOXPQXk9q4vYJlDf+TnY4VCdjk7r8d895SZhPzkyycXX9p2dHUalc="
}
variable "const_archivo_public_keyPair" {
  default = "taller_terraform_key.pem.pub"
}

###################### [DINÁMICOS] ######################

