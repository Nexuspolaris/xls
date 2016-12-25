# test
class TicketClosController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:db_action,:submit_form]

  require "xls"

  def sousstatut statut, ssstatut
    if statut == "pending" then
      case ssstatut
      when "pending_mtp" then "Attente Recette"
      when "pending_support" then "Attente Support"
      when "pending_customer_reply" then "Attente Client"
      else "Attente "+ssstatut
      end
    else
      statut
    end
  end

  def import
    period = params[:period]
    closFilename = Dir["public/PRIMPROMO-TicketsClos-M-1#{period[0..3]}-#{period[4..5]}*.xlsx"]
    backlogFilename = Dir["public/PRIMPROMO-backlog_hebdo#{period[0..3]}-#{period[4..5]}*.xlsx"]
    importXls = MyXls.new
    begin
      importXls.open_clos closFilename[0]
    rescue Exception => e
      puts "Fichier introuvable : Clos"
    end
    begin
      importXls.open_backlog backlogFilename[0]
    rescue Exception => e
      puts "Fichier introuvable : Backlog"
    end
    redirect_to action: index
  end

  def export
    period = params[:period]
    #societes = Societe.all
    societes = Societe.all.limit 1 # for testing
    societes.each do |societe|
      (eval("MyXls"+societe.subclassname)).export period, societe
    end
    redirect_to action: index
  end

  def index
    @tickets = Ticket.all.order(:num)
    respond_to do |format|
      format.html
    end
  end

  def action
    #gestion des droits
    render :json => [
      {
        id:      'import',
        type:    'button',
        text:    'Import',
        action:  'import'
      },
      {
        id:      'export',
        type:    'button',
        text:    'Export',
        action:  'export'
      }
    ]
  end

  def data
    tickets = Ticket.all.includes(:societe)
    respond_data tickets
  end

  def respond_data tickets
    render :json => {
      :total_count => tickets.length,
      :pos => 0,
      :rows => tickets.map do |ticket|
      {
        :id => ticket.id,
        :data => [ticket.num,ticket.description,ticket.societe.name, dateToSring(ticket.date_creation), dateToSring(ticket.date_assign),ticket.delai_prise_en_charge.format("%hh, %m min"),dateToSring(ticket.date_resolution),ticket.delai_resolution.format("%hh, %m min")]
      }
      end
    }
  end

  def form
    societes = Societe.all
    societes_h = []
    societes.each do |societe|
      societes_h << {:text => societe.name, :value => societe.id }
    end
    #    {text: "Open Air",      value: "1"},
    #    {text: "Private Party", value: "2"}

    render :json => [
      {type: "combo", name:"societe", label: "Société", inputWidth:120, options: societes_h},{type:"newcolumn"},
      {type:"calendar", name:"dateDebut",  label:"&nbsp;&nbsp;Date de début",dateFormat: "%d/%m/%Y"},{type:"newcolumn"},
      {type:"calendar", name:"dateFin",  label:"&nbsp;&nbsp;Date de fin",dateFormat: "%d/%m/%Y"},{type:"newcolumn"},
      {type:"button", name:"find",  value:"Rechercher", position:"absolute", inputTop:1 }
    ]
  end

  def db_action
    ids = params["ids"]
    ids.split(",").each do |id|
      @mode = params[id+"!nativeeditor_status"]
      name = params[id+"_c0"]
      dateDebut = Date.strptime(params[id+'_c1'], '%d/%m/%Y')
      dateFin = Date.strptime(params[id+'_c2'], '%d/%m/%Y')
      @id = params[id+"_gr_id"]
      case @mode
      when "inserted"
        ticket = Ticket.create :name => name, :dateDebut => dateDebut, :dateFin => dateFin
        @tid = ticket.id
      when "deleted"
        Ticket.find(@id).destroy
        @tid = @id
      when "updated"
        ticket = Ticket.find(@id)
        ticket.name = name
        ticket.dateDebut = dateDebut
        ticket.dateFin = dateFin
        ticket.save!
        @tid = @id
      end
    end
  end

  def submit_form
    logger.info("param : #{params["societe"]}")
    params["societe"]==0 ? tickets=Ticket.all.includes(:societe) : tickets = Ticket.where("societe_id = ?",params["societe"]).includes(:societe)
    respond_data tickets
  end

  def action_submit
    axlsx = Axlsx.new
  end
end
