require 'spec_helper'

describe(Client) do

  describe('#name') do
    it("returns the client's name") do
      client = Client.new({:name => "Gene", :id => nil})
      expect(client.name()).to(eq("Gene"))
    end
  end
end
