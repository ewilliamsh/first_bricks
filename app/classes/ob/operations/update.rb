module Ob
	module Operations
		module Update
			def update(params)
				response = Requestor.new.request(:put, url, ob_hash(params))
				self.create_methods response[:response][:data][0]
				self.set_attributes response[:response][:data][0]
				self
			end
		end
	end
end