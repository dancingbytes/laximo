# encoding: utf-8
module Laximo

  module Respond

    class ListQuickDetail < Laximo::Respond::Base

      def parsing_result(str)

        str.xpath('//ListQuickDetail/Category').inject([]) { |arr, node|

          h = node_to_hash(node) { |h1, n1|

            h1[:unit] = n1.xpath('./Unit').inject([]) { |arr1, n2|

              arr1 << node_to_hash(n2) { |h2, n3|

                h1[:attributes] = nodes_to_hash(n3.xpath('./attribute'))
                h1[:details]    = nodes_to_hash(n3.xpath('./Detail/attribute'))

              }

            }

          }

          arr << h unless h.empty?

        }

      end # parsing_result

    end # ListQuickDetail

  end # Respond

end # Laximo
