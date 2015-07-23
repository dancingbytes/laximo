# encoding: utf-8
module Laximo

  module Respond

    class FindReplacements < Laximo::Respond::Base

      def parsing_result(str)

        str.xpath('//FindReplacements/row').inject([]) { |arr, node|
          arr << attrs_to_hash(node)
        }

      end # parsing_result

    end # FindReplacements

  end # Respond

end # Laximo
