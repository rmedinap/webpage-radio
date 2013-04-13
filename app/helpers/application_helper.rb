module ApplicationHelper


  def diapositivas_counter(instancia)
    "#{' length-' + instancia.size.to_s + ' '}"
  end
end
