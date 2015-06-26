require 'faraday'

require "./app/classes/ob/version"

require "./app/classes/ob/operations/find"
require "./app/classes/ob/operations/where"
require "./app/classes/ob/operations/exec"

require "./app/classes/ob/ob_object"
require "./app/classes/ob/resource"
require './app/classes/ob/meth_creator'
Dir['./app/classes/ob/wrappers/*.rb'].each do |file| 
	require file 
end

module Ob
  def self.api_base
  	@api_base
  end
  def self.api_base=(api_base)
  	@api_base = api_base
  end
  def self.api_version
 		@api_version
 	end
 	def self.api_version=(api_version)
 		@api_version = @api_version
 	end
 	def self.user
 		@user 
 	end
 	def self.user=(user)
 		@user = user
 	end
 	def self.password
 		@password
 	end
 	def self.password=(password)
 		@password = password
 	end
end