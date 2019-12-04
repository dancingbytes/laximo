# laximo — ruby-библиотека для web-сервисов [Laximo](http://laximo.net)

### Поддержка web-сервисов:
  * [Laximo.Aftermarket](http://laximo.net/index.php/%D0%A1%D0%BB%D1%83%D0%B6%D0%B5%D0%B1%D0%BD%D0%B0%D1%8F:%D0%9C%D0%BE%D0%B9_%D1%8F%D0%B7%D1%8B%D0%BA/:Laximo_Web-services:AM:Laximo.Aftermarket)
  * [Laximo.OЕМ](http://laximo.net/index.php/%D0%A1%D0%BB%D1%83%D0%B6%D0%B5%D0%B1%D0%BD%D0%B0%D1%8F:%D0%9C%D0%BE%D0%B9_%D1%8F%D0%B7%D1%8B%D0%BA/:Laximo_Web-services:OEM:Laximo.OEM)

### Поддерживаемые версии Ruby
Ruby 2.0+

### Установка (Rails)
1. Добавляем в Gemfile строку `gem 'laximo'`
2. В консоле `bundle install`
3. Задаем параметры конфигурации в файле `config/initializers/laximo.rb`:
```ruby
Laximo.options.login              'mylogin'    # имейте в виду, что такие параметры
Laximo.options.password           'mypassword' # должны быть вынесены в переменные окружения

Laximo.options.timeout            10
Laximo.options.debug              false
Laximo.options.locale             'ru_RU'
```

### Конфигурация
  * `Laximo.options.login` - логин для авторизации по подписке
  * `Laximo.options.password` - пароль для авторизации по подписке
  * `Laximo.options.timeout 30` - таймаут соединения в секундах (по-умочланию, 10)
  * `Laximo.options.user_agent "Ваш_юзер_агент"` - задание произвольного юзер-агента (по-умолчанию, "LaximoRuby [версия_библиотеки]")
  * `Laximo.options.locale` - локаль (по-умолчанию, 'ru_RU')
  * `Laximo.options.debug true/false` - включение/отключение режима отладки (по-умолчанию, выключено)
  * `Laximo.options.am_soap_action 'url'` - soap action для web-сервиса [Laximo.Aftermarket](http://laximo.net/index.php/Laximo_Web-services:AM:Laximo.Aftermarket) (по-умолчанию, `http://Aftermarket.Kito.ec`)
  * `Laximo.options.am_soap_endpoint 'url'` - soap endpoint для web-сервиса [Laximo.Aftermarket](http://laximo.net/index.php/Laximo_Web-services:AM:Laximo.Aftermarket) (по-умолчанию, `https://aws.laximo.net/ec.Kito.Aftermarket/services/Catalog.CatalogHttpSoap12Endpoint/`
  * `Laximo.options.oem_soap_action 'url'` - soap action для web-сервиса [Laximo.OEM](http://laximo.net/index.php/Laximo_Web-services:OEM:Laximo.OEM) (по-умолчанию, `http://WebCatalog.Kito.ec`)
  * `Laximo.options.oem_soap_endpoint 'url'` - soap endpoint для web-сервиса [Laximo.OEM](http://laximo.net/index.php/Laximo_Web-services:OEM:Laximo.OEM) (по-умолчанию, `https://ws.laximo.net/ec.Kito.WebCatalog/services/Catalog.CatalogHttpSoap12Endpoint/`)

### Методы web-сервиса [Laximo.Aftermarket](https://laximo.ru/am/)
  * [Laximo.am.find_oem(oem, brand: nil, options: [], locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:AM:FindOEM)
  * [Laximo.am.find_replacements(detail_id, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:AM:FindReplacements)
  * [Laximo.am.find_detail(detail_id, options: [], locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:AM:FindDetail)
  * [Laximo.am.find_oem_correction(oem, brand: nil, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:AM:FindOEMCorrection)
  * [Laximo.am.manufacturer_info(manufacturer_id, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:AM:ManufacturerInfo)
  * [Laximo.am.list_manufacturer(locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:AM/ListManufacturer)

Данные методы возвращают объект, у которого заданы методы:

  * `success?` - успешна ли операция
  * `error?` - есть ли ошибка
  * `error` - возвращает ошибку или `nil`, если ошибки не было
  * `result` - возвращает массив хешей или пустой массив, если ничего не найдено, или если в процессе выполения произошла ошибка.

### Методы web-сервиса [Laximo.OEM](https://laximo.ru/oem/)
  * [Laximo.oem.list_catalogs(ssd: nil, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:ListCatalogs)
  * [Laximo.oem.get_catalog_info(catalog:, ssd: nil, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:GetCatalogInfo)
  * [Laximo.oem.find_vehicle_by_vin(vin:, catalog: nil, localized: true, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:FindVehicleByVIN)
  * [Laximo.oem.find_vehicle_by_frame(frame:, frame_no:, catalog: nil, localized: true, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:FindVehicleByFrame)
  * [Laximo.oem.find_vehicle_by_frame_no(frame_no:, catalog: nil, localized: true, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:FindVehicleByFrameNo)
  * [Laximo.oem.find_vehicle(ident_string:, catalog: nil, localized: true, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:FindVehicle)
  * [Laximo.oem.get_wizard2(catalog:, ssd: nil, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:GetWizard2)
  * [Laximo.oem.get_wizard_next_step2(catalog:, ssd: nil, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:GetWizardNextStep2)
  * [Laximo.oem.find_vehicle_by_wizard2(catalog:, ssd:, localized: true, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:FindVehicleByWizard2)
  * [Laximo.oem.get_vehicle_info(catalog:, vehicle_id:, ssd:, localized: true, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:GetVehicleInfo)
  * [Laximo.oem.exec_custom_operation(catalog:, operation:, param:, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:ExecCustomOperation)
  * [Laximo.oem.list_units(catalog:, vehicle_id:, ssd:, category_id: -1, localized: true, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:ListUnits)
  * [Laximo.oem.list_categories(catalog:, vehicle_id:, ssd:, category_id: -10, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:ListCategories)
  * [Laximo.oem.get_filter_by_unit(catalog:, unit_id:, vehicle_id:, filter:, ssd:, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:GetFilterByUnit)
  * [Laximo.oem.get_unit_info(catalog:, unit_id:, ssd:, localized: true, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:GetUnitInfo)
  * [Laximo.oem.list_detail_by_unit(catalog:, unit_id:, ssd:, localized: true, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:ListDetailByUnit)
  * [Laximo.oem.list_image_map_by_unit(catalog:, unit_id:, ssd:)](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:ListImageMapByUnit)
  * [Laximo.oem.get_filter_by_detail(catalog:, unit_id:, detail_id:, filter:, ssd:, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:GetFilterByDetail)
  * [Laximo.oem.list_quick_group(catalog:, vehicle_id, ssd:, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:ListQuickGroup)
  * [Laximo.oem.list_quick_detail(catalog:, vehicle_id:, quick_group_id:, ssd:, all: 1, localized: true, locale: 'ru_RU')](http://wiki.technologytrade.ru/index.php/Laximo_Web-services:OEM:ListQuickDetail)

### Комбинированные методы web-сервиса [wsdemo.laximo](https://wsdemo.laximo.ru/)
  * [Laximo.oem.vehicle_with_list_categories(vehicle_id:, catalog:, ssd:, category_id: -1,localized: true, locale: 'ru_RU')](https://wsdemo.laximo.ru/index.php?task=qgroups&oem=&useApplicability=1&c=CFIAT84&vid=5182&ssd=$*KwHZ7fzGvYurq5yGiNj16YGVtbKs2tne3czfwZ-1joOPqt69zN_IipmehZi1g4Dy5uaq2dze29rd34KIldrY296ViYKD3cnSq97d3pWOjJbt08a0h4KCn4Kt3YvCxJmDm4mruZOK3NvJhY-ygoSq3NuKipHc2pOFj6rckd_Tzp-Crd3ZlICZwfyR3trc2d7a3d6CjJCVnIiEgomBiu3Sz6va2t3Z0tjai8LZjoufrNna3dYAAAAAeCpr2w$)
  * [Laximo.oem.vehicle_with_list_quick_groups(vehicle_id:, catalog:, ssd:, localized: true, locale: 'ru_RU')](https://wsdemo.laximo.ru/index.php?task=vehicle&c=CFIAT84&vid=5182&ssd=$*KwGFsaCa4df398Da1ISptd3J6e7whoWCgZCDncPp0t_T9oLhkIOU1sXC2cTp39yuurr2hYCCh4aBg97UyYaEh4LJ1d7fgZWO94KBgsnS0Mqxj5ro297ew97xgdeemMXfx9X35c_WgIeV2dPu3tj2gIfW1s2Ahs_Z0_aAzYOPksPe8YGFyNzFnaDNgoaAhYKGgYLe0MzJwNTY3tXd1rGOk_eGhoGFjoSG156F0tfD8IWGgYoAAAAAbHr5DQ$)
  * [Laximo.oem.vehicle_with_list_quick_detail(vehicle_id:, catalog:, ssd:, quick_group_id:, all: 1, localized: true, locale: 'ru_RU')](https://wsdemo.laximo.ru/index.php?task=qgroups&c=CFIAT84&vid=5182&ssd=$*KwEbLz4Ef0lpaV5ESho3K0NXd3BuGBscHw4dA113TEFNaBx_Dh0KSFtcR1p3QUIwJCRoGx4cGRgfHUBKVxgaGRxXS0BBHwsQaRwfHFdMTlQvEQR2RUBAXUBvH0kABltBWUtpe1FIHhkLR01wQEZoHhlISFMeGFFHTWgeUx0RDF1Abx8bVkJbAz5THBgeGxwYHxxATlJXXkpGQEtDSC8QDWkYGB8bEBoYSQAbTEldbhsYHxQAAAAAnyRrTQ$&gid=2)
  * [Laximo.oem.vehicle_with_list_details_by_unit(vehicle_id:, catalog:, ssd:, unit_id:,localized: true, locale: 'ru_RU')](https://wsdemo.laximo.ru/index.php?task=unit&c=CFIAT84&vid=5182&uid=38255&gid=2&cid=10301&ssd=$*KwEBNSQeZVNzc0ReUAAtMVlNbWp0AgEGBRQHGUdtVltXcgZlFAcQUkFGXUBtW1gqPj5yAQQGAwIFB1pQTQIAAwZNUVleCQwdcwJLV1xeWkIYJEwDAEtQUktqWAw7FVxcQVxzAAxJDhYRRVd1Z01XW1ADCh1sXFp0AgYNAVtTSE1VR0RsUVpTKlVIAExcUHMDS1oFCgxbcgQGTV9DRCpVTQMDAAEDAgQHWlQGQVdDXUBbWlkPJEhNQVJGQ21WWA4kSU1BUkdsUVpTKlQGR1NXWFZxWlMPJEkDAQUFHAIFSR8KEUd7UXQACgcCXxoOUkBcVV1GUHdZGg5WWlxXX1dqWQUkSAQDBwwGBwxJEwEZQXIHBAMLAAAAAGAPcDM$&coi=2&fromTask=qdetails)

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
res = Laximo.oem.get_filter_by_detail(catalog: 'AP1211', unit_id: '', detail_id: '', filter: '')
res.success? # false
res.error?   # true
res.error    # <Laximo::SoapInvalidParameterError: UnitId>
res.result   # []
```

Помимо перечисленного списка ошибок, в ответе могут быть возвращены стандартные ошибки библиотеки `Net::HTTP` и интерпретатора Ruby.

### Лицензия

Автор: [Tyralion](mailto:piliaiev@gmail.com)

[Список контрибьюторов](https://github.com/dancingbytes/laximo/graphs/contributors)

Copyright (c) 2015-2019 DansingBytes.ru, под лицензией BSD
