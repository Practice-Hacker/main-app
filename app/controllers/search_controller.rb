class SearchController < ApplicationController
  def index
    conn = Faraday.new(ENV['API_SINATRA_URL'])
    data = conn.get('search') do |f|
      f.params[:q] = params[:q]
    end

    parsed_data = JSON.parse(data.body, symbolize_names: true)
    @pieces = parsed_data[:results].map do |result|
      Piece.new(result)
    end
    binding.pry
  end
end
