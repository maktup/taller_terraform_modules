
# INSTALACIÓN:
  Esta en 'TERRAFORM' puede ser de 2 formas:  
 
* FORMA#1:
  IMPORTANTE: el archivo 'NOMBRE.tf' debe ubicarse al costado del: 'terraform.exe' (PARA QUE FUNCIONE).

* FORMA#2:
  IMPORTANTE: se debe crear un DIRECTORIO llamado: '.aws', en la RUTA: 'cd %UserProfile%\.aws',
  donde deberá crearse un ARCHIVO llamado: 'credentials'. Además, dentro de dicho archivo se deberá tener
  la AUTENTICACIÓN del 'CLOUD PROVIDER' respectivamente: ('ACCESS_KEY' & 'SECRET_KEY') del USUARIO de conexión.  
  EJEMPLO:

  [default]
  aws_access_key_id=AKIAWFKLYP2UT6MTZJNG
  aws_secret_access_key=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

  VALIDAR:
  - Ejecutando el siguiente comando:  
  $ terraform -version

  Terraform v0.12.24
  provider.aws v2.54.0


# PLUGINS:  
  Los 'PLUGINs' instalados deben ser los siguientes:
  
  Terraform 0.1.8
  Terraform Advanced Syntax Highlighting 0.0.4
  Terraform Autocomplete 0.0.8
  VSCode Terraform AWS SSM 0.3.6
  YAML 0.7.2
  Swagger Viewer 2.2.2
  OpenAPI (Swagger) Editor 3.1.0
  shell-format 7.0.1
  

# EJECUCIÓN: 
  'TERRAFORM' manajerá una serie de comandos para su 'ADMINISTRACIÓN'. Estos son:

  $ terraform init     DESCARGAR LIBRERIAS REQUERIDAS POR EL 'CLOUD_PROVIDER'.
  $ terraform plan     MUESTRA UNA 'PREVIEW' DE LO QUE SE VA A PROCESAR ANTES DE MANDARLO A EJECUTAR.
  $ terraform apply    EJECUTA EL SCRIPT DE TERRAFORM & CREA EL 'RECURSO' EN EL 'CLOUD_PROVIDER'.
  $ terraform destroy  ELIMINA EL 'RECURSO' CREADO PREVIAMENTE EN EL 'CLOUD_PROVIDER'.
  $ -auto-approve      PERMITE AL CONCATENAR CON 'appy' / 'destroy', PARA QUE 'TERRAFORM' NÓ PIDA UNA CONFIRMACIÓN PARA LA EJECUCIÓN.

  EJEMPLO:
  $ terraform plan
  $ terraform apply -auto-approve 
  $ terraform destroy -auto-approve


# AWS 'REGION LIST': 
  Estos son: 

  REGION NAME                  REGION             ENDPOINT                                PROTOCOL
  US East (Ohio)               us-east-2          rds.us-east-2.amazonaws.com             HTTPS
  US East (N. Virginia)        us-east-1          rds.us-east-1.amazonaws.com             HTTPS
  US West (N. California)      us-west-1          rds.us-west-1.amazonaws.com             HTTPS
  US West (Oregon)             us-west-2          rds.us-west-2.amazonaws.com             HTTPS
  Asia Pacific (Hong Kong)     ap-east-1          rds.ap-east-1.amazonaws.com             HTTPS
  Asia Pacific (Mumbai)        ap-south-1         rds.ap-south-1.amazonaws.com            HTTPS
  Asia Pacific (Osaka-Local)   ap-northeast-3     rds.ap-northeast-3.amazonaws.com        HTTPS
  Asia Pacific (Seoul)         ap-northeast-2     rds.ap-northeast-2.amazonaws.com        HTTPS
  Asia Pacific (Singapore)     ap-southeast-1     rds.ap-southeast-1.amazonaws.com        HTTPS
  Asia Pacific (Sydney)        ap-southeast-2     rds.ap-southeast-2.amazonaws.com        HTTPS
  Asia Pacific (Tokyo)         ap-northeast-1     rds.ap-northeast-1.amazonaws.com        HTTPS
  Canada (Central)             ca-central-1       rds.ca-central-1.amazonaws.com          HTTPS
  China (Beijing)              cn-north-1         rds.cn-north-1.amazonaws.com.cn         HTTPS
  China (Ningxia)              cn-northwest-1     rds.cn-northwest-1.amazonaws.com.cn     HTTPS
  Europe (Frankfurt)           eu-central-1       rds.eu-central-1.amazonaws.com          HTTPS
  Europe (Ireland)             eu-west-1          rds.eu-west-1.amazonaws.com             HTTPS
  Europe (London)              eu-west-2          rds.eu-west-2.amazonaws.com             HTTPS
  Europe (Paris)               eu-west-3          rds.eu-west-3.amazonaws.com             HTTPS
  Europe (Stockholm)           eu-north-1         rds.eu-north-1.amazonaws.com            HTTPS
  Middle East (Bahrain)        me-south-1         rds.me-south-1.amazonaws.com            HTTPS
  South America (Sao Paulo)    sa-east-1          rds.sa-east-1.amazonaws.com             HTTPS
  AWS GovCloud (US-East)       us-gov-east-1      rds.us-gov-east-1.amazonaws.com         HTTPS
  AWS GovCloud (US-West)       us-gov-west-1      rds.us-gov-west-1.amazonaws.com         HTTPS


# CONECTARSE A 'INSTANCIA-EC2' CREADA (REMOTA):
  Los pasos son los siquientes: 

  * PASO#1: [GENERAR 'LLAVES PÚBLICAS']:
  
    - EJECUTAR: $ ssh-keygen -m pem -b 4060 -f taller_terraform_key.pem
    - NO ponerle PASSWORD (solo por ahora)
    - EDITAR EL '.pub': taller_terraform_key.pem.pub & quitarle la parte final referente al USUARIO & GUARDAR.
    - COPIAR todo su contenido.
  
  * PASO#2: [Conectarse a INSTANCIA]:
  
    Considerar que CADA 'S.O' tiene un 'DEFAULT_USER', para conectarse por 'SSH':
    EJEMPLO:
    - Amazon Linux => ec2-user
    - RHEL5 *      => root ó ec2-user
    - Ubuntu       => ubuntu
    - Fedora       => fedora ó ec2-user
    - SUSE Linux   => root ó ec2-user

  <FORMA_#A>:
  - Copiar la dirección del 'DNS PÚBLICO' de la 'INSTANCIA' creada.
    EJEMPLO: ec2-34-227-12-174.compute-1.amazonaws.com
  - Ubicar la ruta donde se ha generado la 'LLAVE' ('ARCHIVO .pub').
  - Ejecutar la sentencia siguiente: [ssh - 'ARCHIVO .pem' DEFAULT_USER@DNS_INSTANCIA]
    EJEMPLO: ssh -i taller_terraform_key.pem ec2-user@ec2-34-227-12-174.compute-1.amazonaws.com
  - Se podrá acceder remotamente a la 'INSTANCIA AWS'.
  - VALIDAR dentro ingresando: ping www.google.com
  - VALIDAR dentro ingresando: sudo yum update

 <FORMA_#B>:
  - Copiar la dirección del 'DNS PÚBLICO' de la 'INSTANCIA' creada.
    EJEMPLO: ec2-34-227-12-174.compute-1.amazonaws.com
  - Ubicar la ruta donde se ha generado la LLAVE ('ARCHIVO .pub').
  - Cargar el 'ARCHIVO .pub' al 'puttygen.exe' & genera un 'ARCHIVO .ppk'.
  - Ingresar en el 'putty.exe' el 'DNS PÚBLICO' de AWS & autenticarlo cargando el: 'ARCHIVO .ppk'.
  - Ingresar el 'DEFAULT_USER' pora autenticarte.
    EJEMPLO: ec2-user
  - Se podrá acceder remotamente a la 'INSTANCIA AWS'.
  - VALIDAR dentro ingresando: ping www.google.com
  - VALIDAR dentro ingresando: sudo yum update


# GENERACIÓN DE 'GRAFICA': 
  Los pasos son los siguientes:

  - Descargar 'graphviz' de aquí: <https://graphviz.gitlab.io/_pages/Download/Download_windows.html>
  - Instalar: 'graphviz-2.38.msi'
  - Referenciar en el PATH (VARIABLES DE ENTORNO): 'D:\TERRAFORM\graphviz-2.38\bin'
  - Generar GRÁFICO:

    $ terraform graph | dot -Tsvg > graph.svg
    $ terraform graph | dot -Tpng > graph.png
    $ terraform graph | dot -Tpdf > graph.pdf


# TERRAFORM REGISTRY:  
  SERVIDOR pÚblico para compartir 'TEMPLATES' de 'MÓDULOS' de 'TERRAFORM' (REUTILIZARLOS):

  - <https://registry.terraform.io>


# CREACIÓN 'DINAMICA' DE OBJETO:  
  'TERRAFORM' puede manejar varias formas de 'ITERACIÓN', pero a nivel recorrer una 'ESTRUCTURA', esta es
  la RECOMENDADA:
  
  EJEMPLO:
  
  //ESTRUCTURA EN VARIABLE: 
  variable "const_lista_datos" {
    type = "list"
    default = [
      {
        posicion = "0",
        dato     = "PC#1",
        ip       = "10.0.1.10"
      },
      {
        posicion = "1",
        dato     = "PC#2",
        ip       = "10.0.2.10"
      },
      {
        posicion = "2",
        dato     = "PC#3",
        ip       = "10.0.3.10"
      }
    ]
  }
  
  //RECURSO CREADO DINÁMICAMENTE:
  resource "aws_iam_user" "usr_dinamic" { 
    
    //FORMA#1: ITERAR LA ESTRUCTURA & OBTENER LOS DATOS: 'dato' DEL  OBJETO, VALIDANDO UNA 'CONDICIONAL': 'TRUE'.
    count = "${ length(var.const_lista_datos_instancia.* ) }"
    value = "${ var.const_lista_datos_instancia.*.dato[ index( var.const_lista_datos_instancia.*.posicion, "1" )] }"  
    
    //FORMA#2: ITERAR LA ESTRUCTURA & OBTENER LOS DATOS: 'posicion, dato' POR  OBJETO: 
    count = "${ length( var.const_lista_datos_instancia.* )}"
    name  = "${ var.const_lista_datos_instancia.*.posicion[ count.index] }_${ var.const_lista_datos_instancia.*.dato[ count.index ]}"
  }


# TIPS: 
- ALINEAMIENTO del código:
  SHIFT + ALF + F

- DOCUMENTIACIÓN [INSTALACIÓN]:
  <https://learn.hashicorp.com/terraform/getting-started/install.html>

- DOCUMENTACIÓN 'CLOUD-PROVIDERS':
  <https://www.terraform.io/docs/providers/index.html>

