 # encoding: utf-8
module Laximo

  class Query

    def initialize(func_name)

      @func_name  = func_name
      @query      = {}

    end

    def locale(v = nil)

      @str    = nil
      @query[:Locale] = escape(v)
      self

    end

    def ssd(v = nil)

      @str          = nil
      @query[:ssd]  = escape(v)
      self

    end

    def catalog(v = nil)

      @str              = nil
      @query[:Catalog]  = escape(v)
      self

    end

    def operation(v = nil)

      @str                = nil
      @query[:operation]  = escape(v)
      self

    end

    def param(v = nil)

      @str  = nil
      if v.is_a?(Hash) && !v.empty?
        @query[v.keys.first] = escape(v.values.first)
      end
      self

    end

    def localized(v = false)

      @str                = nil
      @query[:Localized]  = (v === true)
      self

    end

    def wizard_id(v = nil)

      @str              = nil
      @query[:WizardId] = escape(v)
      self

    end

    def value_id(v = nil)

      @str              = nil
      @query[:ValueId]  = escape(v)
      self

    end

    def options(args = [])

      @str              = nil
      @query[:Options]  = args.empty? ? nil : args.join(',')
      self

    end

    def brand(v = nil)

      @str            = nil
      @query[:Brand]  = escape(v)
      self

    end

    def oem(v = nil)

      @str          = nil
      @query[:OEM]  = escape(v)
      self

    end

    def detail_id(v = nil)

      @str              = nil
      @query[:DetailId] = escape(v)
      self

    end

    def manufacturer_id(v = nil)

      @str                    = nil
      @query[:ManufacturerId] = escape(v)
      self

    end

    def vin(v = nil)

      @str          = nil
      @query[:VIN]  = escape(v)
      self

    end

    def frame(v = nil)

      @str            = nil
      @query[:Frame]  = escape(v)
      self

    end

    def frame_no(v = nil)

      @str              = nil
      @query[:FrameNo]  = escape(v)
      self

    end

    def vehicle_id(v = nil)

      @str                = nil
      @query[:VehicleId]  = escape(v)
      self

    end

    def category_id(v = nil)

      @str                = nil
      @query[:CategoryId] = escape(v)
      self

    end

    def unit_id(v = nil)

      @str              = nil
      @query[:UnitId]   = escape(v)
      self

    end

    def filter(v = nil)

      @str              = nil
      @query[:Filter]   = escape(v)
      self

    end

    def quick_group_id(v = nil)

      @str                  = nil
      @query[:QuickGroupId] = escape(v)
      self

    end

    def all(v = nil)

      @str          = nil
      @query[:All]  = (v === true || v == 1 || v == '1' ? 1 : 0)
      self

    end

    def call(request)
      request.call(self.to_s)
    end

    def to_s

      return @str unless @str.nil?

      @str = ''

      @query.each { |key, value|
        @str << "|#{key}=#{value}"
      }

      @str[0] = ''
      @str = "#{@func_name}:#{@str}"

    end

    alias :to_str :to_s

    private

    def escape(str)
      str.nil? ? nil : String(str)
    end

  end # Query

end # Laximo
