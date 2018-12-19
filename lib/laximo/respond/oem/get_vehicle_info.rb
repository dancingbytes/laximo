# encoding: utf-8
module Laximo

  module Respond

    class GetVehicleInfo < Laximo::Respond::Base

      def parsing_result(str)

        str.xpath('//GetVehicleInfo/row').inject([]) { |arr, node|

          h = node_to_hash(node) { |h1, n1|
            h1[:attributes] = nodes_to_hash(n1.xpath('./attribute'))
          }

          arr << h unless h.empty?

        }

      end # parsing_result

    end # GetVehicleInfo

  end # Respond

end # Laximo
