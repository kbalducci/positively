require 'csv'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :glows
  validates_presence_of :username, :first_name, :last_name
  validates_uniqueness_of :username

  has_attached_file :avatar,
  :styles => { :medium => "300x300>", :thumb => "100x100>" },
  :bucket => 'kbjsinstaclone',
  :url =>':s3_domain_url',
  :path => ':class/:attachment/:id_partition/:style/:filename',
  :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.to_csv
    CSV.generate do |csv|
      csv << User.new.attributes.keys
      User.all.each do |user|
        csv << user.attributes.values
      end
    end
  end
end
