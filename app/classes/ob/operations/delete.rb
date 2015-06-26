module Ob
	module Operations
		module Delete
			module ClassMethods
				def delete(id) 
					instance = self.new(id)
					response = Requestor.new.request(:delete, instance.url)
					response
				end
			end
			def self.included(base)
				base.extend(ClassMethods)
			end
		end
	end
end