# encoding: utf-8
module Laximo

  module Respond

    class VehicleWithListCategoriesAndQuickGroups < Laximo::Respond::Base

      def self.parsing_result(str)

        {

          get_catalog_info:   GetCatalogInfo.parsing_result(str),
          get_vehicle_info:   GetVehicleInfo.parsing_result(str),
          list_categories:    ListCategories.parsing_result(str),
          list_quick_group:   ListQuickGroup.parsing_result(str)

        }

      end

    end # VehicleWithListQuickDetail

  end # Respond

end # Laximo
