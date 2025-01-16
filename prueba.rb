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
    @driver.wait { |d| d.find_element :xpath, '//*[@text="Battery"]' }.click
  end
end