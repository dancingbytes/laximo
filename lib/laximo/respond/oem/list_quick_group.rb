# encoding: utf-8
module Laximo

  module Respond

    class ListQuickGroup < Laximo::Respond::Base

      def parsing_result(str)

        nodes_to_hash(
          str.xpath('//ListQuickGroups/row')
        )

      end

    end # ListQuickGroup

  end # Respond

end # Laximo
