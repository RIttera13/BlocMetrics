module RegisteredApplicationsHelper

  def event_count (event)
    event.map {|k,v| [k, v.length]}
  end
end
