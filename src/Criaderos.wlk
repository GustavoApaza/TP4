class Perro {
	const property esHembra = 0.randomUpTo(2).roundUp() > 1
    	var property velocidad
    	var property fuerza
    	var property adulto = false
    	method status() = self.fuerza() + self.velocidad()
}
class Criadero{
	const jauria = []
	const hembra = jauria.anyOne()
	const macho = jauria.anyOne()
	const sonAdultos = hembra.adulto() && macho.adulto()
	method recibirPerro(perro) = jauria.add(perro)
	method perros() = jauria.asSet()
	method cruzar(estrategia)
	
}
class CriaderoResponsable inherits Criadero{
	
}
class CriaderoIrresponsable inherits Criadero{
	override method cruzar(estrategia){
		if(hembra.esHembra() == 2 && macho.esHembra() == 1 && sonAdultos){
			self.recibirPerro(estrategia.criaResultante(macho, hembra))
		}else{
			self.abandonarPerro(macho)
			self.abandonarPerro(hembra)
		}
	}
	method abandonarPerro(perro) = jauria.remove(perro)
}
// =======================================================================
// ESTRATEGIAS DE CRUZA
// =======================================================================
object cruzaPareja{
	method criaResultante(macho, hembra){
		const cria = new Perro(
			velocidad = (macho.velocidad() + hembra.velocidad()) /2,
			fuerza = (macho.fuerza() + hembra.fuerza()) /2,
			adulto = false
		)
		return cria
	}
}
object hembraDominante{
	method criaResultante(macho, hembra){
		const cria = new Perro(
			velocidad = hembra.velocidad() + 0.05*macho.velocidad(),
			fuerza = hembra.fuerza() + 0.05*macho.fuerza(),
			adulto = false
		)
		return cria
	}
	method fuerzaHembraSuperior(hembra, macho) = hembra.fuerza() > macho.fuerza()
}
object underdog{
	method criaResultante(macho, hembra){
		const cria = new Perro(
			velocidad = hembra.velocidad().min(macho.velocidad()) * 2,
			fuerza = hembra.fuerza().min(macho.fuerza()) * 2,
			adulto = false
		)
		return cria
	}
}
///////////////////
// Completar acá los métodos para crear los criaderos en base a tu modelo

object creadorDeCriaderos {
	method crearCriaderoIrresponsable() = "CAMBIAME"
	method crearCriaderoResponsable() = "CAMBIAME"
}