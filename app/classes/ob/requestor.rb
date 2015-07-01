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
			meth = meth.downcase
			if params 
				if params.class != Hash
					url = url + '?' + params
				end
			end
			
			begin
				conn = Faraday.new :url => url do |faraday|
					faraday.adapter  Faraday.default_adapter
					faraday.response :logger
					faraday.basic_auth(self.user, self.password)
				end
				
				if params && meth != :put && meth != :post
					if params.class == Hash
						conn.params = params
					end
				end
				
				if meth == :put
					response = conn.put do |req|
						req.headers['Content-Type'] = 'text/xml'
						req.body = params.to_json
						binding.pry
					end
				elsif meth == :post
					response = conn.post do |req|
						req.headers['Content-Type'] = 'text/xml'
						req.body = params.to_json
						#req.options.timeout = 5
					end
				else
					response = conn.method(meth).call
				end
				if response.status != 200
					puts "error status code is #{response.status}"
				end
				if url.include? "json"

					return JSON.parse response.body, symbolize_names: true
				else
					return response.body
				end
			rescue Exception => e
				puts url
				puts "#{@user}:#{@password}"
				puts e
				puts "#{@user}:#{@password}"
			end
		end
	end
end