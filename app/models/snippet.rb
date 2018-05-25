class Snippet < ApplicationRecord
  belongs_to :label, optional: true, counter_cache: :taggings_count

  accepts_nested_attributes_for :label

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true, length: { maximum: 10000 }
  validates :language, presence: true, inclusion: { in: Editor.languages.keys.map(&:to_s) }
  validates :tabs, numericality: { only_integer: true }, inclusion: { in: [2, 4, 8] }
end
