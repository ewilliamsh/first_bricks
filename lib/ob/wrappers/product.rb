require 'ostruct'
module Ob
		class Product < Resource
			include Ob::Operations::Find
			include Ob::Operations::Where
			include Ob::Operations::Exec
		  include ActiveModel::Serializers::JSON
		  include MethCreator
			#include RubyOb::Operationsa::Create
			#include RubyOb::Operations::Delete
			#include RubyOb::Operations::Update
			#include RubyOb::Operations::CustumAction
			#include RubyOb::Operations::CreateMember
			
		end	
end