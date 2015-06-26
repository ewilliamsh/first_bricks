require 'ostruct'
module Ob
		class Product < Resource
			include Ob::Operations::Find
			include Ob::Operations::All
			include Ob::Operations::Where
			include Ob::Operations::Exec
			include Ob::Operations::Delete
			include Ob::Operations::Update
			include Ob::Operations::Create
			#include RubyOb::Operations::CustumAction
			#include RubyOb::Operations::CreateMember
			include ActiveModel::Serializers::JSON
			include MethCreator
		end	
end