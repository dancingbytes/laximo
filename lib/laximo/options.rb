# encoding: utf-8
module Laximo

  module Options

    extend self

    def ssl_key(str)

      return @ssl_key if str.blank?
      raise ::LoadError.new("File #{str} is not found") unless File.exists?(str)

      @ssl_key = ::OpenSSL::PKey::RSA.new(::File.read(str))

    end # ssl_key

    def ssl_cert(str)

      return @ssl_cert if str.blank?
      raise ::LoadError.new("File #{str} is not found") unless File.exists?(str)

      @ssl_cert = ::OpenSSL::X509::Certificate.new(::File.read(str))

    end # ssl_cert

    def ssl_verify(str)

      return @ssl_verify if str.blank?
      @ssl_verify = (str === true ? ::OpenSSL::SSL::VERIFY_PEER : ::OpenSSL::SSL::VERIFY_NONE)

    end # ssl_verify

    def use_ssl(str)

      return @use_ssl if str.blank?
      @use_ssl = str === true

    end # use_ssl

    def timeout(str)

      return @timeout if str.blank?
      @timeout = String(str).to_i(10).abs

    end # timeout

    def user_agent(str)

      return @user_agent if str.blank?
      @user_agent = str

    end # user_agent

    def debug(str)
      @debug = (str === true)
    end # debug

    def debug?
      @debug === true
    end # debug?

    def am_soap_action(str)

      return @am_soap_action if str.blank?
      @am_soap_action = str

    end # am_soap_action

    def am_soap_endpoint(str)

      return @am_soap_endpoint if str.blank?
      @am_soap_endpoint = str

    end # am_soap_endpoint

  end # Options

end # Laximo
