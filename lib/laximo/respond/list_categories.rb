# encoding: utf-8
module Laximo

  module Respond

    class ListCategories < Laximo::Respond::Base

      def parsing_result(str)
        nodes_to_hash(str.xpath('//ListCategories/row'))
      end # parsing_result

    end # ListCategories

  end # Respond

end # Laximo
