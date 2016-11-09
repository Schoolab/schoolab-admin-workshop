class Event < ApplicationRecord
  def full_price
    if self.price == 0
      return 'Gratuit'
    else
      return self.price.to_s + ' €'
    end
  end
end
