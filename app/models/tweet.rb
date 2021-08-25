class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :replied_to, class_name: "Tweet", optional: true, counter_cache: true

  has_many :replies, class_name: "Tweet",
                        foreign_key: "replied_to_id",
                        dependent: :nullify,
                        inverse_of: "replied_to"

  validates :body, presence: true, length: { maximum: 140 }
  

end
