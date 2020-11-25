# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_many(:households, { :class_name => "Household", :foreign_key => "owner_id", :dependent => :destroy })
  
  
  validates :email, :uniqueness => { :case_sensitive => false }
  
  validates :email, :presence => true
  
  
  has_secure_password

  
end
