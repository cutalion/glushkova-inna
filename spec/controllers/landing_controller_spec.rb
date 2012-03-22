require 'spec_helper'

describe LandingController do
  describe "#index" do
    before { get :index                   }
    it     { should respond_with :success }
    it     { should assign_to :albums     }
  end
end
