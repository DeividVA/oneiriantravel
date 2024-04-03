// Global variables
VAR DreamPoints = 5
VAR Need = ""
VAR Count = 0

-> start_knot

=== start_knot ===

0- AUSENCIA DE LUZ
LUGAR DESCONOCIDO
???: Alex... Alex... ¡Ayuda, Alex! Las... mane... cillas... la es... fera...

-> wakefulness_knot

=== wakefulness_knot ===

I- VIGILIA
PUERTO VIEJO, CALLES
Otro día más en Puerto Viejo.
Otra Navidad más en Puerto Viejo.
Estoy cansado de esta ciudad.
Para colmo se me ha vuelto a estropear el coche.
Y tengo que ir andando a la cena de Navidad de la empresa.
Justo hoy, que hablaremos de los planes de importación del año que viene. Y estaba invitado el pez gordo aquel de New Port.
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

(El gato le persigue y maúlla)

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
Esto... esto es... el Barrio del Muro...
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
Siento la tentación de acercarme y cogerlo. Pero tal como está la ciudad hoy en día, quién sabe lo que pueden haber echado ahí. Fentanilo o algo peor.

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
SUEÑO N1 (NUMBNESS)
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

Aquí es. ¿"La Sardina Indiscreta"? Vaya nombre...
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
    * Sí, claro, sí que me acuerdo.
    -> yeah

    === dunno ===
    ~DreamPoints += 0
    Cheese: Hmm. Sinceridad ante todo, ¿eh?
    -> continue2
    === what ===
    ~DreamPoints += 1
    Cheese: Ja, ja, ja. Me gusta tu sentido del humor. Has ganado en ironía con los años.
    -> continue2
    === yeah ===
    ~DreamPoints -= 1
    Cheese: Agh. Se te nota que mientes.
    -> continue2

=== continue2 ===
Disculpa es que creo que no te conozco. Aunque tengo la sensación de que te he visto antes en alguna parte.
Cheese: Hmm... más bien la cuestión es que no me recuerdas, pero no te diste cuenta todavía. Pero date tiempo, amigo. Aunque creo que tiempo es lo que te falta ahora mismo. ¿No se te quita de la cabeza esa reunión de negocios, verdad?
(¿Cómo puede este tipo saber toda mi vida?)
Cheese: Ja, ja, tranquilo... Dejemos al tiempo que sea quien me descubra.
(Qué forma de hablar más extraña. Pero no sé por qué, de algún modo parece que me es familiar. ¿Será alguien del colegio, de cuándo era pequeño?)
...
Cheese: Y cuéntame, ¿qué tal todo?
Cheese: ¿Tus padres? ¿Tus amigos Elena y Jorge? ¿Tu trabajo y tu compañero Isaac?
-> interest_choice

=== interest_choice ===
(No sé quién es este tipo y por qué sabe tanto de mí, pero una fuerza extraña me incita a hablar)
* Hablar sobre mis amigos.
-> friends
* Hablar sobre mis compañeros de trabajo.
-> pals
* Hablar sobre mis padres.
-> momdad

    === friends ===
    Pues, eh, bien. Jorge se marcha ahora a Suecia. Va a pasar frío allí... je, je.
    (¿Pero qué estoy diciendo?)
    En realidad, hace tiempo que no los veo. Pero es que la agenda está demasiado apretada. Y desde lo que pasó la última vez. La época en que ellos dos estaban enrollados... Entre eso y mi trabajo nos distanciamos bastante. Y aquella maldita pelea. No quiero ni acordarme... Y ojalá hubiera sido más sincero con Elena.
    (¿Pero por qué hablo de esto con un desconocido?)
    En fin...
        ~Need = "cuero"
    ~Count += 1
    {Count:
        -3: -> endconver
    }
    -> interest_choice


    === pals ===
    Pues, eh, bien. La verdad es que es un tipo muy competente. Desde que entró la productividad de la empresa subió un 170%.
    (¿Qué haces? ¡Eso es confidencial!)
    Hicieron bien en contratarle, porque yo estaba desbordado. Pero lo cierto es que empecé a sentir envidia. Además es un tanto arrogante.
    Solo que luego me empezó a contar de sus problemas, y empezamos a caernos bien. Teníamos más cosas en común de lo que pensábamos.
    Incluso es de los Sharks como yo.
    (¿Pero por qué le cuento esto?)
    En fin...
    ~Need = "metal"
    ~Count += 1
    {Count:
        -3: -> endconver
    }
    -> interest_choice

    === momdad ===
    Pues, eh, bien. Los dos con sus achaques. Pero son pequeños. Bueno, lo de Papá... Por suerte parece que fue solo un susto.
    (¿Pero qué le importa esto a este tipo?
    Está igual de terco que siempre, y eso me tranquiliza. Mira que me peleaba antes con él. Pero ahora cada vez lo echo más de menos. Ojalá pudiera ir más veces los fines de semana.
    Mamá tan cariñosa como siempre. Aunque ahora toca menos el piano y eso me preocupa.
    Recuerdo cuando era pequeño y tocaba para mí. Me relajaba los días que me hacía pis en la cama.
    (Dios, esto es demasiado personal)
    En fin...
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
Aggh... me ha vuelto el dolor de cabeza.
Cheese: Está bien. No te apures, déjalo estar. Se te nota en la cara que no lo estás pasando bien con las prisas. Y después de estar un rato inconsciente.
¿Qué? ¿He estado inconsciente? ¿Y cómo lo sabes?
Cheese: Bueno te veré dentro, amigo.
Espera...
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
(Solo se escuchan el sonido de tus pasos, como si estuvieras dentro de un enorme vaso hueco)

-> sleepN2_knot


=== sleepN2_knot ===
SUEÑO N2 (LIGHT SLEEP)
MUNDO ONÍRICO, TEMPLO
Este es el nivel de sueño sleep N2: Sueño Ligero

(En el fondo hay una especie de mesa o altar iluminado por un foco en el techo. Cuando te acercas, ves que hay una extraña comida encima y dos personajes a su alrededor. Cada uno con un libro idéntico y los dos los consultan cada vez que hablan)

???: ...
???: Gladhweg gladhweg
???: Color del fuego de la serendipia.
???: ...
???: Elen síla lúmenn' omentielvo
???: Uuuuuh, flores del viento emergen


Eeeh, eehh, ¿me está hablando a mí?

-> oneirian_question

=== oneirian_question ===

    (Pero qué son estas criaturas. Improvisa algo. ¡Rápido!)

    * (...)
    -> silence
    * Azutu karaka yodolai penten?
    -> invent
    * Lo... lo siento, no la entiendo.
    -> sosorry
    * Eh... eh... Flores...
    -> lucky

    === silence ===
    ~DreamPoints -= 1
    -> continue4
    === invent ===
    ~DreamPoints -= 1
    -> continue4
    === sosorry ===
    ~DreamPoints += 0
    -> continue4
    === lucky ===
    ~DreamPoints += 1
    -> continue4
    

=== continue4 ===

Tienes {DreamPoints} puntos de sueño.
Cheese: Uhuh, uhuh, uhuh. Espera, espera, espera...
{lucky:
Cheese: Esta vez has tenido suerte, pero...
}
{not lucky:
Cheese: Es de mala educación quedarse callado, inventarse palabras...
}
Cheese: Vas a necesitar esto.
{DreamPoints:
    -1: Cheese: O lo vas a pasar mal.
}
(Has obtenido Diccionario Onírico Multilingüe)
Cheese: Y bien, amigo, bienvenido a tu cena de empresa.
¿Quéee? ¿Pero qué es esta locura? Estoy soñando, ¿verdad?
Cheese: Tranquilo, no tendrás que estar mirándolo todo el tiempo.
¿Se supone que ahora puedo mantener una conversación con estas... cosas?
Cheese: Ojo, van a oírte. Pero bueno, detuve el tiempo por ti... solo un poquito...
Oye, ¿qué es este sitio?
Cheese: Ah, ah... Ahora no... No puedo estar mucho tiempo pulsando el botón de pausa.
Cheese: Tú déjate llevar...
¿Qué???

(Los tres personajes ya no tienen libros)
???: Alex, no has probado tu vino. ¿O es que prefieres otra cosa? ¿Un refresco, quizás?
No, señora Cruz.
(¿Qué? ¿Por qué la he llamado como mi jefa?)
Sra. Cruz: Bien, se te ve pálido. Prúebalo, entrarás en calor. Mira a Juan, ya se ha tomado unas cuantas.
Sr. Florián: Solo han sido dos... y media.
Sra. Cruz: Ja, ja, ja...
Sra. Cruz: Añade a eso la copa de burbrujilda que te tomaste antes de que yo llegara.
(¿Burbu qué? Esto cada vez es más raro...)
(¿Realmente esto es mi cena de empresa? ¿Dónde están mis compañeros?)
Sra. Cruz: Oh, pero deja que te presente al señor Oddstrong.
Oddstrong: ...
En... encantado...
Oddstrong: ...
Oddstrong: ...
Oddstrong: ...
(¿Pero por qué no habla este tipo?) 
(Esa cabeza me da escalofríos)
Sra. Cruz: Ja, ja, ja... usted siempre tan ingenioso, señor Oddstrong.
Sra. Cruz: ¿Verdad que es divertido, Alex?

-> oddstrong

    === oddstrong ===
    * Mostrarse extrañado
    -> doubt
    * Mostrarse risueño
    -> laugh

    === doubt ===
    ~DreamPoints += 2
    Eh... supongo que sí.
    -> continue5
    === laugh ===
    ~DreamPoints += 1
    Qué gracioso, sí
    -> continue5

    === continue5 ===
    Tienes {DreamPoints} puntos de sueño.
    Sra. Cruz: Sé que no es fácil pillarle el humor al señor Oddstrong, pero ya le irás entendiendo
    Claro. Es un honor tenerle aquí señor Oddstrong.
    (Pero, ¿por qué he dicho eso?)
    (Es como si mi boca hablara sola)
    (¿Acaso me estoy empezando a sentir tranquilo entre estos seres?)
    Oddstrong: ...
    Sr. Florián: Ja, ja, cierto. Usted siempre tan al grano, señor Oddstrong. Se le nota la vena nuevaportina.
    Sra. Cruz: New Porter, Juan, no seas palurdo. Ya conoce sus modales puertovejeros, señor Oddstrong.
    Sra. Cruz: Pero bueno, Alex, te ha comido la lengua el gato. Estamos esperando tus informes. El señor Oddstrong está muy interesado en participar en nuestra empresa.
    Oddstrong: ...
    Sí. Enseguida.
    (He vuelto a hacerlo. Siento como si estuviera viendo una película).
    (Abres tu maletín, pero solo hay dibujos infantiles que hiciste de niño).
    ¿Qué? ¿De dónde sale esto?
    (Vaya, parece que la película ha parado. Tengo que hacer algo.)
    -> papers

    === papers ===
    * Hacer como si nada y hablar de negocios
    -> act_normally
    * Hablar de los dibujos
    -> drawings
    * Excusarse
    -> excuse
    
    === act_normally ===
    ~DreamPoints += 1
    Como puede ver en esta gráfica, hemos incrementado.
    -> continue6
    === drawings ===
    ~DreamPoints += 2
    En este dibujo de aquí.
    -> continue6
    === excuse ===
    ~DreamPoints -= 1
    No, no puedo creerlo.
    -> continue6
    
    
    === continue6 ===
    Tienes {DreamPoints} puntos de sueño.
    (Vas barajando dibujos mientras hablas. La imagen se dirige hacia el dibujo de la playa. La pantalla se pone en negro)
    
    
-> sleepN3_knot

=== sleepN3_knot ===
SUEÑO N3 (DEEP SLEEP)
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