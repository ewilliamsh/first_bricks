module Ob
	module Operations
		module Create
			module ClassMethods
				def create(params)
					response = Requestor.new.request(:post, url, params)
					response
				end
			end
			def self.included(base)
				base.extend(ClassMethods)
			end
		end
	end
end