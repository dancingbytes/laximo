# laximo — ruby-библиотека для web-сервисов [Laximo](http://laximo.net)

### Поддержка web-сервисов:
  * [Laximo.Aftermarket](http://laximo.net/index.php/%D0%A1%D0%BB%D1%83%D0%B6%D0%B5%D0%B1%D0%BD%D0%B0%D1%8F:%D0%9C%D0%BE%D0%B9_%D1%8F%D0%B7%D1%8B%D0%BA/:Laximo_Web-services:AM:Laximo.Aftermarket)
  * [Laximo.OЕМ](http://laximo.net/index.php/%D0%A1%D0%BB%D1%83%D0%B6%D0%B5%D0%B1%D0%BD%D0%B0%D1%8F:%D0%9C%D0%BE%D0%B9_%D1%8F%D0%B7%D1%8B%D0%BA/:Laximo_Web-services:OEM:Laximo.OEM) (в разработке)

### Поддерживаемые версии Ruby
Ruby 1.9.3+

### Установка (Rails)
1. Добавляем в Gemfile строку:`gem 'laxima'`  
2. В консоле `bundle install`
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
 
### Примеры использования  
  ```ruby
  res = Laximo.am.find_oem('078100105NX', options: [:crosses, :images])
  res.success? # true
  res.error?   # false
  res.error    # nil
  res.result   # [{:detailid=>"31454425", :formattedoem=>"078100105NX", :manufacturer=>"SEAT", ...]
  ```
  
  
