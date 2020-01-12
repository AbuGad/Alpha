class User < ActiveRecord::Base
	has_many :articles, dependent: :destroy
	before_save { self.email = email.downcase }
	validates :username, uniqueness: { case_sensitive: false },
	 			presence: true, length: {minimum:3 , maximum: 300}
	validates :email, uniqueness: { case_sensitive: false}, presence: true ,
				 length: {minimun:2 , maximum:300}, 
				 :email_format => {:message => " is not looking good"} 
has_secure_password			
end