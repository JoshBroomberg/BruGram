class Image < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { :large => "1000x1000#",:medium => "400x400#", :thumb => "150x150#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :comments
end
