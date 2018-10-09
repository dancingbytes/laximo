
module Laximo

  REQUEST_MSG = %q(<?xml version="1.0" encoding="UTF-8"?>
<SOAP-ENV:Envelope SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"
xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/">
  <SOAP-ENV:Body>
    <ns5692:QueryData xmlns:ns5692="%{act}">
      <request xsi:type="xsd:string">%{msg}</request>
    </ns5692:QueryData>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>).freeze

  REQUEST_LOGIN_MSG = %q(<?xml version="1.0" encoding="UTF-8"?>
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
</SOAP-ENV:Envelope>).freeze

  class Request

    def initialize(soap_endpoint, soap_action)

      @soap_endpoint  = soap_endpoint
      @soap_action    = soap_action

      @uri     = URI(soap_endpoint)
      @http    = ::Net::HTTP.new(@uri.host, @uri.port)
      @request = ::Net::HTTP::Post.new(@uri.request_uri)

      set_request_params
      set_http_params

    end # initialize

    def call(msg)

      if ::Laximo.options.use_ssl
        @request.body = REQUEST_MSG % {
          msg: msg,
          act: @soap_action
        }
      else
        @request.body = REQUEST_LOGIN_MSG % {
          msg:   msg,
          act:   @soap_action,
          login: ::Laximo.options.login,
          hash:  hash(msg, ::Laximo.options.password)
        }
      end

      begin
        @http.request @request
      rescue => ex
        ex
      end

    end # call

    private

    def set_http_params

      @http.set_debug_output($stdout) if ::Laximo.options.debug?

      @http.use_ssl      = ssl?
      @http.verify_mode  = ::OpenSSL::SSL::VERIFY_NONE

      if ::Laximo.options.use_ssl
        @http.key        = ::Laximo.options.ssl_key
        @http.cert       = ::Laximo.options.ssl_cert
      end

      @http.open_timeout = ::Laximo.options.timeout
      @http.read_timeout = ::Laximo.options.timeout
      @http.ssl_timeout  = ::Laximo.options.timeout

      self

    end # set_http_params

    def set_request_params

      @request['User-Agent']   = ::Laximo.options.user_agent
      @request['Accept']       = "*/*"
      @request['Content-Type'] = "text/xml; charset=UTF-8"
      @request['SOAPAction']   = "\"#{@soap_action}\""

      self

    end # set_request_params

    def hash(command, password)
      ::Digest::MD5::hexdigest "#{command}#{password}"
    end # hash

    def ssl?
      @uri.scheme == 'https'.freeze
    end

  end # Request

end # Laximo
