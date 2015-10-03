#!/usr/bin/env ruby
# -*- coding: utf-8-*-
=begin
The MIT License (MIT)
Copyright (c) 2015 Kodai Takahashi.
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
=end

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
