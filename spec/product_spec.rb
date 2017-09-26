#!/usr/bin/env ruby

require 'spec_helper'

describe('Product') do
  describe('#purchase') do
    it "returns nil if product has no purchase_id" do
      test_product = Product.create({description: "Fainting couch", price: 2000.00, purchase_id: nil})
      expect(test_product.purchase).to eq(nil)
    end

    it "returns the purchase a product belongs to" do
      test_purchase = Purchase.create({customer: "Edward Gorey", date: "2017-09-26"})
      test_product = Product.create({description: "Fainting couch", price: 2000.00, purchase_id: test_purchase.id})
      expect(test_product.purchase).to eq(test_purchase)
    end
  end

  describe('.available') do
    it "returns all products not assigned to an order" do
      test_purchase = Purchase.create({customer: "Edward Gorey", date: "2017-09-26"})
      test_product_1 = Product.create({description: "Fainting couch", price: 2000.00, purchase_id: test_purchase.id})
      test_product_2 = Product.create({description: "Fainting chair", price: 1200.00})
      expect(Product.available).to eq([test_product_2])
    end
  end

  describe('.unavailable') do
    it "returns all products assigned to an order" do
      test_purchase = Purchase.create({customer: "Edward Gorey", date: "2017-09-26"})
      test_product_1 = Product.create({description: "Fainting couch", price: 2000.00, purchase_id: test_purchase.id})
      test_product_2 = Product.create({description: "Fainting chair", price: 1200.00})
      expect(Product.unavailable).to eq([test_product_1])
    end
  end
end
