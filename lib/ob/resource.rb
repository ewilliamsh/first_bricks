module Ob
	class Resource < ObObject
		def self.url()
			"/#{CGI.escape(self.class_name)}"
		end
		def url
			return [self.class.url, id].join('/')
		end
	end
end