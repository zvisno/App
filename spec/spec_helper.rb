require 'rspec'
require 'pry'
require 'capybara/rspec'
require 'date'
require 'fileutils'
require 'scratchweb/progress'
require 'scratchweb/http/response'
require 'scratchweb/http/header'
require 'support/upload_helper'


include UploadHelper

FILES = File.dirname(__FILE__) + '/files'
TEMP_FILE = "/tmp/upload-#{Date.today.to_s.gsub('-','')}"

Capybara.default_driver = :selenium
Capybara.app_host = 'http://0.0.0.0:8081'

RSpec.configure do |config|
  config.include Capybara::DSL
end