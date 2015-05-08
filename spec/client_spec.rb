require 'spec_helper'

describe(Client) do

  describe('#name') do
    it("returns the client's name") do
      client = Client.new({:name => "Gene", :id => nil})
      expect(client.name).to(eq("Gene"))
    end
  end

  describe("#id") do
    it("sets the id when you save it") do
      client = Client.new({:name => "Gene", :id => nil})
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
      test_client = Client.new({:name => "Robert", :id => nil})
      test_client.save
      test_client2 = Client.new({:name => "Sam", :id => nil})
      test_client2.save
      expect(Client.find(test_client2.id)).to(eq(test_client2))
    end
  end

  describe("#==") do
    it("is the same client if it has the same name and id") do
      client = Client.new({:name => "Gene", :id => nil})
      client2 = Client.new({:name => "Gene", :id => nil})
      expect(client).to(eq(client2))
    end
  end

  describe("#update") do
    it("lets you update clients in the database") do
      client = Client.new({:name => "Gene", :id => nil})
      client.save
      client.update({:name => "Frank"})
      expect(client.name).to(eq("Frank"))
    end
  end

  describe("#delete") do
    it("lets you delete a client from the database") do
      client = Client.new({:name => "Gene", :id => nil})
      client.save
      client2 = Client.new({:name => "Frank", :id => nil})
      cient2.save
      client.delete
      expect(Client.all).to(eq(client2))
    end
  end
end
