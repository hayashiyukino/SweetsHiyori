class Public::SearchesController < ApplicationController
  # before_action :authenticate_end_user!
  
	# def search
	# 	@model = params[:model]
	# 	@content = params[:content]
	# 	@method = params[:method]
	# 	if @model == 'user'
	# 		@records = User.search_for(@content, @method)
	# 	elsif @model == 'book'
	# 		@records = Book.search_for(@content, @method)
	# 	elsif @model == 'tag'
	# 		@records = Tag.search_books_for(@content, @method)
	# 	end
	# end
	
# 	def search
#     @genres      = Genre.all
#     model        = params[:model]
#     @search_name = params[:content]
#     if model    == "genre"
#       @item_all  = Genre.search_for(@search_name)
#       @items     = Kaminari.paginate_array(Genre.search_for(@search_name)).page(params[:page]).per(8)
#     elsif model == "item"
#       @item_all = Item.search_for(@search_name)
#       @items    = Kaminari.paginate_array(Item.search_for(@search_name)).page(params[:page]).per(8)
#     else
#       @item      = Item.all
#     end
#   end
  
end
