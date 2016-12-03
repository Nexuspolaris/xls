# == Schema Information
#
# Table name: tickets
#
#  id              :integer          not null, primary key
#  num             :string
#  societe_id      :integer
#  date_creation   :datetime
#  date_assign     :datetime
#  demandeur       :string
#  date_resolution :datetime
#  date_livraison  :datetime
#  description     :string
#  agent_id        :integer
#  solution        :string
#  site            :string
#  ss_categorie_id :integer
#  produit_id      :integer
#  statut_id       :integer
#  procedure_id    :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
