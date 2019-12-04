# encoding: utf-8
module Laximo

  module Respond

    class VehicleWithListDetailsByUnit < Laximo::Respond::Base

      def self.parsing_result(str)

        {

          get_unit_info:          GetUnitInfo.parsing_result(str),
          list_detail_by_unit:    ListDetailByUnit.parsing_result(str),
          list_image_map_by_unit: ListImageMapByUnit.parsing_result(str),
          get_catalog_info:       GetCatalogInfo.parsing_result(str),
          get_vehicle_info:       GetVehicleInfo.parsing_result(str)

        }

      end

    end # VehicleWithListDetailsByUnit

  end # Respond

end # Laximo
