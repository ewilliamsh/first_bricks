class Api::V1::BusinessPartnersController < Api::V1::BaseController
	def show
		business_partner = Ob::BusinessPartner.find(params[:id])
		render json: business_partner, serializer: BusinessPartnerSerializer, status: :ok
	end

	def index
		business_partners = Ob::BusinessPartner.where(searchKey:params[:searchKey])
		render json: business_partners, each_serializer: BusinessPartnerSerializer, status: :ok
	end

	def destroy
		business_partner = Ob::BusinessPartner.delete(params[:id])
		if business_partner.has_key?(:response) && business_partner[:response].has_key?(:error)
			render json: {business_partner: {errors: business_partner[:response][:error]} },
			status: :unprocessable_entity
		else
			head :no_content
		end
	end

	def update
		business_partner = Ob::BusinessPartner.new params[:id]
		business_partner_response = business_partner.update(params[:business_partner])
		render json: business_partner_response, serializer: BusinessPartnerSerializer, status: :ok
	end

	def create
		business_partner = Ob::BusinessPartner.create(params[:business_partner])

		if business_partner.class.method_defined? :error_messages
			render json: { business_partner: { errors: business_partner.error_messages} },
										status: :unprocessable_entity
		else			
			render json: product, serializer: BusinessPartnerSerializer, status: :created
		end
	end
end