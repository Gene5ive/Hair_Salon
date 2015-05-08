require 'spec_helper'

describe(Stylist) do

  describe('#name') do
    it("returns the stylist's name") do
      stylist = Stylist.new({:name => "Gene", :id => nil})
      expect(stylist.name).to(eq("Gene"))
    end
  end

  describe("#id") do
    it("sets the id when you save it") do
      stylist = Stylist.new({:name => "Gene", :id => nil})
      stylist.save
      expect(stylist.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".all") do
    it("starts off with no clients") do
      expect(Stylist.all).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a stylist by its ID number") do
      test_stylist = Stylist.new({:name => "Robert", :id => nil})
      test_stylist.save
      test_stylist = Stylist.new({:name => "Sam", :id => nil})
      test_stylist.save
      expect(Stylist.find(test_stylist.id)).to(eq(test_stylist))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same name and id") do
      stylist = Stylist.new({:name => "Gene", :id => nil})
      stylist2 = Stylist.new({:name => "Gene", :id => nil})
      expect(stylist).to(eq(stylist2))
    end
  end

  describe("#update") do
    it("lets you update clients in the database") do
      stylist = Stylist.new({:name => "Gene", :id => nil})
      stylist.save
      stylist.update({:name => "Frank"})
      expect(stylist.name).to(eq("Frank"))
    end
  end

  describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist = Stylist.new({:name => "Gene", :id => nil})
      stylist.save
      stylist2 = Stylist.new({:name => "Frank", :id => nil})
      stylist2.save
      stylist.delete
      expect(Stylist.all).to(eq([stylist2]))
    end
  end
end
