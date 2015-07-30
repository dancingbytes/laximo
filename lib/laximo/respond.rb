# encoding: utf-8
module Laximo

  module Respond

    class Base

      RESPONSE_RESULT     = '//QueryDataResponse/return'.freeze
      RESPONSE_SOAP_ERROR = '//Fault/faultstring'.freeze

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
        ::NotImplementedError.new("Метод `parsing_result` не реализован в классе #{self.class.name}")
      end # parsing_result

      private

      def node_to_hash(node)

        return {} if node.nil?

        h = {}
        node.attributes.each { |key, snd|
          h[key.to_sym] = snd.value
        }

        return {} if h.empty?
        yield(h, node) if block_given?

        h

      end # node_to_hash

      def nodes_to_hash(nodes, recursive: true)

        arr = []
        nodes.each { |node|

          h = {}
          node.attributes.each { |key, snd|
            h[key.to_sym] = snd.value
          }

          h[:children] = nodes_to_hash(node.children, recursive: true) if recursive
          arr << h

        }
        arr

      end # nodes_to_hash

      def prepare_request(request)

        if request.is_a?(::Net::HTTPOK)
          prepare_http(request)
        else
          prepare_error(request)
       end

      end # prepare_request

      def prepare_error(http)

        @result = []

        if http.is_a?(::Net::HTTPBadRequest)
          @error = ::Laximo::SslCertificateError.new('SSL cetificate not found or invalidate')
        else

          begin

            doc = ::Nokogiri::XML(http.body)
            doc.remove_namespaces!

            if (res = doc.xpath(RESPONSE_SOAP_ERROR)).empty?
              @error = http
            else
              @error = soap_errors(res.text)
            end

          rescue => ex
            @error = ex
          end

        end

      end # prepare_error

      def prepare_http(http)

        begin

          doc = ::Nokogiri::XML(http.body)
          doc.remove_namespaces!

          res = doc.xpath(RESPONSE_RESULT).children[0].to_s
          str_to_xml_tags!(res)

          @error  = nil
          @result = parsing_result(::Nokogiri::XML(res)) || []

        rescue => ex

          @result = []
          @error  = ex

        end

      end # prepare_http

      def soap_errors(err_txt)

        err_name, msg = err_txt.split(':')

        err_cls = Laximo::ERRORS[err_name] || ::Laximo::SoapError
        err_cls.new(msg)

      end # soap_errors

      def str_to_xml_tags!(str)

        str.gsub!('&apos;', "'")
        str.gsub!('&quot;', '"')
        str.gsub!('&gt;', '>')
        str.gsub!('&lt;', '<')
        str

      end # str_to_xml_tags!

    end # Base

  end # Respond

end # Laximo
