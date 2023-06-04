json_data = {}

@issues_open.keys.each do |date|
  json_data[date] = {
    "open" => @issues_open[date],
    "created" => @issues_created[date],
    "done_closed" => @issues_done_closed[date]
  }
end

json.statistics json_data
