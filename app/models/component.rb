# == Schema Information
#
# Table name: components
#
#  id                :integer          not null, primary key
#  description       :string
#  last_service_date :date
#  next_service_date :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  equipment_id      :integer
#  owner_id          :integer
#
class Component < ApplicationRecord

  belongs_to(:equipment, { :required => true, :class_name => "Equipment", :foreign_key => "equipment_id" })

  belongs_to(:owner, { :required => true, :class_name => "User", :foreign_key => "owner_id" })

end
