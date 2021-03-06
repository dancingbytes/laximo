 # encoding: utf-8
module Laximo

  class Am

    DEFAULT_OPTIONS = [
      :crosses,
      :properties,
      :names,
      :weights,
      :prices,
      :images
    ].freeze

    def initialize

      @request = ::Laximo::Request.new(
        ::Laximo.options.am_soap_endpoint,
        ::Laximo.options.am_soap_action
      )

    end # initialize

    def find_oem(
      oem,
      brand:    nil,
      options:  DEFAULT_OPTIONS,
      locale:   ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('FindOEM').
        locale(locale).
        brand(brand).
        oem(oem).
        options(options).
        call(@request)

      ::Laximo::Respond::FindOem.new(resp)

    end # find_oem

    def find_replacements(
      detail_id,
      locale: ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('FindReplacements').
        locale(locale).
        detail_id(detail_id).
        call(@request)

      ::Laximo::Respond::FindReplacements.new(resp)

    end # find_replacements

    def find_detail(
      detail_id,
      options:  DEFAULT_OPTIONS,
      locale:   ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('FindDetail').
        locale(locale).
        detail_id(detail_id).
        options(options).
        call(@request)

      ::Laximo::Respond::FindDetail.new(resp)

    end # find_detail

    def find_oem_correction(
      oem,
      brand:    nil,
      locale:   ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('FindOEMCorrection').
        locale(locale).
        brand(brand).
        oem(oem).
        call(@request)

      ::Laximo::Respond::FindOemCorrection.new(resp)

    end # find_oem_correction

    def manufacturer_info(
      manufacturer_id,
      locale: ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('ManufacturerInfo').
        locale(locale).
        manufacturer_id(manufacturer_id).
        call(@request)

      ::Laximo::Respond::Manufacturer_Info.new(resp)

    end # manufacturer_info

    def list_manufacturer(
      locale: ::Laximo.options.locale
    )

      resp = ::Laximo::Query.
        new('ListManufacturer').
        locale(locale).
        call(@request)

      ::Laximo::Respond::ListManufacturer.new(resp)

    end # list_manufacturer

  end # Am

end # Laximo
