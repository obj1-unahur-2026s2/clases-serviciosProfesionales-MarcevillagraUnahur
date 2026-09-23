import profesionales.*
import universidades.*

class Persona {
  const provincia
  
  method puedeSerAtendidoPor(profesional) = profesional.provinciasHabilitadas().contains(
    provincia
  )
}

class Institucion {
  const universidadesReconocidas = #{}
  
  method agregarUniversidad(unaUniversidad) {
    universidadesReconocidas.add(unaUniversidad)
  }
  
  method puedeSerAtendidoPor(profesional) = universidadesReconocidas.contains(
    profesional.universidad()
  )
}

class Club {
  const provincias = #{}
  
  method agregarProvincia(unaProvincia) {
    provincias.add(unaProvincia)
  }
  
  method puedeSerAtendidoPor(profesional) = profesional.provinciasHabilitadas().any(
    { p => provincias.contains(p) }
  )
}