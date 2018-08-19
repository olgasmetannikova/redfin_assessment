require 'rspec'
require 'faker'
require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'site_prism/waiter'
require 'allure-rspec'
require 'eyes_selenium'

require_relative '../helpers/instance_helper'
include InstanceHelper

require_relative '../helpers/helpers'
include Helpers

LOGGER = Logger.new(STDOUT)
CONFIG ||= YAML.load_file('config/config.yml')
TEST_DATA ||= YAML.load_file('config/test_data.yml')
TEST_ENV = ENV.fetch('TEST_ENV', 'DEV')

SitePrism.configure do |config|
  config.use_implicit_waits = true
end

Capybara.configure do |config|
  config.default_driver = :firefox
  #config.default_driver = :chrome
  config.default_selector = :css
  config.default_max_wait_time = 5
  config.app_host = CONFIG[TEST_ENV]['WEB_BASE_URL']
  config.match = :prefer_exact
  config.ignore_hidden_elements = false
end

Capybara.register_driver :firefox do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile.native_events = true
  profile['browser.cache.disk.enable'] = false
  profile['browser.cache.memory.enable'] = false
  Capybara::Selenium::Driver.new(app,
                                 :profile => profile)
end

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('ignore-certificate-errors')
  options.add_argument('disable-popup-blocking')
  Capybara::Selenium::Driver.new(app,
                                 :browser => :chrome,
                                 :options => options)
                                 #:switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate --test-type --ash-host-window-bounds])
end
