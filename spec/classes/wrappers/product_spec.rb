require 'rails_helper'
require './app/classes/ob/ob'


RSpec.describe Ob::Product do
	describe ".all" do
		context "when the server is up" do
			before do
				Ob.api_base = ENV['OB_API']
				Ob.user= ENV['OB_USERNAME']
				Ob.password=ENV['OB_PASSWORD']
				@products = Ob::Product.all
			end
			it "should be an array" do
				@products.should be_kind_of(Array)
			end
			it "the first elem should be a Product" do
				Ob.api_base = ENV['OB_API']
				Ob.user= ENV['OB_USERNAME']
				Ob.password=ENV['OB_PASSWORD']
				products = Ob::Product.all
				first_product = products.first
				first_product.should be_kind_of Ob::Product
			end
		end
	end
	describe ".find" do
		context "when the server is up" do
			it "the first elem should be a Product" do
				Ob.api_base = ENV['OB_API']
				Ob.user= ENV['OB_USERNAME']
				Ob.password=ENV['OB_PASSWORD']
				product = Ob::Product.find "FF975ED698374C768F39217FA6ED4DFB"
				product.class.should eq Ob::Product
			end
		end
	end
	describe ".delete" do
		context "when the server is up" do 
			context "when the product can't be deleted" do
				Ob.api_base = ENV['OB_API']
				Ob.user= ENV['OB_USERNAME']
				Ob.password=ENV['OB_PASSWORD']
				product = Ob::Product.delete "FF975ED698374C768F39217FA6ED4DFB"
				it "expect to have key error" do
					product[:response].should have_key :error
				end
			end
		end
	end
	describe "#update" do
		context "when the server is up" do
			Ob.api_base = ENV['OB_API']
			Ob.user= ENV['OB_USERNAME']
			Ob.password=ENV['OB_PASSWORD']
			product = Ob::Product.new "FF975ED698374C768F39217FA6ED4DFB"
			params = {name: "Jesus Lerma", id: "FF975ED698374C768F39217FA6ED4DFB"}
			product_return = product.update params
			it "expect to be an instance of product" do
				product_return.should be_kind_of Ob::Product
			end
		end
	end
	describe ".where" do
		context "when the server is up" do
			Ob.api_base = ENV['OB_API']
			Ob.user= ENV['OB_USERNAME']
			Ob.password=ENV['OB_PASSWORD']
			#{}"_where"
			products = Ob::Product.where name: 'Jesus Lerma'
			it "should return an array" do
				products.should be_kind_of(Array)
			end
			it "the first elem of returned array should be Ob::Product" do
				product = products.first
				product.should be_kind_of Ob::Product
			end
		end
	end	
end