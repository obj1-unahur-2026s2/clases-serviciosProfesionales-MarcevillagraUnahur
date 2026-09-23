class Universidad {
  const provincia
  const honorariosRecomendados
  var donaciones = 0
  
  method provincia() = provincia
  
  method honorariosRecomendados() = honorariosRecomendados
  
  method recibirDonacion(cantidad) {
    donaciones += cantidad
  }
  
  method donaciones() = donaciones
}

object asocDelLitoral {
  var donaciones = 0
  
  method recibirDonaciones(cantidad) {
    donaciones += cantidad
  }
  
  method donaciones() = donaciones
}