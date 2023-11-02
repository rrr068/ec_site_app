class SearchesController < ApplicationController
    before_action :authenticate_customer!

    def search
      @range = params[:range]
      @word  = params[:word]
      

      if @range == "Product"
        @products =Product.looks(params[:search], params[:word])
      end
    end

end
