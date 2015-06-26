module Ob
	module Operations
		module Update
			def update(params)
				response = Requestor.new.request(:put, url, ob_hash(params))
				response
			end
		end
	end
end