module Json
  def parse(data)
    JSON.parse(data, symbolize_names: true)
  end
end
