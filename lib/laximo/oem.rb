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
      ssd:    nil,
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
        catalog(catalog).
        ssd(ssd).
        call(@request)

      ::Laximo::Respond::GetCatalogInfo.new(resp)

    end # get_catalog_info

    def find_vehicle_by_vin(
      vin:,
      catalog:    nil,
      localized:  true,
      locale:     ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('FindVehicleByVIN').
        locale(locale).
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
      localized:  true,
      locale:     ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('FindVehicleByFrame').
        locale(locale).
        catalog(catalog).
        frame(frame).
        frame_no(frame_no).
        localized(localized).
        call(@request)

      ::Laximo::Respond::FindVehicleByFrame.new(resp)

    end # find_vehicle_by_frame

    def find_vehicle_by_frame_no(
      frame_no:,
      catalog:    nil,
      localized:  true,
      locale:     ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('FindVehicleByFrameNo').
        locale(locale).
        catalog(catalog).
        frame_no(frame_no).
        localized(localized).
        call(@request)

      ::Laximo::Respond::FindVehicleByFrameNo.new(resp)

    end # find_vehicle_by_frame_no

    def find_vehicle(
      ident_string:,
      catalog:    nil,
      localized:  true,
      locale:     ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('FindVehicle').
        locale(locale).
        catalog(catalog).
        ident_string(ident_string).
        localized(localized).
        call(@request)

      ::Laximo::Respond::FindVehicle.new(resp)

    end # find_vehicle

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

    def find_vehicle_by_wizard2(
      catalog:,
      ssd:,
      localized:  true,
      locale: ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('FindVehicleByWizard2').
        locale(locale).
        catalog(catalog).
        ssd(ssd).
        localized(localized).
        call(@request)

      ::Laximo::Respond::FindVehicleByWizard2.new(resp)

    end # find_vehicle_by_wizard2

    def get_vehicle_info(
      catalog:,
      vehicle_id:,
      ssd:,
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
      ssd:,
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
      ssd:,
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
      ssd:,
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
      ssd:,
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
      ssd:,
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
      ssd:
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
      ssd:,
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
      ssd:,
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
      ssd:,
      all:            1,
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

    #
    #  Специальные комбинированные методы
    #
    def vehicle_with_list_categories_and_quick_groups(
      vehicle_id:,
      catalog:,
      ssd:,
      localized:  true,
      locale:     ::Laximo.options.locale
    )

      # Информация о каталоге
      r1 = ::Laximo::Query.
        new('GetCatalogInfo').
        locale(locale).
        catalog(catalog).
        ssd(ssd)

      # Информация по конкретному автомобилю (модификации)
      r2 = ::Laximo::Query.
        new('GetVehicleInfo').
        locale(locale).
        catalog(catalog).
        vehicle_id(vehicle_id).
        ssd(ssd).
        localized(localized)

      # Список категорий каталога
      r3 = ::Laximo::Query.
        new('ListCategories').
        locale(locale).
        catalog(catalog).
        vehicle_id(vehicle_id).
        category_id(-1).
        ssd(ssd)

      # Список групп быстрого поиска деталей
      r4 = ::Laximo::Query.
        new('ListQuickGroup').
        locale(locale).
        catalog(catalog).
        vehicle_id(vehicle_id).
        ssd(ssd)

      ::Laximo::Respond::VehicleWithListCategoriesAndQuickGroups.new(
        @request.call(r1, r2, r3, r4)
      )

    end # vehicle_with_list_categories_and_quick_groups

    def vehicle_with_list_categories(
      vehicle_id:,
      catalog:,
      ssd:,
      category_id:    -1,
      localized:      true,
      locale:         ::Laximo.options.locale
    )

      # Информация о каталоге
      r1 = ::Laximo::Query.
        new('GetCatalogInfo').
        locale(locale).
        catalog(catalog).
        ssd(ssd)

      # Информация по конкретному автомобилю (модификации)
      r2 = ::Laximo::Query.
        new('GetVehicleInfo').
        locale(locale).
        catalog(catalog).
        vehicle_id(vehicle_id).
        ssd(ssd).
        localized(localized)

      # Список категорий каталога
      r3 = ::Laximo::Query.
        new('ListCategories').
        locale(locale).
        catalog(catalog).
        vehicle_id(vehicle_id).
        category_id(category_id).
        ssd(ssd)

      ::Laximo::Respond::VehicleWithListCategories.new(
        @request.call(r1, r2, r3)
      )

    end # vehicle_with_list_categories

    def vehicle_with_list_categories_and_units(
      vehicle_id:,
      catalog:,
      ssd:,
      category_id:    -1,
      localized:      true,
      locale:         ::Laximo.options.locale
    )

      # Информация о каталоге
      r1 = ::Laximo::Query.
        new('GetCatalogInfo').
        locale(locale).
        catalog(catalog).
        ssd(ssd)

      # Информация по конкретному автомобилю (модификации)
      r2 = ::Laximo::Query.
        new('GetVehicleInfo').
        locale(locale).
        catalog(catalog).
        vehicle_id(vehicle_id).
        ssd(ssd).
        localized(localized)

      # Список категорий каталога
      r3 = ::Laximo::Query.
        new('ListCategories').
        locale(locale).
        catalog(catalog).
        vehicle_id(vehicle_id).
        category_id(category_id).
        ssd(ssd)

      # Список агрегатов автомобиля.
      r4 = ::Laximo::Query.
        new('ListUnits').
        locale(locale).
        catalog(catalog).
        vehicle_id(vehicle_id).
        category_id(category_id).
        ssd(ssd).
        localized(localized)

      ::Laximo::Respond::VehicleWithListCategoriesAndUnits.new(
        @request.call(r1, r2, r3, r4)
      )

    end # vehicle_with_list_categories_and_units

    def vehicle_with_list_quick_groups(
      vehicle_id:,
      catalog:,
      ssd:,
      localized: true,
      locale:    ::Laximo.options.locale
    )

      # Информация о каталоге
      r1 = ::Laximo::Query.
        new('GetCatalogInfo').
        locale(locale).
        catalog(catalog).
        ssd(ssd)

      # Информация по конкретному автомобилю (модификации)
      r2 = ::Laximo::Query.
        new('GetVehicleInfo').
        locale(locale).
        catalog(catalog).
        vehicle_id(vehicle_id).
        ssd(ssd).
        localized(localized)

      # Список групп быстрого поиска деталей
      r3 = ::Laximo::Query.
        new('ListQuickGroup').
        locale(locale).
        catalog(catalog).
        vehicle_id(vehicle_id).
        ssd(ssd)

      ::Laximo::Respond::VehicleWithListQuickGroups.new(
        @request.call(r1, r2, r3)
      )

    end

    def vehicle_with_list_quick_detail(
      vehicle_id:,
      catalog:,
      ssd:,
      quick_group_id:,
      all:              1,
      localized:        true,
      locale:           ::Laximo.options.locale
    )

      # Информация о каталоге
      r1 = ::Laximo::Query.
        new('GetCatalogInfo').
        locale(locale).
        catalog(catalog).
        ssd(ssd)

      # Информация по конкретному автомобилю (модификации)
      r2 = ::Laximo::Query.
        new('GetVehicleInfo').
        locale(locale).
        catalog(catalog).
        vehicle_id(vehicle_id).
        ssd(ssd).
        localized(localized)

      # Список групп быстрого поиска деталей
      r3 = ::Laximo::Query.
        new('ListQuickDetail').
        locale(locale).
        catalog(catalog).
        vehicle_id(vehicle_id).
        quick_group_id(quick_group_id).
        all(all).
        ssd(ssd)

      ::Laximo::Respond::VehicleWithListQuickDetail.new(
        @request.call(r1, r2, r3)
      )

    end

    def vehicle_with_list_details_by_unit(
      vehicle_id:,
      catalog:,
      ssd:,
      unit_id:,
      localized: true,
      locale:    ::Laximo.options.locale
    )

      r1 = ::Laximo::Query.
        new('GetUnitInfo').
        locale(locale).
        catalog(catalog).
        ssd(ssd).
        unit_id(unit_id).
        localized(localized)

      r2 = ::Laximo::Query.
        new('ListDetailByUnit').
        locale(locale).
        catalog(catalog).
        ssd(ssd).
        unit_id(unit_id).
        localized(localized)

      r3 = ::Laximo::Query.
        new('ListImageMapByUnit').
        catalog(catalog).
        ssd(ssd).
        unit_id(unit_id)

      r4 = ::Laximo::Query.
        new('GetCatalogInfo').
        locale(locale).
        catalog(catalog).
        ssd(ssd)

      r5 = ::Laximo::Query.
        new('GetVehicleInfo').
        locale(locale).
        catalog(catalog).
        vehicle_id(vehicle_id).
        ssd(ssd).
        localized(localized)

      ::Laximo::Respond::VehicleWithListDetailsByUnit.new(
        @request.call(r1, r2, r3, r4, r5)
      )

    end

  end # Oem

end # Laximo
