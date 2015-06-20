require './lib/ob/ob'
class Api::V1::BaseController < ApplicationController
	protect_from_forgery with: :null_session
	Ob.api_base = "http://ec2-54-147-241-223.compute-1.amazonaws.com:8080/openbravo/org.openbravo.service.json.jsonrest"
	Ob.user="csalinas-tegik"
	Ob.password="KopoTegik"
end