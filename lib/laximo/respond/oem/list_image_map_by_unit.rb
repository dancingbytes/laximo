# encoding: utf-8
module Laximo

  module Respond

    class ListImageMapByUnit < Laximo::Respond::Base

      def parsing_result(str)
        nodes_to_hash(str.xpath('//ListImageMapByUnit/row'))
      end # parsing_result

    end # ListImageMapByUnit

  end # Respond

end # Laximo
