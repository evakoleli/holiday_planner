class TravelsController < ApplicationController
  def index
    country = ISO3166::Country.all[Random.rand(ISO3166::Country.all.count)]

    @long = string_to_value(country.longitude, ['W','E'])
    @lat = string_to_value(country.latitude, ['S','N'])
    @destination = country
  end

  private

  def string_to_value(string, dir)
    if string.include? dir[0]
      value = - string.gsub(" #{dir[0]}",'').gsub(" #{dir[1]}",'').gsub(' ','.').to_f
    else
      value = string.gsub(" #{dir[0]}",'').gsub(" #{dir[1]}",'').gsub(' ','.').to_f
    end
  end
end
