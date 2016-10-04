class MinHeightValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.nil? || value.blank?
      record.errors[attribute] << 'must exist'
      return
    end
    height = MiniMagick::Image.open(value.path)[:height]
    min_error = 'height is below minimum'
    record.errors[attribute] << min_error if height < options[:with]
  end
end
