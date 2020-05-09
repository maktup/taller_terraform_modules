
#-------------------------------------------------#
#---------- CONFIGURACION: 'API-GATEWAY' ---------#
#-------------------------------------------------# 
## IMPORTANTE #1: Como TODO está 'MODULARIZADO', es importante preguntarnos: 
## 1. ¿QUE DESEAMOS 'PERSONALIZAR' ... DE LO QUE YA ESTÁ?.
## 2. ¿QUE DESEAMOS 'REUTILIZAR' ... DE LO QUE YA ESTÁ?.

## IMPORTANTE #2: Lo que se desea 'PERSONALIZAR', se tendrá que 'SOBREESCRIBIR'. 
## IMPORTANTE #3: Lo definidos como 'DINAMICOS' son 'REFERENCIAS EXTERNAS' a otros 'MÓDULOS'.
## Estos deberán der 'DECLARADOS' como CONSTANTE para ser luego 'SOBREESCRITOS' en: 'main_*_desa'.   

## IMPORTANTE #4: SI existen valores 'DUPLICADOS' entre los 'MÓDULOS', estos se tendrán
## que considerar & registrar 'INDEPENDIENTEMENTE' por 'MÓDULO'.


###### CREANDO RECURSOS: 'API-GATEWAY' ######:  
resource "aws_api_gateway_rest_api" "agra_001" {
  name        = "agra_001"
  description = "API QUE PERMITE EXPONER LA FUNCIONALIDAD DEL 'MICROSERVICIO' EN BASE A SU 'API'."
  body        = "${file( var.const_directorio_script_openapi )}" //Cargando el API: 'openapi'. 

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

