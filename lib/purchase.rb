#!/usr/bin/env ruby

class Purchase < ActiveRecord::Base
  has_many(:products)
end
