
class Api::V1::ProductsController < Api::V1::BaseController
	def index
		plain_result = Ob::Product.where
		product = {
			products: plain_result[:response][:data]
		}

		render json: product
	end

	def show
		plain_result = Ob::Product.find(params[:id])
		render json: plain_result, serializer: ProductSerializer
	end
	def update
		
	end
	def destroy
		
	end
	def create
		
	end
	private 
	def product_params
		params.require(:product).permit(:productCategory)
	end
end