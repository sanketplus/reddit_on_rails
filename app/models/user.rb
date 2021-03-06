class User < ActiveRecord::Base
  # Include default devise modules. Others available are: :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #attr_accessible :email, :username
  has_many :links
  has_many :comments
  has_many :votes

end
