module DefaultPageContent
	extend ActiveSupport::Concern

	included do 
		before_filter :set_page_defaults
	end	

	def set_page_defaults
   	@page_title = "Devcamp Portfolio | Muhammads Website"
   	@seo_keywords = "Muhammad Awan portfolio"  	
  end
end
