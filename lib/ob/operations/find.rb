module Ob
	module Operations
		module Find
			module ClassMethods
				def find(id) 
					instance = self.new(id)
					response = Requestor.new.request(:get, instance.url)
					instance.create_methods response
					instance.set_attributes response
					instance
				end
			end
			def self.included(base)
				base.extend(ClassMethods)
			end
		end
	end
end