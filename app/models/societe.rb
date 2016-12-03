# == Schema Information
#
# Table name: societes
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Societe < ApplicationRecord
  has_many :ticket
  def make_exists(name)
    find_or_create_by(name: name)
  end
  def subclassname
    name if subclass
  end
end
