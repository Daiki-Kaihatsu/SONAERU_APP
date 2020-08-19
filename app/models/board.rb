class Board < ApplicationRecord
  belongs_to :user
  attachment :image

  validates :title, presence: true
  validates :title, length: { maximum: 20 }  


  has_many :board_details, dependent: :destroy, inverse_of: :board
  has_many :board_materials, dependent: :destroy, inverse_of: :board
  accepts_nested_attributes_for :board_details,reject_if: :all_blank,allow_destroy: true
  accepts_nested_attributes_for :board_materials,reject_if: :all_blank,allow_destroy: true

  has_many :board_tag_relations,dependent: :delete_all
  has_many :tags, through: :board_tag_relations

  # 星レビュー機能
  has_many :reviews, dependent: :destroy
end
