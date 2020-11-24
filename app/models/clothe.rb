# == Schema Information
#
# Table name: clothes
#
#  id          :integer          not null, primary key
#  description :text
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  home_id     :integer
#
class Clothe < ApplicationRecord

  belongs_to(:home, { :required => true, :class_name => "Household", :foreign_key => "home_id" })


end
