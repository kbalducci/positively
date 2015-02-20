require 'csv'
class Glow < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :quote
  paginates_per 10


def self.to_csv
    CSV.generate do |csv|
      csv << Glow.new.attributes.keys
      Glow.all.each do |glow|
        csv << glow.attributes.values
      end
    end
  end
end
