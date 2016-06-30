class Track < ActiveRecord::Base
  validates :name, :song_type, presence: true
  belongs_to :album, dependent: :destroy
  has_one :band,
    through: :album,
    source: :band

end
