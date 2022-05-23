class BooksController < ApplicationController
  def new
    @book=Book.new
  end

  def create
    @book=Book.new(title: params[:title],body: params[:body])
    if @book.save
      flash[:notice]="Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      render :new
    end
  end

  def index
    @books=Book.all
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    book=Book.find(params[:id])
    book.update(book_params)
    flash[:notice]="Book was successfully updated."
    redirect_to book_path(book.id)
  end

  def destroy
    book=Book.find(params[:id])
    if book.destroy
      flash[:notice]="Book was successfully destroyed."
      redirect_to books_path
    else
      render :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end