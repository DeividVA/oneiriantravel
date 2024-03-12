// Global variables
VAR DreamPoints = 5
VAR Need = ""
VAR Count = 0

-> start_knot

=== start_knot ===

0- AUSENCIA DE LUZ
LUGAR DESCONOCIDO
???: Axel... Axel... ¡Ayuda, Axel! Las... mane... cillas... la es... fera...

-> wakefulness_knot

=== wakefulness_knot ===

I- VIGILIA
PUERTO VIEJO, CALLES
Otro día más en Puerto Viejo.
Otra Navidad más en Puerto Viejo.
Estoy cansado de esta ciudad.
Para colmo se me ha vuelto a estropear el coche.
Y tengo que ir andando a la cena de Navidad de la empresa.
Justo hoy, que hablaremos de los planes de importación del año que viene.
Es importante que esté presente. Me juego el ascenso.
Aggh... este dolor de cabeza...
...
Ummm... ¿Y ese gato?

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
 {not ignorecat:
 ~DreamPoints += 1
 }

Tienes {DreamPoints} puntos de sueño.

(El gato se aleja un par de metros y vuelve a mirarle, como queriendo que le siga) 
Dios, maldito gato, voy a tener que correr.
(Sale corriendo, el gato le persigue)
¿Pero se puede saber qué quieres?
Gato: Miau.
(El gato se mete por una callejuela y se vuelve a mirarle).
Al final voy a llegar tarde. ¿Qué narices quieres ahí dentro?
(Llega al final de la callejuela).
Esto... esto es... el barrio del muro...
Recuerdo jugar aquí de pequeño con Elena y Jorge.
Qué lástima que tenga que irse.
No voy a poder despedirme de él. Estaré muy ocupado estos días antes de que se vaya.
Gato: Miau.
A ver... ¿qué quieres tú...?
(El gato se acerca a un bidón de basura abierto. Hay un reloj dentro).
Gato: Miau.
Un momento... Este reloj...
Este reloj es igual que el que tenía de pequeño, el que me regalaron mis amigos en mi cumpleaños.
Dios, debía tener diez años o menos.
Parece que este ha perdido la correa.
Siento la tentación de acercarme y cogerlo. Pero tal como está la ciudad hoy en día, quién sabe lo que pueden haber echado ahí.

-> clockchoice_knot

=== clockchoice_knot ===

 * Debería irme. 
 -> leaveclock
 * Debería cogerlo.
 -> takeclock
 
 === leaveclock ===
~DreamPoints -= 1
Voy a llegar tarde y no pienso meter las manos en un cubo de basura.
No puedo perder más el tiempo aquí. En veinte minutos va a empezar la cena.
Vamos, vamos...
-> continue
 
 === takeclock ===
 ~DreamPoints += 1
 Era justo este modelo. Es increíble. Qué recuerdos. Recuerdo la esfera redondeada y estas manecillas con el pingüino y la morsa...
  Tengo que llevármelo. Ya veré después qué hago con él.
 (Lo guarda en el bolsillo de la chaqueta)
-> continue

=== continue ===

Tienes {DreamPoints} puntos de sueño.
Agh, ¿qué me pasa...? Me estoy empezando... a sentir... marea... do...
(Cae al suelo de rodillas, la pantalla se pone en negro)

-> sleepN1_knot

=== sleepN1_knot ===
SUEÑO N1
PUERTO VIEJO, BARRIO DEL MURO
Este es el nivel de sueño sleep N1: Adormecimiento

(Se empieza a despertar lentamente, la pantalla pasa de estar borrosa a nítida)
Uf...
Uf...
¿Qué... qué... me ha pasado?
¿Debería ir al médico? No, no puedo... Creo que estoy bien.
Y la reunión es demasiado importante para mi reputación.
¿Dónde está... el gato?
Agh... Son ya las nueve. Tengo que irme corriendo.

???: Vaya, vaya... Al fin me hiciste caso. ¿Qué tal, amigo?

(Se va corriendo, llega a la puerta del restaurante)

Aquí es. "La Sardina Indiscreta". Vaya nombre...
???: Vaya, vaya... Al fin me hiciste caso. ¿Qué tal, amigo?
¿Eh? Ho... hola. ¿Quién eres?
???: ¿Cómo que quién eres? Ja, ja, ja... ¿Es que no te acuerdas de tu Cheese?

¿Cheese?


-> cheese_choice

=== cheese_choice ===

    * La verdad es que no caigo ahora mismo. Refréscame la memoria.
    -> dunno
    * ¿Qué clase de nombre es ese?
    -> what
    * Sí, sí que me acuerdo.
    -> yeah

    === dunno ===
    ~DreamPoints += 0
    Cheese: Hmm. Sinceridad ante todo, ¿eh?
    -> continue2
    === what ===
    ~DreamPoints += 1
    Cheese: Ja, ja, ja. Me gusta tu sentido del humor.
    -> continue2
    === yeah ===
    ~DreamPoints -= 1
    Cheese: Agh. Se te nota que mientes.
    -> continue2

=== continue2 ===
Cheese:
Cheese: Y cuéntame, ¿qué tal todo?
Cheese: ¿Tus padres? ¿Tus amigos Elena y Jorge? ¿Tu trabajo y tu compañero?
-> interest_choice

=== interest_choice ===
Cheese: ...
* Hablar sobre mis amigos.
-> friends
* Hablar sobre mis compañeros de trabajo.
-> pals
* Hablar sobre mis padres.
-> momdad

    === friends ===
    Pues bien.
    ~Need = "cuero"
    ~Count += 1
    {Count:
        -3: -> endconver
    }
    -> interest_choice


    === pals ===
    Pues bien.
    ~Need = "metal"
    ~Count += 1
    {Count:
        -3: -> endconver
    }
    -> interest_choice

    === momdad ===
    Pues bien.
    ~Need = "caucho"
    ~Count += 1
    {Count:
       -3: -> endconver
    }
    -> interest_choice

    === endconver ===
    -> continue3



=== continue3 ===
Tienes {DreamPoints} puntos de sueño.
Cheese: Bueno te veré dentro, amigo.
Cheese: Una última cosa: cuida bien lo que guardas en el bolsillo de tu chaqueta... ja, ja, ja...
 {not takeclock:
 Hmmm... ¿Qué es esto?
 ¿Por qué tengo el reloj en el bolsillo?
 }
 ¿Qué? ¿Por qué tiene una correa de {Need}? 
 Cheese: Ciaooo...
 Cheese: Vaya, qué oscuro está aquí dentro...
(Cheese desaparece en la oscuridad del restaurante. La puerta se cierra).
Vaya personaje más extraño.
Supongo que tendré que entrar.
En fin, vaya nochecita. ¿Y por qué está esto tan oscuro? 
¿Pero qué?

(El interior es enorme y parece no haber paredes, solo está iluminado por unas antorchas lejanas que parecen flotar en el aire)


-> sleepN2_knot


=== sleepN2_knot ===
SUEÑO N2
MUNDO ONÍRICO, TEMPLO
Este es el nivel de sueño sleep N2: Sueño Ligero

-> sleepN3_knot

=== sleepN3_knot ===
SUEÑO N3
MUNDO ONÍRICO, PLAYA
Este es el nivel de sueño sleep N3: Sueño Profundo

-> REM_knot

=== REM_knot ===
REM
MUNDO ONÍRICO, CAOS
Este es el nivel de sueño REM

-> awake_knot

=== awake_knot ===
 DESPERTAR
 Este es el despertar


-> DONE //done del final de la historia

    -> END