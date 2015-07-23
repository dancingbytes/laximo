# encoding: utf-8
module Laximo

  module Respond

    class Manufacturer_Info < Laximo::Respond::Base

      def parsing_result(str)

        str.xpath('//ManufacturerInfo/row').inject([]) { |arr, node|
          arr << attrs_to_hash(node)
        }

      end # parsing_result

    end # Manufacturer_Info

  end # Respond

end # Laximo
