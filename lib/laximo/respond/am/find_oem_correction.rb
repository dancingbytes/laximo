# encoding: utf-8
module Laximo

  module Respond

    class FindOemCorrection < Laximo::Respond::Base

      def parsing_result(str)

        str.xpath('//FindOEMCorrection/detail').inject([]) { |arr, node|

          h = node_to_hash(node)

          h[:images]        = nodes_to_hash(node.xpath('./images/image'))
          h[:properties]    = nodes_to_hash(node.xpath('./properties/property'))
          h[:replacements]  = node.xpath('./replacements/replacement').inject([]) { |arr1, n1|

            h1 = node_to_hash(n1)
            h2 = node_to_hash(n1.children[0])
            h1.merge!(h2)

            arr1 << h1

          }

          arr << h

        }

      end # parsing_result

    end # FindOemCorrection

  end # Respond

end # Laximo
