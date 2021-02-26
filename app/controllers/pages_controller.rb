class PagesController < ApplicationController
  def home
    @request = request
    @headers = @request.headers.env.filter { |key| key.to_s.start_with?("HTTP") }

    params_hash = params.permit!.to_unsafe_hash
    if @request.method != "GET"
      json_response = {
        full_url: @request.original_url,
        ip: @request.ip,
        method: @request.method,
        path: @request.path,
        query: @request.query_parameters,
        headers: @headers,
        body: @request.body.read,
        cookies: @request.cookie_jar,
        params: params_hash
      }
      render json: json_response
    end
  end
end
