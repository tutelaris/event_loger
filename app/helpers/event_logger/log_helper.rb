module EventLogger
  module LogHelper
    def class_by_status(log)
      log.has_error? ? "danger" : "default"
      #log.has_error? ? "danger" : "default"
    end

    def date_range_by_params(start_date, end_date)
      if start_date.present? && end_date.present?
        "#{start_date} - #{end_date}"
      else
        ""
      end
    end

    def options_for_select_with_default(array_of_values, current_value='')
      array_of_values.prepend(["Все", ""])
      option_values = array_of_values.map do |values| 
        "<option value='#{values[1]}' #{"selected='selected'" if current_value.to_s == values[1].to_s}>#{values[0]}</option>"
      end
      raw(option_values.join(""))
    end
  end
end