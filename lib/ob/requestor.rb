require 'faraday'
require 'base64'
require 'json'
require "rexml/document"


module Ob
	class Requestor
		#require 'sys/uname'
		#include Sys

		attr_reader :user
		attr_reader :password

		def initialize()
			@user = Ob.user
			@password = Ob.password
		end
		def api_url(url = '')
			api_base = Ob.api_base
			api_base + url
		end
		def request(meth, url, params=nil)
			url = self.api_url(url)
			puts "http en requestor #{url}"
			meth = meth.downcase
			if params 
				if params.class != Hash
					url = url + '?' + params
				end
			end
			
			begin
				conn = Faraday.new :url => url do |faraday|
					faraday.adapter  Faraday.default_adapter
					faraday.basic_auth(self.user, self.password)
				end
				
				if params 
					if params.class == Hash
						conn.params = params
					end
				end

				puts url
				response = conn.method(meth).call

			rescue Exception => e
				puts e
			end
			if response.status != 200
				puts "error status code is #{response.status}"
			end
			if url.include? "json"
				#puts "response"
				#puts response.body
				return JSON.parse response.body, symbolize_names: true
			else
				return response.body
			end
		end
	end
end