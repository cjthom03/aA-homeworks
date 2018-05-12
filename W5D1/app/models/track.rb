# == Schema Information
#
# Table name: tracks
#
#  id            :bigint(8)        not null, primary key
#  title         :string           not null
#  ord           :integer          not null
#  lyrics        :text
#  regular_track :boolean          default(TRUE)
#  album_id      :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Track < ApplicationRecord
  validates :title, :ord, :regular_track, :album_id, presence: true
  validate :duplicate_tracks

  belongs_to :album

  private
  def duplicate_tracks
    dup = Track.where(album_id: self.album_id).where(ord: self.ord)
    if dup.nil?
      self.errors[:ord] << ": Track number cannot be repeated in the same album."
    end
  end
end
