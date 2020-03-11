module External
  class API < Grape::API
    prefix 'api/external'

    format :json
    default_format :json
    content_type :json, 'application/json; charset=utf-8'

    default_error_formatter :json

    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
    end

    mount V1::Test
    mount V2::Test

    add_swagger_documentation format: :json
  end
end
