# encoding: utf-8
module Laximo

  module Respond

    class GetWizard < Laximo::Respond::Base

      def parsing_result(str)

        str.xpath('//GetWizard/row').inject([]) { |arr, node|

          h = node_to_hash(node) { |h1, n1|
            h1[:options] = nodes_to_hash(node.xpath('./options/row'))
          }

          arr << h unless h.empty?

        }

      end # parsing_result

    end # GetWizard

  end # Respond

end # Laximo
