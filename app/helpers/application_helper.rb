module ApplicationHelper
  def materialize_design_flash_messages
  end

  def flash_messages
  end

  def domain_name
    host = (request.host == "localhost") ? request.host + ":3000" : request.host
    host   
  end
end
