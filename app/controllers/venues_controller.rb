class VenuesController < ApplicationController

    get "/" do
        { message: "Sup" }.to_json
      end
      
end
