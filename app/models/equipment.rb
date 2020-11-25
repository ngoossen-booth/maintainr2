# == Schema Information
#
# Table name: equipment
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  home_id     :integer
#
class Equipment < ApplicationRecord

  belongs_to(:home, { :required => true, :class_name => "Household", :foreign_key => "home_id" })

  has_many(:components, { :class_name => "Component", :foreign_key => "equipment_id", :dependent => :destroy })
end