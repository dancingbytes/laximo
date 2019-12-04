# encoding: utf-8
module Laximo

  module Respond

    class Base

      RESPONSE_RESULT       = '//QueryDataResponse/return'.freeze
      RESPONSE_LOGIN_RESULT = '//QueryDataLoginResponse/return'.freeze
      RESPONSE_SOAP_ERROR   = '//Fault/faultstring'.freeze


      class << self

        def parsing_result(str)
          ::NotImplementedError.new("Метод `parsing_result` не реализован в классе #{self.class}")
        end

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

            if recursive
              children      = nodes_to_hash(node.children, recursive: true)
              h[:children]  = children unless children.empty?
            end
            arr << h

          }
          arr

        end # nodes_to_hash

      end

      def initialize(request)

        @error  = nil
        @result = []

        prepare_request(request)

      end # initialize

      def success?
        @error.nil?
      end

      def failure?
        !@error.nil?
      end

      alias :error? :failure?

      def error
        @error
      end

      def result
        @result
      end

      def result!

        raise error.class, error.message if failure?
        result

      end

      private

      def prepare_request(request)

        if request.is_a?(::Net::HTTPOK)
          prepare_http(request)
        else
          prepare_error(request)
       end

      end # prepare_request

      def prepare_error(http)

        @result = []

        if http.respond_to?(:body)

          begin

            doc = ::Nokogiri::XML(http.body)
            doc.remove_namespaces!

            if (res = doc.xpath(RESPONSE_SOAP_ERROR)).empty?
              @error = http
            else
              @error = soap_errors(res.text)
            end

          rescue ::Exception => ex
            @error = ex
          end

        elsif http.is_a?(::Net::HTTPBadRequest)
          @error = ::Laximo::SslCertificateError.new('SSL cetificate doesn`t found or invalidate')
        else
          @error = http
        end

      end # prepare_error

      def prepare_http(http)

        begin

          doc = ::Nokogiri::XML(http.body)
          doc.remove_namespaces!

          res = doc.xpath(RESPONSE_LOGIN_RESULT).children[0].to_s
          res = doc.xpath(RESPONSE_RESULT).children[0].to_s if res.blank?

          @error  = nil
          @result = self.class.parsing_result(
            ::Nokogiri::XML(unescape(res))
          ) || []

        rescue ::Exception => ex

          @result = []
          @error  = ex

        end

      end # prepare_http

      def soap_errors(err_txt)

        err_name, msg = err_txt.split(':')

        err_cls = Laximo::ERRORS[err_name] || ::Laximo::SoapError
        err_cls.new(msg)

      end # soap_errors

      def unescape(str)
        ::CGI::unescapeHTML str
      end

    end # Base

  end # Respond

end # Laximo
