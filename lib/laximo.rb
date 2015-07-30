# encoding: utf-8
require 'nokogiri'

require 'uri'
require 'net/http'

require 'laximo/version'
require 'laximo/options'
require 'laximo/errors'
require 'laximo/request'
require 'laximo/respond'

Dir[File.join(File.dirname(__FILE__), '/laximo/respond/**/*.rb')].each do |libs|
  require libs
end

require 'laximo/query'
require 'laximo/am'
require 'laximo/oem'

module Laximo

  extend self

  def options
    ::Laximo::Options
  end # options

  def am
    ::Laximo::Am.new
  end # am

  def oem
    ::Laximo::Oem.new
  end # oem

end # Laximo

require 'laximo/defaults'
