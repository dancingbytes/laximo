# encoding: utf-8
module Laximo

  module Respond

    class ListManufacturer < Laximo::Respond::Base

      def parsing_result(str)

        nodes_to_hash(
          str.xpath('//ListManufacturer/row')
        )

      end

    end # ListManufacturer

  end # Respond

end # Laximo
