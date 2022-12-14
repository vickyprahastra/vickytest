class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @books = resource.order(:created_at).page(params[:page]).per(10)
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def retrieve
    book = Book.find_by(int_id: params[:id])
    return redirect_to books_path unless book

    redirect_to book_path(book.id)
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def resource
    books = Book.all

    books = books.where('CAST(author AS TEXT) = ANY(ARRAY[?])', params[:author]) if params[:author].present?
    books = books.where('CAST(year AS TEXT) = ANY(ARRAY[?])', params[:year]) if params[:year].present?
    books = books.where('pages >= ?', params[:min_pages]) if params[:min_pages].present?
    books = books.where('pages <= ?', params[:max_pages]) if params[:max_pages].present?

    if params[:book]
      given_book = Book.find_by(int_id: params[:book].first.to_i)

      return books unless given_book
      books = books.where('classes @> ?', given_book.classes.last.to_json)
      books = books.or(Book.where('authors @> ?', [given_book.author].to_json))
    end

    books
  end


  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:content_name, :author_name, :images_urls, :year, :images, :int_id, :category, :genres, :copyright, :title, :average_rating, :similar_books, :description, :loc_class, :authors, :language, :countries, :release_date, :author, :cover, :content_cleaned, :classes, :content_available, :n_authors, wikipedia: [:url, :found], gutenberg: [:url, :found], goodreads: [:url, :found])
  end
end
