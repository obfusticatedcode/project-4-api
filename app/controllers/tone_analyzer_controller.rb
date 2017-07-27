class ToneAnalyzerController < ApplicationController

  def tone
    authentication = {
      username: ENV["IBM_WATSON_ID"],
      password: ENV["IBM_WATSON_SECRET"],
    }

    tone = HTTParty.post("https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-19", {
      basic_auth: authentication,
      headers: { "Accept" => "application/json" , "Content-type" => "text/plain;charset=utf-8" },
      body: { text: "Product sales have been great and we're so happy and excited for the past three quarters.Joy comes in the morning" }
      }).parsed_response

      render json: tone
  end
end
