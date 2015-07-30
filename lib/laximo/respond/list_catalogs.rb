# encoding: utf-8
module Laximo

  module Respond

    class ListCatalogs < Laximo::Respond::Base

      def parsing_result(str)

        str.xpath('//ListCatalogs/row').inject([]) { |arr, node|

          h = node_to_hash(node)

          h[:features]    = nodes_to_hash(node.xpath('./features/feature'))
          h[:operations]  = node.xpath('./extensions/operations/opration').inject([]) { |arr1, n1|

            h1 = node_to_hash(n1)
            h1[:params] = nodes_to_hash(n1.xpath('./params/param'))

            arr1 << h1

          }

          arr << h unless h.empty?

        }

      end # parsing_result

    end # ListCatalogs

  end # Respond

end # Laximo
