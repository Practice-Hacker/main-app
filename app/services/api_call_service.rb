class ApiCallService
  def parsed_search(query, offset = 0)
    JSON.parse(get_search(query, offset).body, symbolize_names: true)
  end

  def get_by_work_id(api_work_id)
    JSON.parse(get_piece(api_work_id).body, symbolize_names: true)
  end

  private

  def get_piece(api_work_id)
    conn.get("piece/#{api_work_id}")
  end

  def get_search(query, offset = 0)
    conn.get('search') do |f|
      f.params[:q] = query
      f.params[:offset] = offset
    end
  end

  def conn
    Faraday.new(ENV['API_SINATRA_URL'])
  end
end
