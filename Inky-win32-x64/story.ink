// Global variables
VAR DreamPoints = 10

-> start_knot

=== start_knot ===
VIGILIA
PUERTO VIEJO, CALLES
Otro día más en Puerto Viejo.
Otra Navidad más en Puerto Viejo.
Estoy cansado de esta ciudad.
Para colmo se me ha vuelto a estropear el coche.
Y tengo que ir andando a la cena de Navidad de la empresa.
Justo hoy, que tengo que presentar los planes de importación del año que viene.
Es importante que esté presente. Me juego el ascenso.
¿Y ese gato?

-> catchoice_knot

=== catchoice_knot ===
¿Por qué me mira fijamente?

 * Ignorar y continuar el camino.
 -> ignorecat
 * Mirar.
 -> lookatcat
 
 === ignorecat ===

~DreamPoints -= 1

¿Pero bueno? ¿Otra vez estás aquí? ¿Qué quieres?

-> catchoice_knot

-> DONE

 === lookatcat ===

Lo miro. Se aleja unos metros y vuelve a mirarme. Lo sigo.
Tienes {DreamPoints} puntos de sueño.

-> sleepN1_knot

=== sleepN1_knot ===
SUEÑO N1
Este es el nivel de sueño sleep N1: Adormecimiento

-> sleepN2_knot

=== sleepN2_knot ===
SUEÑO N2
Este es el nivel de sueño sleep N2: Sueño Ligero

-> sleepN3_knot

=== sleepN3_knot ===
SUEÑO N3
Este es el nivel de sueño sleep N3: Sueño Profundo

-> REM_knot

=== REM_knot ===
REM
Este es el nivel de sueño REM

-> awake_knot

=== awake_knot ===
 DESPERTAR
 Este es el despertar


-> DONE //done del final de la historia

    -> END