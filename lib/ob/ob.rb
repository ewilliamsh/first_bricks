require 'faraday'

require "./lib/ob/version"

require "./lib/ob/operations/find"
require "./lib/ob/operations/where"
require "./lib/ob/operations/exec"

require "./lib/ob/ob_object"
require "./lib/ob/resource"

Dir['./lib/ob/wrappers/*.rb'].each do |file| 
	puts "importing #{file}" 
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