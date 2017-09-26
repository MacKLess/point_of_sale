#!/usr/bin/env ruby

class Product < ActiveRecord::Base
  belongs_to(:purchase)
end
