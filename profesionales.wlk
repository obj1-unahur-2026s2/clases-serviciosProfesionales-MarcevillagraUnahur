import universidades.*

class Profesional {
  const universidad
  const tipoDeProfesional
  const provincias = #{}
  const honorariosPorHora = 0
  var recaudacion = 0
  
  method universidad() = universidad
  method provincias() = provincias
  method honorariosPorHora() = honorariosPorHora
  method honorarios() = tipoDeProfesional.honorariosRecomendados(self)
  method provinciasHabilitadas() = tipoDeProfesional.provincias(self)    
  method cantidadDeProvinciasHabilitadas() = self.provinciasHabilitadas().size()
  method sumarRecaudacion(cantidad) {
    recaudacion += cantidad
  }
  method restaRecaudacion(cantidad) {
    recaudacion -= cantidad
  }
  method recaudacion() {
    return recaudacion
  }
  method recibirPago(cantidad) {
    tipoDeProfesional.recibirPagos(self,cantidad)
  }
  method transferirDineroA(otroProfesional, cantidad) {
    tipoDeProfesional.transferirDineroA(self,otroProfesional,cantidad)
  }
}

object vinculado {
  method provincias(profesional) = #{profesional.universidad().provincia()}
  
  method honorariosRecomendados(
    profesional
  ) = profesional.universidad().honorariosRecomendados()

  method recibirPagos(profesional,cantidad) {
    profesional.universidad().recibirDonacion(cantidad/2)
  }
  method transferirDineroA(unProfesional,otroProfesional, cantidad) {}
}

object asociadosDelLitoral {
  method provincias(profesional) = #{"Entre Rios", "Santa Fe", "Corrientes"}
  
  method honorariosRecomendados(profesional) = 3000
  method recibirPagos(profesional,cantidad) {
    asocDelLitoral.recibirDonaciones(cantidad)
  }
  method transferirDineroA(unProfesional,otroProfesional, cantidad) {}
}

object libre {
  method provincias(profesional) = profesional.provincias()
  method honorariosRecomendados(profesional) = profesional.honorariosPorHora()
  method recibirPagos(profesional,cantidad) {
    profesional.sumarRecaudacion(cantidad)
  }
  method transferirDineroA(unProfesional,otroProfesional, cantidad) {
    otroProfesional.sumarRecaudacion(cantidad)
    unProfesional.restaRecaudacion(cantidad)
  }
}