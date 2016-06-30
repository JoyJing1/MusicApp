class Album < ActiveRecord::Base
  validates :band_id, :name, :record_type, presence: true
  belongs_to :band, dependent: :destroy
  has_many :tracks, dependent: :destroy

end
