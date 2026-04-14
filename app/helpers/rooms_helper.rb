module RoomsHelper
  def occupancy_status_class(status)
    case status
    when "vago"
      "table-success"
    when "ocupado"
      "table-danger"
    when "bloqueado"
      "table-warning"
    else
      ""
    end
  end

  def housekeeping_status_class(status)
    case status
    when "liberado"
      "bg-success text-white"
    when "sujo"
      "bg-danger text-white"
    when "limpo"
      "bg-warning text-dark"
    else
      "bg-secondary text-white"
    end
  end
end
