# encoding: utf-8
module Laximo

  module Respond

    class GetFilterByUnit < Laximo::Respond::Base

      def parsing_result(str)

        str.xpath('//GetFilterByUnit/row').inject([]) { |arr, node|

          h = node_to_hash(node) { |h1, n1|
            h1[:values] = nodes_to_hash(n1.xpath('./values/row'))
          }

          arr < h unless h.empty?
          arr

        }

      end # parsing_result

    end # GetFilterByUnit

  end # Respond

end # Laximo
