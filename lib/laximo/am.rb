 # encoding: utf-8
module Laximo

  class Am

    def initialize

      @request = ::Laximo::Request.new(
        ::Laximo.options.am_soap_endpoint,
        ::Laximo.options.am_soap_action
      )
      reset

    end # initialize

    def reset

      locale('ru_RU')
      options
      brand
      self

    end # clean

    def locale(loc = nil)

      @locale = loc.blank? ? '' : ":Locale=#{loc}"
      self

    end # locale

    def options(*args)

      @options = args.empty? ? '' : "|Options=#{args.join(',')}"
      self

    end # options

    def brand(str = nil)

      @brand = str.blank? ? '' : "|Brand=#{str}"
      self

    end # brand

    def find_oem(*args)

      return error_empty_params  if args.empty?

      resp = @request.call(

        construct_command(
          "FindOEM#{@locale}#{@brand}|OEM=%{str}#{@options}",
          *args
        )

      )

      ::Laximo::Respond::FindOem.new(resp)

    end # find_oem

    def find_replacements(*args)

      return error_empty_params  if args.empty?

      resp = @request.call(

        construct_command(
          "FindReplacements#{@locale}|DetailId=%{str}",
          *args
        )

      )

      ::Laximo::Respond::FindReplacements.new(resp)

    end # find_replacements

    def find_detail(*args)

      return error_empty_params  if args.empty?

      resp = @request.call(

        construct_command(
          "FindDetail#{@locale}|DetailId=%{str}#{@options}",
          *args
        )

      )

      ::Laximo::Respond::FindDetail.new(resp)

    end # find_detail

    def find_oem_correction(*args)

      return error_empty_params  if args.empty?

      resp = @request.call(

        construct_command(
          "FindOEMCorrection#{@locale}#{@brand}|OEM=%{str}",
          *args
        )

      )

      ::Laximo::Respond::FindOemCorrection.new(resp)

    end # find_oem_correction

    def manufacturer_info(*args)

      return error_empty_params  if args.empty?

      resp = @request.call(

        construct_command(
          "ManufacturerInfo#{@locale}|ManufacturerId=%{str}",
          *args
        )

      )

      ::Laximo::Respond::Manufacturer_Info.new(resp)

    end # manufacturer_info

    def list_manufacturer

      resp = @request.call(
        "ListManufacturer#{@locale}"
      )

      ::Laximo::Respond::ListManufacturer.new(resp)

    end # list_manufacturer

    private

    def construct_command(command, args)

      agrs.inject([]) { |arr, el|
        arr << (command % { str: el })
      }.join('\n')

    end # construct_command

    def error_empty_params

      ::Laximo::Respond.new(
        ::ArgumentError.new('Не заданный параметры запроса')
      )

    end # error_empty_params

  end # Am

end # Laximo
