class ApiCallService
  def parsed_search(query)
    JSON.parse(get_search(query).body, symbolize_names: true)
  end

  private

  def get_search(query)
    conn.get('search') do |f|
      f.params[:q] = query
    end
  end

  def conn
    Faraday.new(ENV['API_SINATRA_URL'])
  end
end
