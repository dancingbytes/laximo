# encoding: utf-8
module Laximo

  module Respond

    class ListManufacturer < Laximo::Respond::Base

      def parsing_result(str)

        str.xpath('//ListManufacturer/row').inject([]) { |arr, node|
          arr << attrs_to_hash(node)
        }

      end # parsing_result

    end # ListManufacturer

  end # Respond

end # Laximo
