json.extract! day_off_request, :id, :reason, :day_off_date, :created_at, :updated_at
json.url day_off_request_url(day_off_request, format: :json)
