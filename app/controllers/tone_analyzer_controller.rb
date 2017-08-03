class ToneAnalyzerController < ApplicationController

  def tone

    description = params[:description]
    authentication = {
      username: ENV["IBM_WATSON_ID"],
      password: ENV["IBM_WATSON_SECRET"],
    }

    tone = HTTParty.post("https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-19", {
      basic_auth: authentication,
      headers: { "Accept" => "application/json" , "Content-type" => "text/plain;charset=utf-8" },
      body: { "text" =>   description }
      }).parsed_response

      render json: tone

      puts tone
  end

end
