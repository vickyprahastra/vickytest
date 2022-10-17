module Api
  class BooksController < ActionController::API
    def search
      books = Book.where('title LIKE ?', "%#{params[:title]}%").select('title, int_id').take(5) if params[:title]
      books = Book.where('CAST(year AS TEXT) LIKE ?', "%#{params[:year]}%").select('year, int_id').take(5) if params[:year]

      json_response_success(books.to_json)
    end

    private

    def json_response_success(data)
      render json: data, status: 200
    end
  end
end
