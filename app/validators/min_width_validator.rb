class MinWidthValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.nil? || value.blank?
      record.errors[attribute] << 'must exist'
      return
    end
    width = MiniMagick::Image.open(value.path)[:width]
    min_error = 'width is below minimum'
    record.errors[attribute] << min_error if width < options[:with]
  end
end
