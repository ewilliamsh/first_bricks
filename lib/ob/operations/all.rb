module Ob
	module Operations
		module All
			module ClassMethods
				def all(params=nil)
					instance = ObObject.new
					response = Requestor.new.request(:get, url)
					response[:response][:data]
				end
			end
			def self.included(base)
				base.extend(ClassMethods)
			end
		end
	end
end