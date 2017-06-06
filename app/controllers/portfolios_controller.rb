class PortfoliosController < ApplicationController
	def index
		@portfolio_items = Portfolio.all
	end

	def new
		@portfolio_items = Portfolio.new
	end

end

def create
    @portfolio_items = Portfolio.new(params.require(:portfolio).permit(:title, :subtile, :body))

    respond_to do |format|
      if @blog.save
        format.html { redirect_to portfolios path, notice: 'Your portfolio item is now live.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

