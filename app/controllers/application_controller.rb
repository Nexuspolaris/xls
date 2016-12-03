class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  require 'logger'
  ActiveRecord::Base.logger = Logger.new(STDOUT)

  def dateToSring maDate
    maDate.strftime('%d/%m/%Y %H:%M')
  end
end
