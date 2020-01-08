class User < ActiveRecord::Base
	validates :username, uniqueness: { case_sensitive: false },
	 			presence: true, length: {minimum:3 , maximum: 300}
	validates :email, uniqueness: { case_sensitive: false}, presence: true ,
				 length: {minimun:2 , maximum:300}, :email_format => {:message => " is not looking good"} 			
end