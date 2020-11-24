# == Schema Information
#
# Table name: components
#
#  id                :integer          not null, primary key
#  description       :string
#  last_service_date :datetime
#  next_service_date :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  equipment_id      :integer
#
class Component < ApplicationRecord
end
