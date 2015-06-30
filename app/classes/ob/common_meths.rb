module CommonMeths
	module ClassMethods
		def ob_result_to_instance response
			products = []
			response[:response][:data].each do |hash_of_attrs|
				instance = self.new(hash_of_attrs[:id])
				instance.create_methods hash_of_attrs
				instance.set_attributes hash_of_attrs
				products.push instance
			end
			products
		end
	end
	def self.included(base)
		base.extend(ClassMethods)
	end
end