# encoding: utf-8
module Laximo

  module Respond

    class FindOemCorrection < Laximo::Respond::Base

      def parsing_result(str)

        str.xpath('//FindOEMCorrection/detail').inject([]) { |arr, node|
          arr << attrs_to_hash(node)
        }

      end # parsing_result

    end # FindOemCorrection

  end # Respond

end # Laximo
