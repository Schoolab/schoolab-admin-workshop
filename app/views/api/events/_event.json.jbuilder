json.extract! event, :id, :created_at, :updated_at, :title, :date, :start_time, :end_time, :location, :full_price, :host, :link, :description, :public, :image
json.url event_url(event, format: :json)
