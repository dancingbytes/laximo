 # encoding: utf-8
module Laximo

  class Query

    def initialize(func_name)

      @func_name  = func_name
      @query      = {}

    end

    def locale(v = nil)
      add_param(:Locale, v)
    end

    def ssd(v = nil)
      add_param(:ssd, v)
    end

    def catalog(v = nil)
      add_param(:Catalog, v)
    end

    def operation(v = nil)
      add_param(:operation, v)
    end

    def param(h = {})

      h.each { |k, v|
        add_param(k, v)
      }
      self

    end

    def localized(v = false)
      add_param(:Localized, (v === true))
    end

    def wizard_id(v = nil)
      add_param(:WizardId, v)
    end

    def value_id(v = nil)
      add_param(:ValueId, v)
    end

    def options(v = [])
      add_param(:Options, v)
    end

    def brand(v = nil)
      add_param(:Brand, v)
    end

    def oem(v = nil)
      add_param(:OEM, v)
    end

    def detail_id(v = nil)
      add_param(:DetailId, v)
    end

    def manufacturer_id(v = nil)
      add_param(:ManufacturerId, v)
    end

    def vin(v = nil)
      add_param(:VIN, v)
    end

    def frame(v = nil)
      add_param(:Frame, v)
    end

    def frame_no(v = nil)
      add_param(:FrameNo, v)
    end

    def ident_string(v = nil)
      add_param(:IdentString, v)
    end

    def vehicle_id(v = nil)
      add_param(:VehicleId, v)
    end

    def category_id(v = nil)
      add_param(:CategoryId, v)
    end

    def unit_id(v = nil)
      add_param(:UnitId, v)
    end

    def filter(v = nil)
      add_param(:Filter, v)
    end

    def quick_group_id(v = nil)
      add_param(:QuickGroupId, v)
    end

    def all(v = nil)

      add_param(
        :QuickGroupId,
        (v === true || v == 1 || v == '1' ? 1 : 0)
      )

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

    def add_param(k, v)

      if v.is_a?(::Array)
        @query[k] = v.empty? ? nil : v.join(',')
      else
        @query[k] = v.nil? ? nil : String(v)
      end

      @str = nil
      self

    end

  end # Query

end # Laximo
