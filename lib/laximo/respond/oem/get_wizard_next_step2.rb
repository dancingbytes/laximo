# encoding: utf-8
module Laximo

  module Respond

    class GetWizardNextStep2 < Laximo::Respond::Base

      def parsing_result(str)

        str.xpath('//GetWizardNextStep2').inject([]) { |arr, node|

          h = {}

          h[:previous_step] = nodes_to_hash(node.xpath('./previousStep/row'))
          h[:currentStep]   = node_to_hash(node.xpath('./currentStep')[0]) { |h1, n2|
            h1[:options] = nodes_to_hash(n2.xpath('./options/row'))
          }

          arr << h

        }

      end # parsing_result

    end # GetWizardNextStep2

  end # Respond

end # Laximo
