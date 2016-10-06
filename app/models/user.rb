class User < ActiveRecord::Base
	belongs_to :secret_code
	validates_presence_of :secret_code_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable
         #:recoverable, :rememberable, :trackable, :validatable
end
