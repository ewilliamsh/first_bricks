module Ob
	class ObObject < Hash
		attr_reader :id
		attr_reader :values

		def initialize(id = nil)
			@values = Hash.new
			@id = id.to_s
		end
		def set_val(k,v)
			@values[k] = v
		end
		def unset_key(k)
			@values.delete(k)
		end
		def self.class_name
			self.name.split('::')[-1]
		end
	end
end