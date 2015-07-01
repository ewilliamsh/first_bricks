class BusinessPartnerSerializer < ActiveModel::Serializer
  #attributes :id
  def attributes
  	attr_hash = super
  	object.instance_variables.each do |name| 
  		instance_variable_key = name[1..-1] #removes the @name for the instance var
  		attr_hash[instance_variable_key] = object.instance_variable_get(name)
  	end
  	attr_hash
  end
end
