# encoding: utf-8
module Laximo

  class Respond

    def initialize(request)

      @error  = nil
      @result = nil

      prepare_request(request)

    end # initialize

    def success?
      @error.nil? && !@result.nil?
    end # success?

    def failure?
      @result.nil? && !@error.nil?
    end # failure?

    alias :error? :failure?

    def error
      @error
    end # error

    def result
      @result
    end # result

    private

    def prepare_request(request)

      if request.is_a?(::Net::HTTP)
        prepare_http(request)
      else
        prepare_error(request)
     end

    end # prepare_request

    def prepare_error(err)

      @result = nil
      @error  = err

    end # prepare_error

    def prepare_http(http)

      @error  = nil
      @result = xml_doc(http.body)

    end # prepare_http

    def xml_doc(body)
      @xml_doc = ::Nokogiri::XML::Document.parse(body)
    end # xml_doc

  end # Respond

end # Laximo
