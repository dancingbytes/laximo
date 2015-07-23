# encoding: utf-8
require 'nokogiri'

require 'uri'
require 'net/http'

require 'laximo/version'
require 'laximo/options'
require 'laximo/request'
require 'laximo/respond'

Dir[File.join(File.dirname(__FILE__), '/laximo/respond/**/*.rb')].each do |libs|
  require libs
end


require 'laximo/am'

module Laximo

  extend self

  def options
    ::Laximo::Options
  end # options

  def am
    ::Laximo::Am.new
  end # am

end # Laximo

require 'laximo/defaults'
