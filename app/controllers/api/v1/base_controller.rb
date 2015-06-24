require './lib/ob/ob'
class Api::V1::BaseController < ApplicationController
	protect_from_forgery with: :null_session
	Ob.api_base = ENV['OB_API']
	Ob.user= ENV['OB_USERNAME']
	Ob.password=ENV['OB_PASSWORD']
end