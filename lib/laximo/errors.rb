# encoding: utf-8
module Laximo

  class Error < ::StandardError; end

  class SslCertificateError < ::Laximo::Error; end

  class SoapError < ::Laximo::Error; end

  class SoapInvalidParameterError < ::Laximo::Error; end

  class SoapCatalogNotExistsError < ::Laximo::Error; end

  class SoapInvalidRequestError < ::Laximo::Error; end

  class SoapUnknownCommandError < ::Laximo::Error; end

  class SoapAccessDeniedError < ::Laximo::Error; end

  class SoapNotSupportedError < ::Laximo::Error; end

  class SoapGroupIsNotSearchableError < ::Laximo::Error; end

  class SoapTooManyRequestError < ::Laximo::Error; end

  ERRORS = {

    'E_CATALOGNOTEXISTS'        => SoapCatalogNotExistsError,
    'E_INVALIDPARAMETER'        => SoapInvalidParameterError,
    'E_INVALIDREQUEST'          => SoapInvalidRequestError,
    'E_UNKNOWNCOMMAND'          => SoapUnknownCommandError,
    'E_ACCESSDENIED'            => SoapAccessDeniedError,
    'E_NOTSUPPORTED'            => SoapNotSupportedError,
    'E_GROUP_IS_NOT_SEARCHABLE' => SoapGroupIsNotSearchableError,
    'E_TOO_MANY_REQUESTS'       => SoapTooManyRequestError

  }.freeze

end # Laximo
