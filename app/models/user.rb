class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :images
  has_many :comments

  has_many :followlinks
  has_many :followees, through: :followlinks

   has_many :inverse_followlinks, class_name: "Followlink", foreign_key: :followee_id
  has_many :followers, through: :inverse_followlinks, source: :user
end
