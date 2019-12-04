# encoding: utf-8
module Laximo

  module Respond

    class ListQuickDetail < Laximo::Respond::Base

      def self.parsing_result(str)

        str.xpath('//ListQuickDetail/Category').inject([]) { |arr, node|

          h = node_to_hash(node) { |h1, n1|

            h1[:unit] = n1.xpath('./Unit').inject([]) { |arr1, n2|

              arr1 << node_to_hash(n2) { |h2, n3|

                h2[:details] = n3.xpath('./Detail').inject([]) { |arr2, n4|

                  arr2 << node_to_hash(n4) { |h3, n5|
                    h3[:attributes] = nodes_to_hash(n5.xpath('./attribute'))
                  }

                }

              }

            }

          }

          arr << h unless h.empty?
          arr

        }

      end # parsing_result

    end # ListQuickDetail

  end # Respond

end # Laximo
