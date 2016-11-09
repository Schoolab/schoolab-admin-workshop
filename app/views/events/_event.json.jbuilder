json.extract! event, :id, :created_at, :updated_at, :title, :datetime, :location, :full_price, :host, :link, :description, :public
json.url event_url(event, format: :json)