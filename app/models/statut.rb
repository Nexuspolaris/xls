# == Schema Information
#
# Table name: statuts
#
#  id         :integer          not null, primary key
#  name       :string
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Statut < ApplicationRecord
  has_many :ticket
  scope :opened, -> { where(:closed => false)}
  scope :closed, -> { where(:closed => true)}

  def make_exists(name)
    find_or_create_by(name: name)
  end
end
