# encoding: utf-8
module Laximo

  module Respond

    class VehicleWithListCategories < Laximo::Respond::Base

      def self.parsing_result(str)

        {

          get_catalog_info: GetCatalogInfo.parsing_result(str),
          get_vehicle_info: GetVehicleInfo.parsing_result(str),
          list_categories:  ListCategories.parsing_result(str),
          list_units:       ListUnits.parsing_result(str)

        }

      end

    end # VehicleWithListCategories

  end # Respond

end # Laximo
