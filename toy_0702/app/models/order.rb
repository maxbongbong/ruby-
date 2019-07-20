class Order < ApplicationRecord
  # 이게 필수인지 아닌지에 대해서
  belongs_to :user, optional: true #유저가 지워져도 오더기록은 남아야함(지울때 null로 채워짐)
  has_many :line_items, dependent: :nullify #오더가 지워졌을때 하위애들을 어떻게 할지 결정(남김)
end
