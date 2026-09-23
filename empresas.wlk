import universidades.*
import profesionales.*
import solicitantes.*

class Empresa {
  const profesionales = #{}
  const honorarioDeReferencia
  const clientes = #{}
  
  method profesionales() = profesionales
  
  method contratar(profesional) = profesionales.add(profesional)
  
  method despedir(profesional) = profesionales.remove(profesional)
  
  method cuantosDeLaUniversidad(unaUniversidad) = profesionales.count(
    { p => p.universidad() == unaUniversidad }
  )
  
  method universidadesFormadoras() = profesionales.map(
    { p => p.universidad() }
  ).asSet()
  
  method profesionalesCaros() = profesionales.filter(
    { p => p.honorarios() > honorarioDeReferencia }
  )
  
  method profesionalMasBarato() = profesionales.min({ p => p.honorarios() })
  
  method esGenteAcotada() = profesionales.all(
    { p => p.cantidadDeProvinciasHabilitadas() <= 3 }
  )
  
  method puedeSatisfacer(solicitante) = profesionales.any(
    { p => solicitante.puedeSerAtendidoPor(p) }
  )
  
  method darServicio(solicitante) {
    if (self.puedeSatisfacer(solicitante)) {
      const profesionalElegido = profesionales.find(
        { p => solicitante.puedeSerAtendidoPor(p) }
      )
      profesionalElegido.recibirPago(profesionalElegido.honorariosPorHora())
      clientes.add(solicitante)
    }
  }
  
  method cantidadDeClientes() = clientes.size()
  
  method tieneComoClienteA(unCliente) = clientes.contains(unCliente)
  
  method esPocoAtractivo(
    unprofesional
  ) = unprofesional.provinciasHabilitadas().all(
    { p => self.hayReemplazoMasBarato(p, unprofesional) }
  )
  
  method hayReemplazoMasBarato(
    provincia,
    unprofesional
  ) = self.profesionalesMismaProv(unprofesional).any(
    { p => p.provinciasHabilitadas().contains(
        provincia
      ) && (p.honorarios() < unprofesional.honorarios()) }
  )
  
  method profesionalesMismaProv(unprofesional) = profesionales.filter(
    { p => (p != unprofesional) && (!p.provinciasHabilitadas().intersection(
        unprofesional.provinciasHabilitadas()
      ).isEmpty()) }
  )
}