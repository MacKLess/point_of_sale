#!/usr/bin/env ruby

class Purchase < ActiveRecord::Base
  has_many(:products)

  def total_cost
    total = 0
    self.products.each do |product|
      total += product.price
    end
    total
  end
end
