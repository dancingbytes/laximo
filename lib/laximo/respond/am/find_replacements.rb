# encoding: utf-8
module Laximo

  module Respond

    class FindReplacements < Laximo::Respond::Base

      def parsing_result(str)

        nodes_to_hash(
          str.xpath('//FindReplacements/row'),
          recursive: false
        )

      end

    end # FindReplacements

  end # Respond

end # Laximo
