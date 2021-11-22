class Choice < ApplicationRecord
  belongs_to :word
  validates  :choice, presence: true
  has_many   :answers,  dependent: :destroy
end
