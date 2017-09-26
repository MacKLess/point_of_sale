#!/usr/bin/env ruby

class Product < ActiveRecord::Base
  belongs_to(:purchase)

  scope(:available, -> do
    where({:purchase_id => nil})
  end)

  scope(:unavailable, -> do
    where.not({:purchase_id => nil})
  end)
end
