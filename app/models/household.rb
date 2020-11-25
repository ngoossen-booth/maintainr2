# == Schema Information
#
# Table name: households
#
#  id         :integer          not null, primary key
#  address    :string
#  nickname   :string
#  picture    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#
class Household < ApplicationRecord
  
  belongs_to(:owner, { :required => true, :class_name => "User", :foreign_key => "owner_id" })
  has_many(:equipment, { :class_name => "Equipment", :foreign_key => "home_id", :dependent => :nullify })
  has_many(:clothes, { :class_name => "Clothe", :foreign_key => "home_id", :dependent => :nullify })


  validates(:owner_id, { :presence => true })
end
