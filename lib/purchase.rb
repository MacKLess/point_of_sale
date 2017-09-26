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

  def self.sales_total(start_date, end_date)
    total = 0
    self.all.each do |purchase|
      if (purchase.date >= start_date) & (purchase.date <= end_date)
        total += purchase.total_cost
      end
    end
    total
  end
end
