# encoding: utf-8
module Laximo

  module Respond

    class Base

      RESPONSE_PATH = '//QueryDataResponse/return'.freeze

      def initialize(request)

        @error  = nil
        @result = []

        prepare_request(request)

      end # initialize

      def success?
        @error.nil?
      end # success?

      def failure?
        !@error.nil?
      end # failure?

      alias :error? :failure?

      def error
        @error
      end # error

      def result
        @result
      end # result

      def parsing_result(str)
        ::NotImplementedError.new("Метод #{parsing_result} не реализован в классе #{self.class.name}")
      end # parsing_result

      private

      def attrs_to_hash(node)

        return {} if node.nil?

        h = {}
        node.attributes.each { |key, snd|
          h[key.to_sym] = snd.value
        }
        h

      end # attrs_to_hash

      def prepare_request(request)

        if request.is_a?(::Net::HTTPOK)
          prepare_http(request)
        else
          prepare_error(request)
       end

      end # prepare_request

      def prepare_error(err)

        @result = []
        @error  = err

      end # prepare_error

      def prepare_http(http)

        begin

          doc = ::Nokogiri::XML(http.body)
          doc.remove_namespaces!

          res = doc.xpath(RESPONSE_PATH).children[0].to_s
          str_to_xml_tags!(res)

          @error  = nil
          @result = parsing_result(::Nokogiri::XML(res))

        rescue => ex
          prepare_error(ex)
        end

      end # prepare_http

      def str_to_xml_tags!(str)

        str.gsub!('&amp;', '&')
        str.gsub!('&apos;', "'")
        str.gsub!('&quot;', '"')
        str.gsub!('&gt;', '>')
        str.gsub!('&lt;', '<')
        str

      end # str_to_xml_tags!

    end # Base

  end # Respond

end # Laximo
