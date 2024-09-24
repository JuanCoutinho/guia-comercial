class User < ApplicationRecord # Certifique-se de herdar de ApplicationRecord
  enum role: { user: 0, admin: 1 } # Adicione isso dentro da classe

  # Inclua os módulos do Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Outras associações e validações...
end
