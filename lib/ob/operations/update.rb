module Ob
	module Operations
		module Update
			def update(params)
				puts "hey im updating"
				response = Requestor.new.request(:put, url, ob_hash(params))
				response
			end
		end
	end
end