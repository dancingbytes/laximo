# encoding: utf-8
module Laximo

  module Respond

    class FindOem < Laximo::Respond::Base

      def parsing_result(str)

        str.xpath('//FindOEM/detail').inject([]) { |arr, node|

          h = attrs_to_hash(node)

          h[:images] = node.xpath('./images/image').inject([]) { |arr1, n1|
            arr1 << attrs_to_hash(n1)
          }

          h[:properties] = node.xpath('./properties/property').inject([]) { |arr1, n1|
            arr1 << attrs_to_hash(n1)
          }

          h[:replacements] = node.xpath('./replacements/replacement').inject([]) { |arr1, n1|

            h1 = attrs_to_hash(n1)
            h2 = attrs_to_hash(n1.children[0])
            h1.merge!(h2)

            arr1 << h1

          }

          arr << h

        }

      end # parsing_result

    end # FindOem

  end # Respond

end # Laximo
