module External
  module V1
    class Test < Grape::API
      version "v1"

      get :test do
        {
          version: 'V2',
          response: 'Hakuna'
        }
      end
    end
  end
end