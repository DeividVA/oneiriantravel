// External Functions

EXTERNAL ShowCharacter(characterName, position, mood)

EXTERNAL HideCharacter(characterName)

EXTERNAL ChangeMood(characterName, mood)

EXTERNAL ShowBackground(backgroundName)

EXTERNAL HideBackground(backgroundName)

EXTERNAL ShowItem(itemName)

EXTERNAL HideItem()

EXTERNAL ShowHud()

EXTERNAL HideHud()

EXTERNAL ShowCT()

EXTERNAL HideCT()

// Global variables
VAR DeltaWaves = 5
VAR Need = ""
VAR Count = 0

-> start_knot

=== start_knot ===
//ONEIRIAN TRAVEL Demo Version
{ShowBackground("Prelude")}
LUZ AUSENTE, LUGAR DESCONOCIDO
???: Alex... Alex... 
???: ¡Ayuda, Alex! 
???: Las... mane... cillas... 
???: La es... fera...

-> wakefulness_knot

=== wakefulness_knot ===
{HideBackground("Prelude")}
//Capítulo I: VIGILIA
{ShowCT()}
...
{HideCT()}

PUERTO VIEJO, CALLES {ShowBackground("Streets")} 
Alex: Otro día más en Puerto Viejo. {ShowCharacter("Alex", "Left", "Iddle")}
Alex: Otra Navidad más en Puerto Viejo. {ChangeMood("Alex", "Depressed")}
Alex: Estoy cansado de esta ciudad. {ShowHud()}
Alex: Para colmo se me ha vuelto a estropear el coche. {ShowItem("OldClock")} 
{HideItem()}
Alex: Y tengo que ir andando a la cena de Navidad de la empresa.
Alex: Justo hoy, que hablaremos de los planes de importación del año que viene. Y estaba invitado el pez gordo aquel de New Port.
Alex: Es importante que esté presente. Me juego el ascenso. {HideBackground("Streets")} {ShowBackground("Alley")}
Alex: Aggh... este dolor de cabeza...
Alex: ...
Alex: Ummm... ¿Y ese gato? {ShowCharacter("Cat", "Right", "Iddle")}

-> catchoice_knot

    === catchoice_knot ===
    Alex: ¿Por qué me mira fijamente?
    
     * Ignorar y continuar el camino.
     -> ignorecat
     * Mirar.
     -> lookatcat
     
     === ignorecat ===
    
    ~DeltaWaves -= 1
    
    (El gato te persigue y maúlla)
    
    Alex: ¿Pero bueno? ¿Otra vez estás aquí? ¿Qué quieres?
    
    -> catchoice_knot
    
    -> DONE

     === lookatcat ===
     {not ignorecat:
     ~DeltaWaves += 1
     }
    
Tienes {DeltaWaves} ondas delta

(El gato se aleja un par de metros y vuelve a mirarte, como queriendo que le sigas) 
Alex: Dios, maldito gato, voy a tener que correr.
(Sales corriendo, el gato te persigue)
Alex: ¿Pero se puede saber qué quieres?
Gato: Miau.
(El gato señala con la cabeza una callejuela y se vuelve a mirarte).
Alex: Al final voy a llegar tarde. ¿Qué narices quieres ahí dentro?
(Llegas al final de la callejuela)
Alex: Esto... esto es... el Barrio del Muro...
Alex: Recuerdo jugar aquí de pequeño con Elena y Jorge.
Alex: Qué lástima que tenga que irse.
Alex: No voy a poder despedirme de él. Estaré muy ocupado estos días antes de que se vaya.
Gato: Miau.
Alex: A ver... ¿qué quieres tú...?
(El gato se acerca a un bidón de basura abierto. Hay un reloj dentro)
Gato: Miau.
Alex: Un momento... Este reloj...
Alex: Este reloj es igual que el que tenía de pequeño, el que me regalaron mis amigos en mi cumpleaños.
Alex: Dios, debía tener diez años o menos.
Alex: Parece que este ha perdido la correa.
Alex: Siento la tentación de acercarme y cogerlo. Pero tal como está la ciudad hoy en día, quién sabe lo que pueden haber echado ahí. 
Alex: Fentanilo o algo peor.

-> clockchoice_knot

    === clockchoice_knot ===
    
     * Debería irme. 
     -> leaveclock
     * Debería cogerlo.
     -> takeclock
     
     === leaveclock ===
    ~DeltaWaves -= 1
    Alex: Voy a llegar tarde y no pienso meter las manos en un cubo de basura.
    Alex: No puedo perder más el tiempo aquí. En veinte minutos va a empezar la cena.
    Alex: Vamos, vamos...
    -> continue
     
     === takeclock ===
     ~DeltaWaves += 1
     Alex: Era justo este modelo. Es increíble. Qué recuerdos. Recuerdo la esfera redondeada y estas manecillas con el pingüino y la morsa...
     Alex: Tengo que llevármelo. Ya veré después qué hago con él.
     Has obtenido reloj viejo.
     (Lo guardas en el bolsillo de la chaqueta)
    -> continue
    
    === continue ===
    
    Tienes {DeltaWaves} ondas delta
    Alex: Agh, ¿qué me pasa...? Me estoy empezando... a sentir... marea... do...
    (Caes al suelo de rodillas, la pantalla se pone en negro)
    
    -> sleepN1_knot

=== sleepN1_knot ===
{ShowCT()}
...
{HideCT()}
PUERTO VIEJO, BARRIO DEL MURO
Este es el nivel de sueño sleep N1: Adormecimiento

(Te empiezas a despertar lentamente, la pantalla pasa de estar borrosa a nítida)

Alex: Uf...
Alex: Uuf...
Alex: ¿Qué... qué... me ha pasado?
Alex: ¿Debería ir al médico? No, no puedo... Creo que estoy bien.
Alex: Y la reunión es demasiado importante para mi reputación.
Alex: ¿Dónde está... el gato?
Alex: Agh... Son ya las nueve. Tengo que irme corriendo.

(Te vas corriendo, llegas a la puerta del restaurante)

Alex: Aquí es. ¿"La Sardina Indiscreta"? Vaya nombre...
???: Vaya, vaya... Al fin me hiciste caso. ¿Qué tal, amigo?
Alex: ¿Eh? Ho... hola. ¿Quién eres?
???: ¿Cómo que quién eres? Ja, ja, ja... ¿Es que no te acuerdas de tu Cheese?

Alex: ¿Cheese?

-> cheese_choice

    === cheese_choice ===

    * La verdad es que no caigo. Refréscame la memoria.
    -> dunno
    * ¿Qué clase de nombre es ese?
    -> what
    * Sí, claro, sí que me acuerdo.
    -> yeah

    === dunno ===
    ~DeltaWaves += 0
    Cheese: Hmm. Sinceridad ante todo, ¿eh?
    -> continue2
    === what ===
    ~DeltaWaves += 1
    Cheese: Ja, ja, ja. Me gusta tu sentido del humor. Has ganado en ironía con los años.
    -> continue2
    === yeah ===
    ~DeltaWaves -= 1
    Cheese: Agh. Se te nota que mientes.
    -> continue2

=== continue2 ===
Alex: Disculpa, es que creo que no te conozco. Aunque tengo la sensación de que te he visto antes en alguna parte.
Cheese: Hmm... más bien la cuestión es que no me recuerdas, pero no te diste cuenta todavía. Pero date tiempo, amigo. 
Cheese: Aunque creo que tiempo es lo que te falta ahora mismo. ¿No se te quita de la cabeza esa reunión de negocios, verdad?
Alex: ¿Cómo puede esta persona saber toda mi vida? #thought
Cheese: Ja, ja, tranquilo... Dejemos al tiempo que sea quien me descubra.
Alex: Qué forma de hablar más extraña. Pero no sé por qué, de algún modo parece que me es familiar.  #thought 
Alex: ¿Será alguien del colegio, de cuándo era pequeño? #thought
Alex: ...
Cheese: Y cuéntame, ¿qué tal todo?
Cheese: ¿Tus padres? ¿Tus amigos Elena y Jorge? ¿Tu trabajo y tu compañero Isaac?
-> interest_choice

    === interest_choice ===
    Alex: (No sé quién es esta persona y por qué sabe tanto de mí, pero una fuerza extraña me incita a hablar)
    * Hablar sobre mis amigos.
    -> friends
    * Hablar sobre mis compañeros de trabajo.
    -> pals
    * Hablar sobre mis padres.
    -> momdad

    === friends ===
    Alex: Pues, eh, bien. Jorge se marcha ahora a Suecia. Va a pasar frío allí... je, je.
    Alex: ¿Pero qué estoy diciendo?  #thought
    Alex: En realidad, hace tiempo que no los veo. Pero es que la agenda está demasiado apretada. Y desde lo que pasó la última vez. La época en que ellos dos estaban juntos... 
    Alex: Entre eso y mi trabajo nos distanciamos bastante. Y aquella maldita pelea. No quiero ni acordarme... Y ojalá hubiera sido más sincero con Elena.
    Alex: ¿Pero por qué hablo de esto con un desconocido? #thought
    Alex: En fin...
        ~Need = "cuero"
    ~Count += 1
    {Count:
        -3: -> endconver
    }
    -> interest_choice


    === pals ===
    Alex: Pues, eh, bien. La verdad es que es un tipo muy competente. Desde que entró la productividad de la empresa subió un 170%.
    Alex: ¿Qué haces? ¡Eso es confidencial! #thought
    Alex: Hicieron bien en contratarle, porque yo estaba desbordado. Pero lo cierto es que empecé a sentir envidia. Además es un tanto arrogante.
    Alex: Solo que luego me empezó a contar de sus problemas, y empezamos a caernos bien. Teníamos más cosas en común de lo que pensábamos.
    Alex: Incluso es de los Sharks como yo.
    Alex: ¿Pero por qué le cuento esto? #thought
    Alex: En fin...
    ~Need = "metal"
    ~Count += 1
    {Count:
        -3: -> endconver
    }
    -> interest_choice

    === momdad ===
    Alex: Pues, eh, bien. Los dos con sus achaques. Pero son pequeños. Bueno, lo de Papá... Por suerte parece que fue solo un susto.
    Alex: ¿Pero qué le importa esto a este tipo? #thought
    Alex: Está igual de terco que siempre, y eso me tranquiliza. Mira que me peleaba antes con él. Pero ahora cada vez lo echo más de menos. 
    Alex: Ojalá pudiera ir más veces los fines de semana.
    Alex: Mamá tan cariñosa como siempre. Aunque ahora toca menos el piano y eso me preocupa.
    Alex: Recuerdo cuando era pequeño y tocaba para mí. Me relajaba los días que me hacía pis en la cama.
    Alex: Dios, esto es demasiado personal #thought
    Alex: En fin...
    ~Need = "goma"
    ~Count += 1
    {Count:
       -3: -> endconver
    }
    -> interest_choice

    === endconver ===
    -> continue3


=== continue3 ===

Tienes {DeltaWaves} ondas delta

Alex: Aggh... me ha vuelto el dolor de cabeza.
Cheese: Está bien. No te apures, déjalo estar. Se te nota en la cara que no lo estás pasando bien con las prisas. 
Cheese: Y después de estar un rato inconsciente.
Alex: ¿Qué? ¿He estado inconsciente? ¿Y cómo lo sabes?
Cheese: Bueno te veré dentro, amigo.
Espera...
Cheese: Una última cosa: cuida bien lo que guardas en el bolsillo de tu chaqueta... ja, ja, ja...
 {not takeclock:
 Hmmm... ¿Qué es esto? #thought
 ¿Por qué tengo el reloj en el bolsillo? #thought
 }
¿Qué? ¿Por qué ahora tiene una correa de {Need}?
Has obtenido reloj infantil con correa de {Need}
Cheese: Ciaooo...
Cheese: Vaya, qué oscuro está aquí dentro...
(Cheese desaparece en la oscuridad del restaurante. La puerta se cierra).
Alex: Vaya personaje más extraño.
Alex: Supongo que tendré que entrar.
Alex: En fin, vaya nochecita. ¿Y por qué está esto tan oscuro? 
Alex: ¿Pero qué?

(El interior es enorme y parece no haber paredes, solo está iluminado por unas antorchas lejanas que flotan en el aire)
(Solo se escuchan el sonido de tus pasos, como si estuvieras dentro de un enorme vaso hueco)

-> sleepN2_knot


=== sleepN2_knot ===

SUEÑO N2 (LIGHT SLEEP)
MUNDO ONÍRICO, TEMPLO
Este es el nivel de sueño sleep N2: Sueño Ligero

(En el fondo hay una especie de mesa o altar iluminado por un foco en el techo. Cuando te acercas, ves que hay una extraña comida encima y tres personajes a su alrededor. Cada uno con un libro idéntico y los tres los consultan cada vez que hablan)

???: Grunt...
???: Gladhweg gladhweg
???: Color del fuego de la serendipia.
???: Grunt...
???: Elen síla lúmenn' omentielvo
???: Uuuuuh, flores del viento emergen. ¡Alex!


Alex: Eeeh, eehh, ¿me está hablando a mí?

-> oneirian_question

    === oneirian_question ===

    Alex: Pero qué son estas criaturas. Improvisa algo. ¡Rápido!  #thought

    * (...) (Quedarse callado)
    -> silence
    * Azutu karaka yodolai penten?
    -> invent
    * Lo... lo siento, no la entiendo.
    -> sosorry
    * Eh... eh... Flores...
    -> lucky

    === silence ===
    ~DeltaWaves -= 1
    -> continue4
    === invent ===
    ~DeltaWaves -= 1
    -> continue4
    === sosorry ===
    ~DeltaWaves += 0
    -> continue4
    === lucky ===
    ~DeltaWaves += 1
    -> continue4
    

=== continue4 ===

Tienes {DeltaWaves} ondas delta.
Cheese: Uhuh, uhuh, uhuh. Espera, espera, espera...
{lucky:
Cheese: Esta vez has tenido suerte, pero...
}
{not lucky:
Cheese: Es de mala educación quedarse callado o inventarse palabras...
}
Cheese: Vas a necesitar esto.
{DeltaWaves:
    -1: Cheese: O lo vas a pasar mal.
}

Has obtenido Diccionario Onírico Multilingüe

Cheese: Y bien, amigo, bienvenido a tu cena de empresa.
Alex: ¿Quéee? ¿Pero qué es esta locura? Estoy soñando, ¿verdad?
Cheese: Tranquilo, no tendrás que estar mirándolo todo el tiempo.
Alex: ¿Se supone que ahora puedo mantener una conversación con estas... cosas?
Cheese: Se supone que ahora van a oírte. Pero bueno, detuve el tiempo por ti... solo un poquito, claro...
Alex: Oye, ¿qué es este sitio?
Cheese: Ajá, no me escuchas, ¿eh?... Ahora no es el momento... No puedo estar mucho tiempo pulsando el botón de pausa.
Cheese: Tú déjate llevar...
Alex: ¿Qué???

(Los tres personajes ya no tienen libros)

???: Alex, no has probado tu vino. ¿O es que prefieres otra cosa? ¿Un refresco, quizás?
Alex: No, señora Cruz.
Alex: ¿Qué? ¿Por qué la he llamado como mi jefa?  #thought
Sra. Cruz: Bien, se te ve pálido. Prúebalo, entrarás en calor. Mira a Juan, ya se ha tomado unas cuantas.
Sr. Florián: Solo han sido dos... y media.
Sra. Cruz: Ja, ja, ja...
Sra. Cruz: Añade a eso la copa de burbrujilda que te tomaste antes de que yo llegara.
Alex: ¿Burbu qué? Esto cada vez es más raro...  #thought
Alex: ¿Realmente esto es mi cena de empresa? ¿Dónde están mis compañeros? #thought
Sra. Cruz: Oh, pero deja que te presente al señor Oddstrong.
Oddstrong: ...
Alex: En... encantado...
Oddstrong: Grunt...
Oddstrong: Gruunt...
Oddstrong: Gruuunt...
Alex: ¿Pero por qué no habla este tipo?  #thought 
Alex: Esa cabeza me da escalofríos  #thought
Sra. Cruz: Ja, ja, ja... usted siempre tan ingenioso, señor Oddstrong.
Sra. Cruz: ¿Verdad que es divertido, Alex?

-> oddstrong

    === oddstrong ===
    * Mostrarse extrañado
    -> doubt
    * Mostrarse risueño
    -> laugh

    === doubt ===
    ~DeltaWaves += 2
    Eh... supongo que sí.
    -> continue5
    === laugh ===
    ~DeltaWaves += 1
    Qué gracioso, sí
    -> continue5

=== continue5 ===
Tienes {DeltaWaves} ondas delta.
Sra. Cruz: Sé que no es fácil pillarle el humor al señor Oddstrong, pero ya le irás entendiendo
Alex: Claro. Es un honor tenerle aquí señor Oddstrong.
Alex: Pero, ¿por qué he dicho eso?  #thought
Alex: Es como si mi boca hablara sola  #thought
Alex: ¿Acaso me estoy empezando a sentir tranquilo entre estos seres? #thought
Oddstrong: Gruuunt...
Sr. Florián: Ja, ja, cierto. Usted siempre tan al grano, señor Oddstrong. Se le nota la vena nuevaportina.
Sra. Cruz: New Porter, Juan, no seas palurdo. Ya conoce sus modales puertovejeros, señor Oddstrong.
Sra. Cruz: Pero bueno, Alex, te ha comido la lengua el gato. Estamos esperando tus informes. El señor Oddstrong está muy interesado en participar en nuestra empresa.
Oddstrong: Grunt...
Alex: Sí. Enseguida.
Alex: He vuelto a hacerlo. 
Alex: Siento como si en vez de vivir, estuviera viendo una película. 
(Abres tu maletín, pero solo hay dibujos infantiles que hiciste de niño)
Alex: ¿Qué? ¿De dónde sale esto?
Alex: Vaya, parece que el piloto automático ha parado. Tengo que hacer algo #thought
-> papers

    === papers ===
    * Hacer como si nada y hablar de negocios
    -> act_normally
    * Hablar de los dibujos
    -> drawings
    * Excusarse
    -> excuse
    
    === act_normally ===
    ~DeltaWaves += 0
    Alex: Como puede ver en esta gráfica, hemos incrementado un 170% nuestra productividad en los últimos seis meses, 
    Alex: lo que es un claro indicio de la proyección al alza de nuestra empresa.
    -> continue6
    === drawings ===
    ~DeltaWaves += 1
    Alex: En este dibujo de aquí estoy con mis amigos Elena y Jorge jugando a la pelota en el barrio del muro. 
    Alex: Y aquí salgo en clase de niño tirando bolas de papel. La profesora nos riñó mucho aquel día.
    -> continue6
    === excuse ===
    ~DeltaWaves += 0
    Alex: No, no puedo creerlo. 
    Alex: ¿Dónde? ¿Dónde están los informes?
    -> continue6
    
    
=== continue6 ===
Tienes {DeltaWaves} ondas delta.
(Vas barajando dibujos mientras hablas. La imagen se dirige hacia un dibujo de la playa. La pantalla se pone en negro)

-> coming_soon

=== coming_soon ===

Has acabado la demo con {DeltaWaves} ondas delta.
Vas encaminado hacia los finales { DeltaWaves <= 6: Beta y Gamma} { DeltaWaves >  6: Alfa y Theta}

En la versión final Alex llegará a la playa onírica, el paraíso soñado donde podrá ver gigantescas criaturas del mundo de los sueños. 
Sorprendentemente se encontrará allí con su amiga Elena, su compañero Isaac y sus padres, que le conducirán en un extraño viaje por Oniria, 
mientras desentraña sus dilemas y miedos personales y finalmente se enfrenta al terrible peligro que amenaza este mundo.
    
/*
-> sleepN3_knot

=== sleepN3_knot ===
SUEÑO N3 (DEEP SLEEP)
MUNDO ONÍRICO, PLAYA
Este es el nivel de sueño sleep N3: Sueño Profundo

(Aquí te encuentras con tu amiga Elena, tus compañeros de trabajo y tus padres en la playa onírica. Criaturas oníricas aparecen por los alrededores y todos las aceptan con normalidad. Conversas con ellos, pero llegado a un punto tienes que elegir entre tu amiga y tu compañero)

(Ella se convierte en una orca. Él se convierte en un toro. Tus padres en un ser de dos cabezas)

(La pantalla se pone en negro)

-> REM_knot

=== REM_knot ===
REM
MUNDO ONÍRICO, CAOS
Este es el nivel de sueño REM

En la misma posición donde estaban aparecen el alien arpía, el dios reloj y el rex demonio. Tienes que combatirlos con una serie de decisiones, como un rpg. Tu energía son los Dream Points que tengas.

-> awake_knot

=== awake_knot ===
 DESPERTAR
 Este es el despertar
*/

    -> DONE //done del final de la historia

    -> END
