class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(params)
    objects = self.all
    params.each do |attribute, value|
      if ['created_at', 'updated_at'].include?(attribute)
        objects = objects.where("#{attribute} BETWEEN ? and ?", "%#{value.to_date.beginning_of_day}%", "%#{value.to_date.end_of_day}%")
      else
        objects = objects.where("#{attribute} like ?", "%#{value.downcase}%")
      end
    end
    objects.first
  end
end
