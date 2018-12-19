# encoding: utf-8
module Laximo

  module Options

    extend self

    def login(str = nil)

      return @login if str.nil?
      @login = str

    end

    def password(str = nil)

      return @password if str.nil?
      @password = str

    end

    def timeout(str = nil)

      return @timeout if str.nil?
      @timeout = String(str).to_i(10).abs

    end

    def user_agent(str = nil)

      return @user_agent if str.nil?
      @user_agent = str

    end

    def debug(str = nil)
      @debug = (str === true)
    end

    def debug?
      @debug === true
    end

    def am_soap_action(str = nil)

      return @am_soap_action if str.nil?
      @am_soap_action = str

    end

    def am_soap_endpoint(str = nil)

      return @am_soap_endpoint if str.nil?
      @am_soap_endpoint = str

    end

    def oem_soap_action(str = nil)

      return @oem_soap_action if str.nil?
      @oem_soap_action = str

    end

    def oem_soap_endpoint(str = nil)

      return @oem_soap_endpoint if str.nil?
      @oem_soap_endpoint = str

    end

  end # Options

end # Laximo
