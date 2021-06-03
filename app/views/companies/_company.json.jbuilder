json.extract! company, :id, :name, :description, :website, :company_size, :timezone, :category, :internal_note, :user_id, :created_at, :updated_at
json.url company_url(company, format: :json)
