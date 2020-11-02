class Company < ApplicationRecord
  validates :name, presence: true
  validates :url, format: { with: %r{\A(http://www\.|https://www\.|http://|https://)?[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z},
                            allow_blank: true }
end
