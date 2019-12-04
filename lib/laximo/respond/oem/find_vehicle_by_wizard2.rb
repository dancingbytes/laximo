# encoding: utf-8
module Laximo

  module Respond

    class FindVehicleByWizard2 < Laximo::Respond::Base

      def self.parsing_result(str)

        str.xpath('//FindVehicleByWizard2/row').inject([]) { |arr, node|

          h = node_to_hash(node) { |h1, n1|
            h1[:attributes] = nodes_to_hash(n1.xpath('./attribute'))
          }

          arr << h unless h.empty?
          arr

        }

      end

    end # FindVehicleByWizard2

  end # Respond

end # Laximo
