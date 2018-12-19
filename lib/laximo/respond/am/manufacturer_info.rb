# encoding: utf-8
module Laximo

  module Respond

    class Manufacturer_Info < Laximo::Respond::Base

      def parsing_result(str)

        nodes_to_hash(
          str.xpath('//ManufacturerInfo/row')
        )

      end

    end # Manufacturer_Info

  end # Respond

end # Laximo
