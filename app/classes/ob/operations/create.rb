module Ob
	module Operations
		module Create
			module ClassMethods
				def create(params)
					instance = self.new
					response = Requestor.new.request(:post, url, self.new.ob_hash(params))
					if response[:response].has_key? :error
						resp = {error_messages: response[:response][:error][:message]}
						instance.create_methods resp
						instance.set_attributes resp
					else
						instance.create_methods response[:response][:data][0]
						instance.set_attributes response[:response][:data][0]
					end
					
					instance
				end
			end
			def self.included(base)
				base.extend(ClassMethods)
			end
		end
	end
end