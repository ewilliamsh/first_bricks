
class Api::V1::ProductsController < Api::V1::BaseController
	def index
		products = Ob::Product.all
		render json: products, status: :ok
	end

	def show
		product = Ob::Product.find(params[:id])
		binding.pry
		render json: product, serializer: ProductSerializer, status: :ok
	end
	def update
		product = Ob::Product.new params[:id]
		product_response = product.update params[:product]
		render json: product_response, serializer: ProductSerializer, status: :ok
	end
	def destroy
		product = Ob::Product.delete(params[:id])
		if product.has_key?(:response) && product[:response].has_key?(:error)
			render json: { product: {errors: product[:response][:error]} },
										status: :unprocessable_entity
		else
			head :no_content
		end
	end
	def create
		product = Ob::Product.create(params[:product])

		if product.class.method_defined? :error_messages
			render json: { product: { errors: product.error_messages} },
										status: :unprocessable_entity
		else			
			render json: product, serializer: ProductSerializer, status: :created
		end
	end
	private 
	def product_params
		params.require(:product).permit(:productCategory)
	end
end