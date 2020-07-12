class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(params)
    objects = self.all
    params.each do |attribute, value|
      objects = filter_objects(attribute, value, objects)
    end
    objects
  end

  private

  def self.filter_objects(attribute, value, objects)
    if ['created_at', 'updated_at'].include?(attribute)
      objects.where("#{attribute} BETWEEN ? AND ?", "%#{value.to_date.beginning_of_day}%", "%#{value.to_date.end_of_day}%")
    elsif attribute == "unit_price"
      objects.where("#{attribute} BETWEEN ? AND ?", (value.to_i - 1), (value.to_i + 1))
    else
      objects.where("LOWER(#{attribute}) LIKE ?", "%#{value.downcase}%")
    end
  end
end
