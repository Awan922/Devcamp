class PortfoliosController < ApplicationController
  layout 'portfolio'
  
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
    @portfolio_item = Portfolio.new(portfolio_params)

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
    @portfolio_items = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
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

  def destroy
   @portfolio_item = Portfolio.find(params[:id])

   @portfolio_item.destroy
   respond_to do |format|
    format.html {redirect_to portfolios_url, notice: 'record was removed'}
  end
end

 private
 
  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body, 
                                      technologies_attributes: [:name]
                                      )

   end
 
  end






