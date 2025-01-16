require 'appium_lib_core'
require 'test/unit'

CAPABILITIES = {
  platformName: 'Android',
  automationName: 'UiAutomator2',
  deviceName: 'motog8',
}

SERVER_URL = 'http://localhost:4723'

class AppiumTest < Test::Unit::TestCase
  def setup
    @core = ::Appium::Core.for capabilities: CAPABILITIES
    @driver = @core.start_driver server_url: SERVER_URL
   

  end

  def teardown
    @driver&.quit
  end

  def test_version
    #selectores
    mlapp = "//android.widget.TextView[@content-desc='Mercado Libre']"
    searchBox = "//android.widget.TextView[@resource-id='com.mercadolibre:id/ui_components_toolbar_title_toolbar']"
    introduceSearchBox = "//android.widget.EditText[@resource-id='com.mercadolibre:id/search_input_edittext']"
    firstElementSearched= "//androidx.recyclerview.widget.RecyclerView[@resource-id='com.mercadolibre:id/search_input_recyclerview']/android.widget.RelativeLayout[1]"
    filtersButton = "(//android.widget.LinearLayout[@resource-id='com.mercadolibre:id/appbar_content_layout'])[1]/android.widget.LinearLayout"
    sortMorePrice = "//android.widget.ToggleButton[@resource-id='sort-price_desc']"
    categoryConditionFilter = "//android.view.View[@resource-id='selectable-5']"
    newConditionFilter = "//android.widget.ToggleButton[@resource-id='ITEM_CONDITION-2230284']"
    categoryTypeShippingFilter = "//android.view.View[@resource-id='selectable-11']"
    localShippingFilter = "//android.widget.ToggleButton[@resource-id='SHIPPING_ORIGIN-10215068']" 
    buttonSeeResults = "//android.widget.Button[@resource-id=':r3:']"
    titles = "//android.widget.TextView[@resource-id='com.mercadolibre:id/search_cell_title_text_view']"
    prices = "//android.widget.TextView[@resource-id='com.mercadolibre:id/money_amount_text' or @resource-id='com.mercadolibre:id/search_cell_pds_qty_price_view']"


    # Abrimos la aplicación de Mercado Libre
    @driver.wait { |d| d.find_element :xpath, mlapp }.click

    # Esperamos a que se cargue la pantalla de inicio  click a buscador y busqueda
    @driver.wait { |d|  d.find_element :xpath , searchBox  }.click
    @driver.wait { |d| d.find_element :xpath, introduceSearchBox}.send_keys("playstation 5")
    @driver.wait { |d| d.find_element :xpath, firstElementSearched}.click

    # Esperamos a que se carguen boton filtro
    @driver.wait{|d| d.find_element :xpath, filtersButton}.click

    #Se ordena por mayor precio
    @driver.wait{ |d| d.find_element :xpath, sortMorePrice}.click
    @driver.wait { |d| d.find_element :xpath, categoryConditionFilter}.click

    #Se filtran los articulos nuevos
    @driver.wait { |d| d.find_element :xpath, newConditionFilter}.click

    #aplicamos filtros
    @driver.wait { |d| d.find_element :xpath, buttonSeeResults}.click

    #variable de titulos
    recoveredTitles = @driver.wait{ |d| d.find_elements :xpath, titles}
    #variable de precios
    recoveredPrices = @driver.wait{ |d| d.find_elements :xpath, prices}
    #indice de articulos a recuperar
    nArticles = recoveredPrices.length
    #Se imprimen los articulos encontrados
    puts ("Titulos encontrados: ")
   
    for i in 0..nArticles-1
        puts ("Articulo  #{recoveredTitles[i].text}" )
        puts ("Precio  #{recoveredPrices[i].text}")
        puts("-------------------------------------")
end

  end
end