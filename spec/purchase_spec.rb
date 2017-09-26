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

  describe('#total_cost') do
    it "returns the cost of all products in a purchase" do
      test_purchase = Purchase.create({customer: "Edward Gorey", date: "2017-09-26"})
      test_product_1 = Product.create({description: "Fainting couch", price: 2000.00, purchase_id: test_purchase.id})
      test_product_2 = Product.create({description: "Elephant Foot Umbrella Stand", price: 4000.00, purchase_id: test_purchase.id})
      expect(test_purchase.total_cost).to eq(6000.0)
    end
  end

  describe('.sales_total') do
    it "returns the total of all purchase costs in a date range" do
      test_purchase = Purchase.create({customer: "Edward Gorey", date: "2017-09-26"})
      test_purchase_2 = Purchase.create({customer: "Edward Gorey", date: "2017-09-25"})
      test_purchase_3 = Purchase.create({customer: "Edward Gorey", date: "2017-09-20"})
      test_product_1 = Product.create({description: "Fainting couch", price: 2000.00, purchase_id: test_purchase.id})
      test_product_2 = Product.create({description: "Elephant Foot Umbrella Stand", price: 4000.00, purchase_id: test_purchase_2.id})
      test_product_3 = Product.create({description: "Elephant Foot Umbrella Stand", price: 4000.00, purchase_id: test_purchase_3.id})
      expect(Purchase.sales_total(Date.parse("2017-09-25"), Date.parse("2017-09-26"))).to eq(6000.0)
    end
  end
end
