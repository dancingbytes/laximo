# encoding: utf-8
module Laximo

  module Options

    extend self

    def ssl_key(str = nil)

      return @ssl_key if str.nil?
      raise ::LoadError.new("File #{str} is not found") unless File.exists?(str)

      @ssl_key = ::OpenSSL::PKey::RSA.new(::File.read(str))

    end # ssl_key

    def ssl_cert(str = nil)

      return @ssl_cert if str.nil?
      raise ::LoadError.new("File #{str} is not found") unless File.exists?(str)

      @ssl_cert = ::OpenSSL::X509::Certificate.new(::File.read(str))

    end # ssl_cert

    def ssl_verify(str = nil)

      return @ssl_verify if str.nil?
      @ssl_verify = (str === true ? ::OpenSSL::SSL::VERIFY_PEER : ::OpenSSL::SSL::VERIFY_NONE)

    end # ssl_verify

    def use_ssl(str = nil)

      return @use_ssl if str.nil?
      @use_ssl = str === true

    end # use_ssl

    def timeout(str = nil)

      return @timeout if str.nil?
      @timeout = String(str).to_i(10).abs

    end # timeout

    def user_agent(str = nil)

      return @user_agent if str.nil?
      @user_agent = str

    end # user_agent

    def debug(str = nil)
      @debug = (str === true)
    end # debug

    def debug?
      @debug === true
    end # debug?

    def am_soap_action(str = nil)

      return @am_soap_action if str.nil?
      @am_soap_action = str

    end # am_soap_action

    def am_soap_endpoint(str = nil)

      return @am_soap_endpoint if str.nil?
      @am_soap_endpoint = str

    end # am_soap_endpoint

  end # Options

end # Laximo
