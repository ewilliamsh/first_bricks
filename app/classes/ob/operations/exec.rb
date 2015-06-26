module Ob
	module Operations
		module Exec
			module ClassMethods
				def exec(query) 
					instance = ObObject.new
					response = Requestor.new.request(:get, url, query)
					response
				end
			end
			def self.included(base)
				base.extend(ClassMethods)
			end
		end
	end
end