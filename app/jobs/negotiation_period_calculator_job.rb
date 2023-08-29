class NegotiationPeriodCalculatorJob < ApplicationJob
  include Rails.application.routes.url_helpers
  
  queue_as :default

  after_perform do |job|
  end

  def perform(message)

    negotiations = App::Negotiation.all.update_all(period: 0)
    negotiations = App::Negotiation.includes(:course, :calendar).all
    
    negotiations_processed = 0
    negotiations_total = negotiations.count
    
    negotiations.each do |negotiation|
  
    # SAVE THE NEGOTIATION
    negotiation.save
    negotiations_processed+=1
      ActionCable.server.broadcast('NegotiationPeriodCalculatorChannel', { job: {count: negotiations_processed, total: negotiations_total, progress: progress(negotiations_processed, negotiations_total) } } )
    end
  end

  def progress(negotiations_processed, negotiations_total)
    (negotiations_processed.to_f/negotiations_total.to_f)*100
  end


  
end


