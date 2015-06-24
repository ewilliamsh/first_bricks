module MethCreator 
	def create_method( name, &block )
    self.class.send( :define_method, name, &block )
	end
	def valid_variable_name?(s)
	  begin
	    Object.new.instance_variable_set ("@"+s).intern, nil
	    return true
	  rescue NameError
	    return false
	  end
	end
	def create_methods(ob_response)
		ob_response.keys.each do |method|
			if valid_variable_name?(method.to_s)
				create_method("#{method.to_s}=".to_sym) { |val|
					instance_variable_set( "@" + method.to_s, val)
				}
				create_method(method) {
					instance_variable_get( "@" + method.to_s)
				}
			end
		end
	end
	def set_attributes(ob_response)
		ob_response.each do |k,v|
			if self.methods.include? k 
				if k != :id
					meth = self.send("#{k.to_s}=",v)
				end
			end
		end
	end
end