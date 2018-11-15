# frozen_string_literal: true

# Artist
#
# Attributes:
#   - birthday [Date], optional
#   - description [Text], optional
#   - image []
#   - language_id [Language]
#   - lead [String], optional
#   - name [String]
#   - patronymic [String], optional
#   - surname [String]
class Artist < ApplicationRecord
  include Checkable
  include Toggleable

  DESCRIPTION_LIMIT = 65_535
  LEAD_LIMIT        = 255
  NAME_LIMIT        = 50

  toggleable :visible

  belongs_to :language

  validates_presence_of :name, :surname
  validates_length_of :description, maximum: DESCRIPTION_LIMIT
  validates_length_of :lead, maximum: LEAD_LIMIT
  validates_length_of :name, maximum: NAME_LIMIT
  validates_length_of :patronymic, maximum: NAME_LIMIT
  validates_length_of :surname, maximum: NAME_LIMIT

  scope :for_language, ->(v) { where(language: v) }
  scope :visible, -> { where(visible: true) }
  scope :ordered_by_surname, -> { order('surname asc, name asc') }
  scope :list_for_visitors, -> { visible.ordered_by_surname }
  scope :list_for_administration, -> { ordered_by_surname }

  def self.entity_parameters
    %i[birthday description image language_id lead name patronymic surname]
  end
end
