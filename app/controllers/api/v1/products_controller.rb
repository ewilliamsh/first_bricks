
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
		product = {
			product: {
				name: plain_result[:name],
				created_at: plain_result[:creationDate],
				search_key: plain_result[:searchKey],
				description: plain_result[:description]
			}
		}
		render json: product
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