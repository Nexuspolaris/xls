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

class Ticket < ApplicationRecord
  belongs_to :agent
  belongs_to :procedure
  belongs_to :produit
  belongs_to :societe
  belongs_to :statut
  belongs_to :ss_categorie

  scope :pimpromo, -> {where(:service => "Primpromo")}
  scope :created_this_month, -> (period) {where(:date_creation => period.beginning_of_month..period.end_of_month) }
  scope :from_societe, -> (societe) {where(:societe => societe)}
  scope :backlog, -> { joins(:statut).merge(Statut.opened)}
  scope :clos, -> { joins(:statut).merge(Statut.closed)}


  def delai_prise_en_charge
    calcul_duration date_creation, date_assign
  end

  def delai_resolution
    calcul_duration date_creation, date_resolution
  end

  def short_description
    # truncate ticket.description, :length   => 30, :separator => /\w/,:omission => "..."
    ticket.description
  end

  def calcul_duration (dated, datef)
    return 0 if datef.nil?
    if dated.to_s[0, 10] == datef.to_s[0, 10]
      # calcul pour une journee au cours de la journee.
      # Prise en compte des heures d'ouverture du service
      dated = dated.change(hour: 9, min: 0, sec: 0) if dated.hour < 9
      dated = dated.change(hour: 18, min: 0, sec: 0) if dated.hour >= 18
      duration = Duration.new + (datef - dated)
    else
      # calcul sur n jours
      dated = dated.change(hour: 9, min: 0, sec: 0) if dated.hour < 9
      dated = dated.change(hour: 18, min: 0, sec: 0) if dated.hour >= 18
      dateref = dated.change(hour: 18, min: 0, sec: 0)
      duration = Duration.new + (dateref - dated)
      (datef.to_s[0, 10].to_date - dated.to_s[0, 10].to_date).to_i.times do
        # pass les Samedi et Dimanches
        dateref = dateref.tomorrow
        if dateref.wday > 0 && dateref.wday <= 5
          if datef > dateref
            duration += (60 * 60 * 9) # 60second * 60 minutes * 9 heures
          else
            dateref = dateref.change(hour: 9)
            duration += (datef - dateref)
          end
        end
      end
    end
    duration
  end
end
