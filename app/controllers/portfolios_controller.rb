class PortfoliosController < ApplicationController
	def index
		@portfolio_items = Portfolio.all
	end

def angular
    @angular_portfolio_items = Portfolio.angular
  end

	def new
		@portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
	end

def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))

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
def edit 
	@portfolio_items = Portfolio.find(params[:id])
end

	def update
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtile, :body))
        format.html { redirect_to portfolio_path, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
       
      end
    end
  end
def show
  @portfolio_item = Portfolio.find(params[:id])
end
end
