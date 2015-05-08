require 'spec_helper'

describe(Client) do

  describe('#name') do
    it("returns the client's name") do
      client = Client.new({:name => "Gene", :stylist_id => 1})
      expect(client.name).to(eq("Gene"))
    end
  end

  describe("#id") do
    it("sets the client's stylist_id") do
      client = Client.new({:name => "Gene", :stylist_id => 1})
      expect(client.stylist_id).to(eq(1))
    end
  end

  describe("#save") do
    it("sets the id when you save it") do
      client = Client.new({:name => "Gene", :stylist_id => 1})
      client.save
      expect(client.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".all") do
    it("starts off with no clients") do
      expect(Client.all).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a client by its ID number") do
      test_client = Client.new({:name => "Robert", :stylist_id => 1})
      test_client.save
      test_client2 = Client.new({:name => "Sam", :stylist_id => 1})
      test_client2.save
      expect(Client.find(test_client2.id)).to(eq(test_client2))
    end
  end

  describe("#==") do
    it("is the same client if it has the same name and id") do
      client = Client.new({:name => "Gene", :stylist_id => 1})
      client2 = Client.new({:name => "Gene", :stylist_id => 1})
      expect(client).to(eq(client2))
    end
  end

  describe("#update") do
    it("lets you update clients in the database") do
      client = Client.new({:name => "Gene", :stylist_id => 1})
      client.save
      client.update({:name => "Frank"})
      expect(client.name).to(eq("Frank"))
    end
  end

  describe("#delete") do
    it("lets you delete a client from the database") do
      client = Client.new({:name => "Gene", :stylist_id => 1})
      client.save
      client2 = Client.new({:name => "Frank", :stylist_id => 1})
      client2.save
      client.delete
      expect(Client.all).to(eq([client2]))
    end
  end
end
