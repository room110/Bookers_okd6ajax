class SearchesController < ApplicationController
    def search
      @range = params[:range]
      search1 = params[:search1]
      word = params[:word]
        if @range =='1'
           @user = User.search(search1,word)
        else
           @book = Book.search(search1,word)
        end
        #byebug
    end
end