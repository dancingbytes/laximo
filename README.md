# laximo — ruby-библиотека для web-сервисов [Laximo](http://laximo.net)

### Поддержка web-сервисов:
  * [Laximo.Aftermarket](http://laximo.net/index.php/%D0%A1%D0%BB%D1%83%D0%B6%D0%B5%D0%B1%D0%BD%D0%B0%D1%8F:%D0%9C%D0%BE%D0%B9_%D1%8F%D0%B7%D1%8B%D0%BA/:Laximo_Web-services:AM:Laximo.Aftermarket)
  * [Laximo.OЕМ](http://laximo.net/index.php/%D0%A1%D0%BB%D1%83%D0%B6%D0%B5%D0%B1%D0%BD%D0%B0%D1%8F:%D0%9C%D0%BE%D0%B9_%D1%8F%D0%B7%D1%8B%D0%BA/:Laximo_Web-services:OEM:Laximo.OEM)

### Поддерживаемые версии Ruby
Ruby 1.9.3+

### Установка (Rails)
1. Добавляем в Gemfile строку:`gem 'laximo'`
2. В консоли `bundle install`
3. Задаем параметры конфигурации в файле `config/initializers/laximo.rb`:
```ruby
Laximo.options.use_ssl            true
Laximo.options.ssl_key            ::File.join(Rails.root, 'db', 'ssl', 'client.key')
Laximo.options.ssl_cert           ::File.join(Rails.root, 'db', 'ssl', 'client.pem')
Laximo.options.ssl_verify         false

Laximo.options.timeout            10
Laximo.options.debug              false
```

### Конфигурация
  * `Laximo.options.ssl_key "путь_к_файлу"` — путь к открытому ключу ssl-сертификата
  * `Laximo.options.ssl_cert "путь_к_файлу"` — путь к закрытому ключу ssl-сертификата
  * `Laximo.options.ssl_cert true/false` — проверять или нет валидность сертификата. **В случае самоподписанного сертификата, проверку на валидность необходимо отключить**
  * `Laximo.options.use_ssl true/false` - использовать ssl-соединение или нет
  * `Laximo.options.timeout 30` - таймаут соединения в секундах (по-умочланию, 10)
  * `Laximo.options.user_agent "Ваш_юзер_агент"` - задание произвольного юзер-агента (по-умолчанию, "LaximoRuby [версия_библиотеки]")
  * `Laximo.options.debug true/false` - включение/отключение режима отладки (по-умолчанию, выключено)
  * `Laximo.options.am_soap_action 'url'` - soap action для web-сервиса [Laximo.Aftermarket](http://laximo.net/index.php/Laximo_Web-services:AM:Laximo.Aftermarket) (по-умолчанию, `http://Aftermarket.Kito.ec`)
  * `Laximo.options.am_soap_endpoint 'url'` - soap endpoint для web-сервиса [Laximo.Aftermarket](http://laximo.net/index.php/Laximo_Web-services:AM:Laximo.Aftermarket) (по-умолчанию, `https://aws.laximo.net/ec.Kito.Aftermarket/services/Catalog.CatalogHttpSoap12Endpoint/`
  * `Laximo.options.oem_soap_action 'url'` - soap action для web-сервиса [Laximo.OEM](http://laximo.net/index.php/Laximo_Web-services:OEM:Laximo.OEM) (по-умолчанию, `http://WebCatalog.Kito.ec`)
  * `Laximo.options.oem_soap_endpoint 'url'` - soap endpoint для web-сервиса [Laximo.OEM](http://laximo.net/index.php/Laximo_Web-services:OEM:Laximo.OEM) (по-умолчанию, `https://ws.laximo.net/ec.Kito.WebCatalog/services/Catalog.CatalogHttpSoap12Endpoint/`)

### Методы web-сервиса [Laximo.Aftermarket](http://laximo.net/index.php/Laximo_Web-services:AM:Laximo.Aftermarket)
  * [Laximo.am.find_oem(oem, brand: nil, options: [], locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:AM:FindOEM)
  * [Laximo.am.find_replacements(detail_id, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:AM:FindReplacements)
  * [Laximo.am.find_detail(detail_id, options: [], locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:AM:FindDetail)
  * [Laximo.am.find_oem_correction(oem, brand: nil, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:AM:FindOEMCorrection)
  * [Laximo.am.manufacturer_info(manufacturer_id, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:AM:ManufacturerInfo)
  * [Laximo.am.list_manufacturer(locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:AM/ListManufacturer)

Данные методы возвращают объект, у которого заданы методы:

  * `success?` - успешна ли операция
  * `error?` - есть ли ошибка
  * `error` - возвращает ошибку или `nil`, если ошибки не было
  * `result` - возвращает массив хешей или пустой массив, если ничего не найдено, или если в процессе выполения произошла ошибка.

### Методы web-сервиса [Laximo.OEM](http://laximo.net/index.php/Laximo_Web-services:OEM:Laximo.OEM)
  * [Laximo.oem.list_catalogs(ssd = nil, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:OEM:ListCatalogs)
  * [Laximo.oem.get_catalog_info(catalog, ssd: nil, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:OEM:GetCatalogInfo)
  * [Laximo.oem.find_vehicle_by_vin(vin, catalog: nil, ssd: nil, localized: false, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:OEM:FindVehicleByVIN)
  * [Laximo.oem.find_vehicle_by_frame(catalog, frame, frame_no, ssd: nil, localized: false, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:OEM:FindVehicleByFrame)
  * [Laximo.oem.get_wizard(catalog, wizard_id: nil, value_id: nil, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:OEM:GetWizard)
  * [Laximo.oem.get_wizard2(catalog, ssd, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:OEM:GetWizard2)
  * [Laximo.oem.get_wizard_next_step2(catalog, ssd, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:OEM:GetWizardNextStep2)
  * [Laximo.oem.find_vehicle_by_wizard(catalog, wizard_id, ssd: nil, localized: false, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:OEM:FindVehicleByWizard)
  * [Laximo.oem.find_vehicle_by_wizard2(catalog, ssd, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:OEM:FindVehicleByWizard2)
  * [Laximo.oem.get_vehicle_info(catalog, vehicle_id, ssd, localized: false, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:OEM:GetVehicleInfo)
  * [Laximo.oem.exec_custom_operation(catalog, operation, param, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:OEM:ExecCustomOperation)
  * [Laximo.oem.list_units(catalog, vehicle_id, ssd, category_id: nil, localized: false, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:OEM:ListUnits)
  * [Laximo.oem.list_categories(catalog, vehicle_id, ssd, category_id: nil, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:OEM:ListCategories)
  * [Laximo.oem.get_filter_by_unit(catalog, unit_id, vehicle_id, filter, ssd, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:OEM:GetFilterByUnit)
  * [Laximo.oem.get_unit_info(catalog, ssd, unit_id, localized: false, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:OEM:GetUnitInfo)
  * [Laximo.oem.list_detail_by_unit(catalog, ssd, unit_id, localized: false, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:OEM:ListDetailByUnit)
  * [Laximo.oem.list_image_map_by_unit(catalog, ssd, unit_id)](http://laximo.net/index.php/Laximo_Web-services:OEM:ListImageMapByUnit)
  * [Laximo.oem.get_filter_by_detail(catalog, unit_id, detail_id, filter, ssd, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:OEM:GetFilterByDetail)
  * [Laximo.oem.list_quick_group(catalog, vehicle_id, ssd: nil, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:OEM:ListQuickGroup)
  * [Laximo.oem.list_quick_detail(catalog, vehicle_id, quick_group_id, all, ssd: nil, localized: false, locale: 'ru_RU')](http://laximo.net/index.php/Laximo_Web-services:OEM:ListQuickDetail)

Данные методы возвращают объект, у которого заданы методы:

  * `success?` - успешна ли операция
  * `error?` - есть ли ошибка
  * `error` - возвращает ошибку или `nil`, если ошибки не было
  * `result` - возвращает массив хешей или пустой массив, если ничего не найдено, или если в процессе выполения произошла ошибка.

### Примеры использования
```ruby
res = Laximo.am.find_oem('078100105NX', options: [:crosses, :images])
res.success? # true
res.error?   # false
res.error    # nil
res.result   # [{:detailid=>"31454425", :formattedoem=>"078100105NX", :manufacturer=>"SEAT", ...]
```

### Ошибки
После вызова одного из методов апи, может быть возвращены разного рода ошибки.
  * `Laximo::SslCertificateError` - ваш ssl-сертификат не найден или недействителен
  * `Laximo::SoapInvalidParameterError` - неверное значение параметра в запросе к web-сервису
  * `Laximo::SoapCatalogNotExistsError` - каталог не зарегистрирован в системе
  * `Laximo::SoapInvalidRequestError` - не верно сформирован запрос к web-сервису
  * `Laximo::SoapUnknownCommandError` - команда не известна
  * `Laximo::SoapAccessDeniedError` - доступ запрещен
  * `Laximo::SoapNotSupportedError` - функция не поддерживается каталогом
  * `SoapGroupIsNotSearchableError` - поиск по группе запрещён, в связи с слишком большим количеством входящих в группу узлов
  * `Laximo::SoapError` - общая ошибка протокола SOAP

```ruby
res = Laximo.oem.get_filter_by_detail('AP1211', '', '', '', '')
res.success? # false
res.error?   # true
res.error    # <Laximo::SoapInvalidParameterError: UnitId>
res.result   # []
```

Помимо переисленного списка ошибок, в ответе могут быть возвращены стандартные ошибки библиотеки `Net::HTTP` и интерпретатора Ruby.

### Лицензия

Автор: [Tyralion](mailto:piliaiev@gmail.com)

Copyright (c) 2015 DansingBytes.ru, под лицензией BSD
