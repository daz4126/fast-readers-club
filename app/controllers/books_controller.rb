class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
        @reviews = @book.reviews.order(created_at: :desc)
        if current_user
          @review = @book.reviews.new
        end
    end

    def new
        if current_user
          @book = Book.new
        else
          redirect_to root_path, alert: "You need to be signed in to add a new book"
        end
    end
    
    def create
        @book = Book.new(book_params)

        if @book.save
            redirect_to @book, notice: "New book added"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit  
        @book = Book.find(params[:id])
        unless current_user
            redirect_to @book, alert: "You need to be signed in to edit a book"
        end
    end

    def update
        @book = Book.find(params[:id])

        if @book.update(book_params)
            redirect_to @book, notice: "Book updated"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy

        redirect_to root_path, status: :see_other
    end

    private
    def book_params
      params.require(:book).permit(:title,:author,:cover,:description)
    end
end
