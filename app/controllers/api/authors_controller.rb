module Api
  class AuthorsController < ActionController::API
    def search
      authors = Author.where('LOWER(name) LIKE ?', "%#{params[:name]}%").select('name, int_id').take(5)

      json_response_success(authors.to_json)
    end

    private

    def json_response_success(data)
      render json: data, status: 200
    end
  end
end
