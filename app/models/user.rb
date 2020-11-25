# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_many(:households, { :class_name => "Household", :foreign_key => "owner_id", :dependent => :destroy })
  
  has_many(:clothes, { :class_name => "Clothe", :foreign_key => "owner_id", :dependent => :destroy })

  has_many(:articles_of_clothing, { :through => :households, :source => :clothes })


  has_many(:equipment, { :class_name => "Equipment", :foreign_key => "owner_id", :dependent => :destroy })
  validates :email, :uniqueness => { :case_sensitive => false }
  
  validates :email, :presence => true
  
  
  has_secure_password

  
end
