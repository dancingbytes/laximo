# encoding: utf-8
module Laximo

  REQUEST_LOGIN_MSG = %{<?xml version="1.0" encoding="UTF-8"?>
<SOAP-ENV:Envelope SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"
xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/">
  <SOAP-ENV:Body>
    <ns5692:QueryDataLogin xmlns:ns5692="%{act}">
      <request xsi:type="xsd:string">%{msg}</request>
      <login xsi:type="xsd:string">%{login}</login>
      <hmac xsi:type="xsd:string">%{hash}</hmac>
    </ns5692:QueryDataLogin>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>}.freeze

  class Request

    def initialize(soap_endpoint, soap_action)

      @soap_endpoint  = soap_endpoint
      @soap_action    = soap_action

      @uri     = URI(soap_endpoint)
      @http    = ::Net::HTTP.new(@uri.host, @uri.port)
      @request = ::Net::HTTP::Post.new(@uri.request_uri)

      set_request_params
      set_http_params

    end

    def call(*args)

      msg = args.join("\n")

      @request.body = (REQUEST_LOGIN_MSG % {
        msg:   msg,
        act:   @soap_action,
        login: ::Laximo.options.login,
        hash:  hash(msg, ::Laximo.options.password)
      })

      begin
        @http.request @request
      rescue ::Exception => ex
        ex
      end

    end

    private

    def set_http_params

      @http.set_debug_output($stdout) if ::Laximo.options.debug?

      @http.use_ssl      = ssl?
      @http.verify_mode  = ::OpenSSL::SSL::VERIFY_NONE

      @http.open_timeout = ::Laximo.options.timeout
      @http.read_timeout = ::Laximo.options.timeout
      @http.ssl_timeout  = ::Laximo.options.timeout

      self

    end

    def set_request_params

      @request['User-Agent']   = ::Laximo.options.user_agent
      @request['Accept']       = "*/*"
      @request['Content-Type'] = "text/xml; charset=UTF-8"
      @request['SOAPAction']   = "\"#{@soap_action}\""

      self

    end

    def hash(command, password)
      ::Digest::MD5::hexdigest "#{command}#{password}"
    end

    def ssl?
      @uri.scheme == 'https'.freeze
    end

  end # Request

end # Laximo
