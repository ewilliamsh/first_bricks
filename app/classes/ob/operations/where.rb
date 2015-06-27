module Ob
	module Operations
		module Where
			module ClassMethods
				def where params=nil
					response = Requestor.new.request(:get, url, format_params(params))
					products = self.ob_result_to_instance response
					products
					#products = []
					#response[:response][:data].each do |hash_of_attrs|
						#instance = self.new(hash_of_attrs[:id])
						#instance.create_methods hash_of_attrs
						#instance.set_attributes hash_of_attrs
						#products.push instance
					#end
					#products
				end
				def format_params params 
					{"_where" => hash_to_str(params)}
				end
				def hash_to_str params
					params.map{|k,v| "#{k.to_s}='#{v}'"}.join('&')
				end
			end
			def self.included base
				base.extend(ClassMethods)
			end
		end
	end
end