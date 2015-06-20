module Ob
	module Operations
		module Find
			module ClassMethods
				def find(id) 
					instance = self.new(id)
					puts url
					response = Requestor.new.request(:get, instance.url)
					response
				end
			end
			def self.included(base)
				base.extend(ClassMethods)
			end
		end
	end
end