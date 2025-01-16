# AppiumRubyML

Automatización con appium Android 

Navegar por la aplicación de mercado libre, aplicar filtros de búsqueda y recuperar artículos. 

Es necesario instalar: 

 Tener instalado node y npm. 
Tener instalado Appium (por consola) o Appium desktop (version según necesidades) 

 Appium se puede instalar con el siguiente comando en terminal: npm install -g appium 

Se obtiene el cliente: npm install wd 

Tener instalado appium-doctor: npm install appium doctor –g 

Instalar appium inspector en el pc para el mapeo de selectores 

Instalar appium Server GUI 

Instalar Android studio 

Instalar Ruby 

Instalar drivers para appium: appium driver install uiautomator2 

Instalar plugin de ejecucion: appium plugin install execute-driver 

Instalar libreria de ruby para interactuar con appium: gem install appium_lib 
 

En el celular tener instalado appium settings para poder interactuar con la máquina, así como tener habilitadas las opciones de desarrollador y la depuración usb. 
Establecer las variables de entorno del sistema de JAVA_HOME y ANDROID_HOME y especificarlas también en la configuracion de Appium server 
 
Interfaz de usuario gráfica, Texto, Aplicación

Descripción generada automáticamente 
 
Empezar el servidor: 

Interfaz de usuario gráfica, Aplicación

Descripción generada automáticamente 

Dando click en “starServer” en el servidor de appium Appium Server GUI. En appium inspector se establecen las capabilities del celular con el que se va a interactuar 
Interfaz de usuario gráfica, Texto, Aplicación

Descripción generada automáticamente 
 

En Remote Path es necesario escribir /wd/hub 

Conectar el teléfono y luego dar click en Start Session, si todo se instaló correctamente Appium inspector debería mostrar la pantalla del dispositivo móvil. Con ayuda de appium server y apium inspector vamos a mapear los elementos de interés con los que va a interactuar el flujo. 

 
El código está desarrollado en Ruby, con ayuda de la libreria appium_lib se interactúa con Appium.  
La documentación de los comandos y sintáxis se puede consultar en las siguientes ligas: 
 
https://appium.io/docs/en/2.0/quickstart/test-rb/ 

https://github.com/appium/ruby_lib_core/tree/master/test/functional 

https://www.rubydoc.info/github/appium/ruby_lib_core#functional-tests 

Aunque la documentación no es muy extensa o especifica se pueden consultar algunos ejemplos del segundo enlace y adaptarlo a tus necesidades. 
 
El código realizado se encuentra comentado.  
Para ejecutar la prueba mediante consola se tiene que iniciar appium, con el siguiente comando en un cmd para Windows: appium 
 
Y desde la ruta del proyecto se lanza el script desarrollado con Ruby con: ruby .\searchML.rb 

 

 

 

Notas: La app de mercado libre no tiene opción de filtrar por locación o ciudad 