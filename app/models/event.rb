#
# Модель события
class Event < ActiveRecord::Base
  # событие всегда принадлежит юзеру
  belongs_to :user

  # у события много комментариев и подписок
  has_many :comments
  has_many :subscriptions

  # у события много подписчиков (объекты User), через таблицу subscriptions, по ключу user_id
  has_many :subscribers, through: :subscriptions, source: :user

  # юзера не может не быть
  validates :user, presence: true

  # заголовок должен быть, и не длиннее 255 букв
  validates :title, presence: true, length: {maximum: 255}

  validates :address, presence: true
  validates :datetime, presence: true

end
