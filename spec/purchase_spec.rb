#!/usr/bin/env ruby

require 'spec_helper'

describe('Purchase') do
  describe('#products') do
    it "returns an empty array if purchase has no products assigned" do
      test_purchase = Purchase.create({customer: "Edward Gorey", date: "2017-09-26"})
      expect(test_purchase.products).to eq([])
    end

    it "returns an array of all products assigned to a purchase" do
      test_purchase = Purchase.create({customer: "Edward Gorey", date: "2017-09-26"})
      test_product_1 = Product.create({description: "Fainting couch", price: 2000.00, purchase_id: test_purchase.id})
      test_product_2 = Product.create({description: "Elephant Foot Umbrella Stand", price: 4000.00, purchase_id: test_purchase.id})
      expect(test_purchase.products).to eq([test_product_1, test_product_2])
    end
  end
end
