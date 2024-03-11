¿Y ese gato?

VAR points = 10

-> inicio

=== inicio ===

 * Lo  ignoro y continúo mi camino.
 -> ignoragato
 * Lo miro
 -> miragato
 
 === ignoragato ===

~points -= 1

El gato me sigue.

-> inicio

-> DONE

=== miragato ===

Lo miro. Se aleja unos metros y vuelve a mirarme. Lo sigo.

-> DONE

    -> END
