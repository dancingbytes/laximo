 # encoding: utf-8
module Laximo

  class Query

    def initialize(func_name)

      @func_name  = func_name
      @query      = {}

    end # initialize

    def locale(v = nil)

      @str    = nil
      @query[:Locale] = escape(v)
      self

    end # locale

    def ssd(v = nil)

      @str          = nil
      @query[:ssd]  = escape(v)
      self

    end # ssd

    def catalog(v = nil)

      @str              = nil
      @query[:Catalog]  = escape(v)
      self

    end # catalog

    def operation(v = nil)

      @str                = nil
      @query[:operation]  = escape(v)
      self

    end # operation

    def param(v = nil)

      @str  = nil
      if v.is_a?(Hash) && !v.empty?
        @query[v.keys.first] = escape(v.values.first)
      end
      self

    end # param

    def localized(v = false)

      @str                = nil
      @query[:Localized]  = (v === true)
      self

    end # localized

    def wizard_id(v = nil)

      @str              = nil
      @query[:WizardId] = escape(v)
      self

    end # wizard_id

    def value_id(v = nil)

      @str              = nil
      @query[:ValueId]  = escape(v)
      self

    end # value_id

    def options(args = [])

      @str              = nil
      @query[:Options]  = args.empty? ? nil : args.join(',')
      self

    end # options

    def brand(v = nil)

      @str            = nil
      @query[:Brand]  = escape(v)
      self

    end # brand

    def oem(v = nil)

      @str          = nil
      @query[:OEM]  = escape(v)
      self

    end # oem

    def detail_id(v = nil)

      @str              = nil
      @query[:DetailId] = escape(v)
      self

    end # detail_id

    def manufacturer_id(v = nil)

      @str                    = nil
      @query[:ManufacturerId] = escape(v)
      self

    end # manufacturer_id

    def vin(v = nil)

      @str          = nil
      @query[:VIN]  = escape(v)
      self

    end # vin

    def frame(v = nil)

      @str            = nil
      @query[:Frame]  = escape(v)
      self

    end # frame

    def frame_no(v = nil)

      @str              = nil
      @query[:FrameNo]  = escape(v)
      self

    end # frame_no

    def vehicle_id(v = nil)

      @str                = nil
      @query[:VehicleId]  = escape(v)
      self

    end # vehicle_id

    def category_id(v = nil)

      @str                = nil
      @query[:CategoryId] = escape(v)
      self

    end # category_id

    def unit_id(v = nil)

      @str              = nil
      @query[:UnitId]   = escape(v)
      self

    end # unit_id

    def filter(v = nil)

      @str              = nil
      @query[:Filter]   = escape(v)
      self

    end # filter

    def quick_group_id(v = nil)

      @str                  = nil
      @query[:QuickGroupId] = escape(v)
      self

    end # quick_group_id

    def all(v = nil)

      @str          = nil
      @query[:All]  = (v === true || v == 1 || v == '1' ? 1 : 0)
      self

    end # all

    def call(request)
      request.call(self.to_s)
    end # call

    def to_s

      return @str unless @str.nil?

      @str = ''

      @query.each { |key, value|
        @str << "|#{key}=#{value}"
      }

      @str[0] = ''
      @str = "#{@func_name}:#{@str}"

    end # to_s

    alias :to_str :to_s

    private

    def escape(str)
      str.nil? ? nil : String(str)
    end # escape

  end # Query

end # Laximo
