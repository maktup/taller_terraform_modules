
#-------------------------------------------------------------#
#---------------- CONFIGURACION: 'API-GATEWAY'----------------#
#-------------------------------------------------------------#
## IMPORTANTE #1: Se procederá a crear el 'API-GATEWAY' en base a un API: 'openapi'.
## IMPORTANTE #2: Este 'API-GATEWAY' será una exposición del MICROSERVICIO ya espuesto por el 'ROUTE53'.
## IMPORTANTE #3: Cada vez que se ejecute eñ SCRIPT, este desplegará el API & generará un nuevo 'DNS' en AWS
## IMPORTANTE #4: Para EXPONER una API en 'API-GATEWAY' de AWS, se debe manejar un ORDEN:

## - *_rest_api: Importa en API: 'openapi' & creada el 'API-GATEWAY'. 
## - *_resource: Define el 'RESOURCE' expuesto en el API.
## - *_integration: Define como se comunicará el API con el 'MICROSERVICIO' por detrás-
## - *_deployment: Realiza la EXPOSICIÓN del 'MICROSERVICIO' & generación de la URL.
## - *_integration_response: Define como el 'API-GATEWAY' responderá en base a la respuesta del 'MICROSERVICIO'. 


###### CREANDO RECURSOS: 'API-GATEWAY' ######: 
resource "aws_api_gateway_rest_api" "agra_001" {
  name        = "agra_001"
  description = "API QUE PERMITE EXPONER LA FUNCIONALIDAD DEL 'MICROSERVICIO' EN BASE A SU 'API'."
  body        = "${file("${var.const_directorio_script_openapi}")}" //Cargando el API: 'openapi'. 

  endpoint_configuration {
    types = ["${var.const_config_endpoint_ag}"]
  }
}
 
data "aws_api_gateway_resource" "agr_001" {
  rest_api_id = "${aws_api_gateway_rest_api.agra_001.id}"
  path        = "${var.const_path_recurso_ag}" //URI de la 'FUNCIONALIDAD' del 'MICROSERVICIO'.
}

resource "aws_api_gateway_integration" "agi_001" {
  rest_api_id = "${aws_api_gateway_rest_api.agra_001.id}"
  resource_id = "${data.aws_api_gateway_resource.agr_001.id}"
  http_method = "${var.const_http_method_integration_ag}"

  //Comunicación con el 'MICROSERVICIO': 
  type                    = "${var.const_type_integration_ag}"
  integration_http_method = "${var.const_http_method_integration_ag}"
  uri                     = "${var.const_url_backend_integration_ag}" //URL del 'MICROSERVICIO'.

  //Parametros 'REQUEST':
  request_parameters = {
    "integration.request.path.nombre" = "method.request.path.nombre", //1er PARÁMETRO del 'MICROSERVICIO'.
    "integration.request.path.server" = "method.request.path.server"  //2do PARÁMETRO del 'MICROSERVICIO'.
  }
}

resource "aws_api_gateway_deployment" "agd_001" {
  depends_on        = ["aws_api_gateway_integration.agi_001"] //Dependencia existente a nivel de 'RECURSOS'. 
  stage_name        = "${var.const_stage_deployment_ag}"      //Nombre de la 'ETAPA' donde se crearán los 'DESPLIEGUES'.
  rest_api_id       = "${aws_api_gateway_rest_api.agra_001.id}"
  stage_description = "'API' DEL 'MICROSERVICIO' DESPLEGADO: [${timestamp()}]"
}


resource "aws_api_gateway_integration_response" "agir_001" {
  depends_on  = ["aws_api_gateway_integration.agi_001"] //Dependencia existente a nivel de 'RECURSOS'. 
  rest_api_id = "${aws_api_gateway_rest_api.agra_001.id}"
  resource_id = "${data.aws_api_gateway_resource.agr_001.id}"
  http_method = "${var.const_http_method_integration_response_ag}"
  status_code = "${var.const_status_code_integration_response_ag}" //Codigo de respuiesta OK. 
}

