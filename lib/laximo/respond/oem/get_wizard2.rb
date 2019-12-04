# encoding: utf-8
module Laximo

  module Respond

    class GetWizard2 < Laximo::Respond::Base

      def self.parsing_result(str)

        str.xpath('//GetWizard2/row').inject([]) { |arr, node|

          h = node_to_hash(node) { |h1, n1|
            h1[:options] = nodes_to_hash(node.xpath('./options/row'))
          }

          arr << h unless h.empty?
          arr

        }

      end # parsing_result

    end # GetWizard2

  end # Respond

end # Laximo
