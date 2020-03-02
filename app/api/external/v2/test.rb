module External
  module V2
    class Test < Grape::API
      version "v2"

      get :test do
        {
          version: 'V2',
          response: 'Matata'
        }
      end
    end
  end
end