require 'csv'
require 'net/http'
require 'json'

def obtener_clima(ciudad)
  api_key = "416d61cf84dff5e1074b6bff040d0caa"
  url = "http://api.openweathermap.org/data/2.5/weather?q=#{ciudad}&appid=#{api_key}&units=metric"
  uri = URI(url)
  response = Net::HTTP.get(uri)
  data = JSON.parse(response)
  return data['main']['temp']
end

def mostrar_recomendacion(temperatura)
  if temperatura >= 30
    puts "Estamos a #{temperatura}. Hace mucho calor, usa protector solar 🥵"
  elsif temperatura >= 20
    puts "Estamos a #{temperatura}. Hace un clima agradable para salir 😊"
  else
    puts "Estamos a #{temperatura}. Hace mucho frio, lleva un abrigo 🥶"
  end
end

def guardar_en_archivo(ciudad, temperatura)
  CSV.open("data.csv", "a+") do |csv|
    csv << [ciudad, temperatura, Time.now]
  end
end

