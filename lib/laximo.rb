# encoding: utf-8
require 'nokogiri'

require 'cgi'
require 'uri'
require 'net/http'
require 'net/https'

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
  end

  def am
    ::Laximo::Am.new
  end

  def oem
    ::Laximo::Oem.new
  end

  def tryer(try_iter: 5, time: 25)

    begin

      cl = caller_locations(1,1).first
      yield

    rescue ::Laximo::SoapTooManyRequestError

      try_iter = try_iter - 1

      puts "[#{cl}] Waiting #{time} sec..."
      sleep time

      retry if try_iter > 0
      raise

    end

  end

  def deprecated!

    puts "***"
    puts "*** DEPRECATION WARNING! Method `#{caller[0][/`.*'/][1..-2]}` is deprecated and will not support in the future"
    puts "***"

  end

end # Laximo

require 'laximo/defaults'
