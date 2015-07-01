class StylesheetsController < ApplicationController
	#cache_pages :show
	def show
		@stylesheet = Stylesheet.first
		respond_to do |format|
			format.css { render text: @stylesheet.contents, content_type: "text/css" }
		end
	end
end