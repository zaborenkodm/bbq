source 'https://rubygems.org'

# зависим от рельсов 4.2.*
gem 'rails', '~> 4.2.7'

gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'russian'

# гем, интегрирующий bootstrap
gem 'twitter-bootstrap-rails'

gem 'uglifier', '>= 1.3.0'

# для поддержки jQuery
gem 'jquery-rails'

gem 'carrierwave', '~> 0.11.2'
gem 'rmagick'
gem 'fog-aws'

# в продакшен сервере heroku этот гем соединяет с базой данных Postgres
group :production do
  gem 'pg'
  # добавил гем для работы Heroku со статическими ассетами (изображения и таблицы стилей )
  gem 'rails_12factor'
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
end
