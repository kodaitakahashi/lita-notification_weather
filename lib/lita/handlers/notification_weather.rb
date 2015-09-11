# -*- coding: utf-8 -*-
module Lita
  module Handlers
    class NotificationWeather < Handler
      require 'json'
      require 'open-uri'
      route /^w_now/, :get_Weather, help:{"w_now" => "Rain notification"}

      def get_Weather(response)
        response.reply "大阪府大東市"
        uri = 'http://api.openweathermap.org/data/2.5/weather?q=daito,jp'
        result = JSON.load(open(uri).read)
        weather_now = result["weather"][0]["main"]
        response.reply "現在の天気 #{weather_now}"
        weather_now_desc = result["weather"][0]["description"]
        response.reply "詳細 #{weather_now_desc}"
        humidity_now = result["main"]["humidity"]
        response.reply "湿気 #{humidity_now}%"
      end
    end
      Lita.register_handler(self)
  end
end
