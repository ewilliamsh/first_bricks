
class Api::V1::ProductsController < Api::V1::BaseController
	def index
		plain_result = Ob::Product.all
		render json: plain_result
	end

	def show
		product = Ob::Product.find(params[:id])
		render json: product, serializer: ProductSerializer
	end
	def update
		product = Ob::Product.new params[:id]
		product_response = product.update params[:product]
		render json: product_response, serializer: ProductSerializer
	end
	def destroy
		product = Ob::Product.delete(params[:id])
		if product.has_key? :response
			if product[:response].has_key? :error
			render json: { product: {errors: product[:response][:error]} },
										status: :unprocessable_entity
			else
				head :no_content
			end	
		else
			head :no_content
		end
		
	end
	def create
		puts params
		product = Ob::Product.create(params[:product])
		render json: product, serializer: ProductSerializer
	end
	private 
	def product_params
		params.require(:product).permit(:productCategory)
	end
end