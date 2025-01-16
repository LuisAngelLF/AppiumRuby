require 'appium_lib'

# Configuración de Appium
caps = {
  platformName: 'Android',
  platformVersion: '11',
  automationName: 'UiAutomator2',
}

# Inicialización de Appium
Appium::Driver.new(caps).start_driver

# Obtenemos el driver
driver = Appium::Driver.new(caps, true).driver

# Abrimos la aplicación de Mercado Libre
driver.start_activity(app_package: 'com.mercadolibre', app_activity: 'com.mercadolibre.MainActivity')

# Esperamos a que se cargue la pantalla de inicio
driver.wait { displayed { find_element(id: 'com.mercadolibre:id/search_box') } }

# Hacemos clic en el botón de búsqueda
driver.find_element(id: 'com.mercadolibre:id/search_box').click

# Introducimos el texto de búsqueda
driver.find_element(id: 'com.mercadolibre:id/search_src_text').send_keys('iPhone 13')

# Hacemos clic en el botón de búsqueda
driver.find_element(id: 'com.mercadolibre:id/search_button').click

# Esperamos a que se carguen los resultados de búsqueda
driver.wait { displayed { find_element(id: 'com.mercadolibre:id/listview_search_results') } }

# Imprimimos el título del primer resultado de búsqueda
puts driver.find_element(id: 'com.mercadolibre:id/listview_search_results').find_elements(id: 'com.mercadolibre:id/title')[0].text

# Cerramos la aplicación
driver.quit