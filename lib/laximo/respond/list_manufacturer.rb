# encoding: utf-8
module Laximo

  module Respond

    class ListManufacturer < Laximo::Respond::Base

      def parsing_result(str)

        str.xpath('//ListManufacturer/row').inject([]) { |arr, node|

          h = {}
          node.attributes.each { |key, snd|
            h[key.to_sym] = snd.value
          }

          arr << h

        }

      end # parsing_result

    end # ListManufacturer

  end # Respond

end # Laximo
