# Importamos el metodo
require_relative 'clima_methods'

# Saludo
puts "Hola esto es una app del clima 🌤️"
consultas = []

continuar = true

while continuar
  # Ingresa la ciudad
  puts "\nIngresa la ciudad:"
  ciudad = gets.chomp

  # crear un hash
  temperatura = obtener_clima(ciudad)

  # Llamando a la función
  mostrar_recomendacion(temperatura)

  # Guardar la consulta en un arreglo
  consulta = { ciudad: ciudad, temperatura: temperatura }
  consultas << consulta
  guardar_en_archivo(consulta[:ciudad], consulta[:temperatura])

  # Pregunta si quiere continuar
  puts "\n¿Quieres ingresar otra temperatura 🌡️? (si/no)"
  respuesta = gets.chomp.downcase
  continuar = respuesta == "si"
end

puts "El reporte del clima a terminado 👩‍🔧"