 # encoding: utf-8
module Laximo

  class Oem

    def initialize

      @request = ::Laximo::Request.new(
        ::Laximo.options.oem_soap_endpoint,
        ::Laximo.options.oem_soap_action
      )

    end # initialize

    def list_catalogs(
      ssd: nil,
      locale: ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('ListCatalogs').
        locale(locale).
        ssd(ssd).
        call(@request)

      ::Laximo::Respond::ListCatalogs.new(resp)

    end # list_catalogs

    def get_catalog_info(
      catalog:,
      ssd:      nil,
      locale:   ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('GetCatalogInfo').
        locale(locale).
        ssd(ssd).
        catalog(catalog).
        call(@request)

      ::Laximo::Respond::GetCatalogInfo.new(resp)

    end # get_catalog_info

    def find_vehicle_by_vin(
      vin:,
      catalog:    nil,
      ssd:        nil,
      localized:  true,
      locale:     ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('FindVehicleByVIN').
        locale(locale).
        ssd(ssd).
        catalog(catalog).
        vin(vin).
        localized(localized).
        call(@request)

      ::Laximo::Respond::FindVehicleByVin.new(resp)

    end # find_vehicle_by_vin

    def find_vehicle_by_frame(
      frame:,
      frame_no:,
      catalog:    nil,
      ssd:        nil,
      localized:  true,
      locale:     ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('FindVehicleByFrame').
        locale(locale).
        catalog(catalog).
        frame(frame).
        frame_no(frame_no).
        ssd(ssd).
        localized(localized).
        call(@request)

      ::Laximo::Respond::FindVehicleByFrame.new(resp)

    end # find_vehicle_by_frame

    # TODO: Устаревший метод
    def get_wizard(
      catalog:,
      wizard_id:  nil,
      value_id:   nil,
      locale:     ::Laximo.options.locale
    )

      ::Laximo.deprecated!

      resp = ::Laximo::Query.
        new('GetWizard').
        locale(locale).
        catalog(catalog).
        wizard_id(wizard_id).
        value_id(value_id).
        call(@request)

      ::Laximo::Respond::GetWizard.new(resp)

    end # get_wizard

    def get_wizard2(
      catalog:,
      ssd:    nil,
      locale: ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('GetWizard2').
        locale(locale).
        catalog(catalog).
        ssd(ssd).
        call(@request)

      ::Laximo::Respond::GetWizard2.new(resp)

    end # get_wizard2

    def get_wizard_next_step2(
      catalog:,
      ssd:    nil,
      locale: ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('GetWizardNextStep2').
        locale(locale).
        catalog(catalog).
        ssd(ssd).
        call(@request)

      ::Laximo::Respond::GetWizardNextStep2.new(resp)

    end # get_wizard_next_step2

    # TODO: Устаревший метод
    def find_vehicle_by_wizard(
      catalog:,
      wizard_id:  nil,
      ssd:        nil,
      localized:  true,
      locale:     ::Laximo.options.locale
    )

      ::Laximo.deprecated!

      resp = ::Laximo::Query.
        new('FindVehicleByWizard').
        locale(locale).
        wizard_id(wizard_id).
        catalog(catalog).
        ssd(ssd).
        localized(localized).
        call(@request)

      ::Laximo::Respond::FindVehicleByWizard.new(resp)

    end # find_vehicle_by_wizard

    def find_vehicle_by_wizard2(
      catalog:,
      ssd:    nil,
      locale: ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('FindVehicleByWizard2').
        locale(locale).
        catalog(catalog).
        ssd(ssd).
        call(@request)

      ::Laximo::Respond::FindVehicleByWizard2.new(resp)

    end # find_vehicle_by_wizard2

    def get_vehicle_info(
      catalog:,
      vehicle_id:,
      ssd:        nil,
      localized:  true,
      locale:     ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('GetVehicleInfo').
        locale(locale).
        catalog(catalog).
        vehicle_id(vehicle_id).
        ssd(ssd).
        localized(localized).
        call(@request)

      ::Laximo::Respond::GetVehicleInfo.new(resp)

    end # get_vehicle_info

    def exec_custom_operation(
      catalog:,
      operation:,
      param:,
      locale:  ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('GetVehicleInfo').
        locale(locale).
        catalog(catalog).
        operation(operation).
        param(param).
        call(@request)

      ::Laximo::Respond::ExecCustomOperation.new(resp)

    end # exec_custom_operation

    def list_units(
      catalog:,
      vehicle_id:,
      ssd:          nil,
      category_id:  -1,
      localized:    true,
      locale:       ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('ListUnits').
        locale(locale).
        catalog(catalog).
        vehicle_id(vehicle_id).
        category_id(category_id).
        ssd(ssd).
        localized(localized).
        call(@request)

      ::Laximo::Respond::ListUnits.new(resp)

    end # list_units

    def list_categories(
      catalog:,
      vehicle_id:,
      ssd:          nil,
      category_id:  -1,
      locale:       ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('ListCategories').
        locale(locale).
        catalog(catalog).
        vehicle_id(vehicle_id).
        category_id(category_id).
        ssd(ssd).
        call(@request)

      ::Laximo::Respond::ListCategories.new(resp)

    end # list_categories

    def get_filter_by_unit(
      catalog:,
      unit_id:,
      vehicle_id:,
      filter:,
      ssd:      nil,
      locale:   ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('GetFilterByUnit').
        locale(locale).
        catalog(catalog).
        unit_id(unit_id).
        vehicle_id(vehicle_id).
        filter(filter).
        ssd(ssd).
        call(@request)

      ::Laximo::Respond::GetFilterByUnit.new(resp)

    end # get_filter_by_unit

    def get_unit_info(
      catalog:,
      unit_id:,
      ssd:        nil,
      localized:  true,
      locale:     ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('GetUnitInfo').
        locale(locale).
        catalog(catalog).
        ssd(ssd).
        unit_id(unit_id).
        localized(localized).
        call(@request)

      ::Laximo::Respond::GetUnitInfo.new(resp)

    end # get_unit_info

    def list_detail_by_unit(
      catalog:,
      unit_id:,
      ssd:        nil,
      localized:  true,
      locale:     ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('ListDetailByUnit').
        locale(locale).
        catalog(catalog).
        ssd(ssd).
        unit_id(unit_id).
        localized(localized).
        call(@request)

      ::Laximo::Respond::ListDetailByUnit.new(resp)

    end # list_detail_by_unit

    def list_image_map_by_unit(
      catalog:,
      unit_id:,
      ssd:      nil
    )

      resp = ::Laximo::Query.
        new('ListImageMapByUnit').
        catalog(catalog).
        ssd(ssd).
        unit_id(unit_id).
        call(@request)

      ::Laximo::Respond::ListImageMapByUnit.new(resp)

    end # list_image_map_by_unit

    def get_filter_by_detail(
      catalog:,
      unit_id:,
      detail_id:,
      filter:,
      ssd:      nil,
      locale:   ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('GetFilterByDetail').
        locale(locale).
        catalog(catalog).
        unit_id(unit_id).
        detail_id(detail_id).
        filter(filter).
        ssd(ssd).
        call(@request)

      ::Laximo::Respond::GetFilterByDetail.new(resp)

    end # get_filter_by_detail

    def list_quick_group(
      catalog:,
      vehicle_id:,
      ssd:        nil,
      locale:     ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('ListQuickGroup').
        locale(locale).
        catalog(catalog).
        vehicle_id(vehicle_id).
        ssd(ssd).
        call(@request)

      ::Laximo::Respond::ListQuickGroup.new(resp)

    end # list_quick_group

    def list_quick_detail(
      catalog:,
      vehicle_id:,
      quick_group_id:,
      all:            1,
      ssd:            nil,
      localized:      true,
      locale:         ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('ListQuickDetail').
        locale(locale).
        catalog(catalog).
        vehicle_id(vehicle_id).
        quick_group_id(quick_group_id).
        all(all).
        ssd(ssd).
        localized(localized).
        call(@request)

      ::Laximo::Respond::ListQuickDetail.new(resp)

    end # list_quick_detail

  end # Oem

end # Laximo
