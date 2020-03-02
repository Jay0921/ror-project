GrapeSwaggerRails.options.url = '/api/external/swagger_doc'
# To-do: Only developer can see this
GrapeSwaggerRails.options.before_action do
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port

  unless can?(:read, :swagger)
    redirect_to Rails.application.routes.url_helpers.root_path, notice: 'Not authorized.'
  end
end