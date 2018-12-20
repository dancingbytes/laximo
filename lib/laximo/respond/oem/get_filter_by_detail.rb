# encoding: utf-8
module Laximo

  module Respond

    class GetFilterByDetail < Laximo::Respond::Base

      def parsing_result(str)

        nodes_to_hash(
          str.xpath('//GetFilterByDetail/row')
        )

      end

    end # GetFilterByDetail

  end # Respond

end # Laximo
