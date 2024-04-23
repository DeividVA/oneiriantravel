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
Alex: Para colmo se me ha vuelto a estropear el coche. {ChangeMood("Alex", "Sad")}
Alex: Y tengo que ir andando a la cena de Navidad de la empresa.{ChangeMood("Alex", "Iddle")}
Alex: Justo hoy, que hablaremos de los planes de importación del año que viene. Y estaba invitado el pez gordo aquel de New Port. {ChangeMood("Alex", "Worried")}
Alex: Es importante que esté presente. Me juego el ascenso.
Alex: Aggh... este dolor de cabeza... {ChangeMood("Alex", "Shocked")}
Alex: A ver... No sé si por aquí voy a bien... 
Alex: ... 
Alex: Creo que es por una de estas calles... {HideBackground("Streets")} {ShowBackground("Alley")}
Alex: Ummm... ¿Y ese gato? {ChangeMood("Alex", "Doubt")} {ShowCharacter("Cat", "Right", "Iddle")}

-> catchoice_knot

    === catchoice_knot ===
    Alex: ¿Por qué me mira fijamente?
    
     * Ignorar y continuar el camino.
     -> ignorecat
     * Mirar.
     -> lookatcat
     
     === ignorecat ===
    
    ~DeltaWaves -= 1
    
    Alex: Me largo... {HideCharacter("Alex")} {HideCharacter("Cat")} 
    Alex: ¿Pero bueno? ¡No me sigas! ¿Qué quieres? {ShowCharacter("Alex", "Left", "Shocked")} {ShowCharacter("Cat", "Right", "Iddle")}
    
    -> catchoice_knot
    
    -> DONE

     === lookatcat ===
     {not ignorecat:
     ~DeltaWaves += 1
     }
    
Tienes {DeltaWaves} ondas delta #thought

Alex: Brrr... ¿por qué me miras así?
Alex: Dios, maldito gato, voy a tener que correr. {HideCharacter("Alex")} {HideCharacter("Cat")}
//(Sales corriendo, el gato te persigue)
Alex: ¿Pero se puede saber qué quieres? {ShowCharacter("Alex", "Left", "Shocked")} {ShowCharacter("Cat", "Right", "Iddle")}
Gato: Miau.
//(El gato señala con la cabeza una callejuela y se vuelve a mirarte).
Alex: Al final voy a llegar tarde...
Alex: ¿Por qué miras ese callejón?
Alex: ¿Qué narices quieres ahí dentro? {ChangeMood("Alex", "Doubt")}
Alex: A ver, voy a asomarme... {HideBackground("Alley")} {ShowBackground("District")}
//(Llegas al final de la callejuela)
Alex: Esto... esto es... el Barrio del Muro... {ChangeMood("Alex", "Shocked")}
Alex: Recuerdo venir a jugar aquí de pequeño con Elena y Jorge. {ChangeMood("Alex", "Smiling")}
Alex: Qué lástima que tenga que irse. {ChangeMood("Alex", "Depressed")}
Alex: No voy a poder despedirme de él. Estaré muy ocupado estos días antes de que se vaya.
Gato: Miau.
Alex: A ver... ¿qué quieres tú...? {ChangeMood("Alex", "Unconfident")}
//(El gato se acerca a un bidón de basura abierto. Hay un reloj dentro)
Gato: Miau.
Alex: ¿Quieres que mire en ese bidón o qué? {HideCharacter("Cat")}
Alex: A ver....
Alex: Vaya, estaba abierto, qué peste {ChangeMood("Alex", "Angry")}
Alex: Un momento... Este reloj... {ChangeMood("Alex", "Doubt")}
Alex: Este reloj es igual que el que tenía de pequeño, el que me regalaron mis amigos en mi cumpleaños. {ChangeMood("Alex", "Shocked")}
Alex: Dios, debía tener diez años o menos.{ChangeMood("Alex", "Smiling")}
Alex: Este tiene la correa hecha polvo... {ChangeMood("Alex", "Iddle")}
Alex: Siento la tentación de cogerlo. Pero tal como está la ciudad hoy en día, quién sabe lo que pueden haber echado ahí. 
Alex: Fentanoides o algo peor.

-> clockchoice_knot

    === clockchoice_knot ===
    
     * Debería irme. 
     -> leaveclock
     * Debería cogerlo.
     -> takeclock
     
     === leaveclock ===
    ~DeltaWaves -= 1
    Alex: Voy a llegar tarde y no pienso meter las manos en un cubo de basura. {ChangeMood("Alex", "Angry")}
    Alex: No puedo perder más el tiempo aquí. En quince minutos va a empezar la cena.
    Alex: Vamos, vamos... {ChangeMood("Alex", "Unconfident")}
    -> continue
     
     === takeclock ===
     ~DeltaWaves += 1
     Alex: Era justo este modelo. Es increíble. Qué recuerdos. Esta esfera redondeada y estos dibujos del pingüino y la foca... {ChangeMood("Alex", "Smiling")}
     Alex: Tengo que llevármelo. Ya veré después qué hago con él. {ChangeMood("Alex", "Iddle")}
     {ShowItem("OldClock")} Has obtenido reloj viejo. #thought 
     {HideItem()}
     Alex: Lo guardaré en el bolsillo de la chaqueta...
    -> continue
    
    === continue ===
    
    Tienes {DeltaWaves} ondas delta #thought 
    Alex: Agh, ¿qué me pasa...? Me estoy empezando... a sentir... mare... a... {ChangeMood("Alex", "Shocked")}
    Alex: do... {HideCharacter("Alex")}
    //(Caes al suelo de rodillas, la pantalla se pone en negro)
    
    -> sleepN1_knot

=== sleepN1_knot ===
{ShowCT()}
...
{HideCT()}
PUERTO VIEJO, BARRIO DEL MURO 
//Este es el nivel de sueño sleep N1: Adormecimiento

//(Te empiezas a despertar lentamente, la pantalla pasa de estar borrosa a nítida)

Alex: Uf...
Alex: Uuf...
Alex: ¿Qué... qué... me ha pasado? {ShowCharacter("Alex", "Left", "Shocked")}
Alex: ¿Me he quedado dormido? ¿Por qué?
Alex: ¿O me he desmayado? 
Alex: ¿Debería ir al médico? {ChangeMood("Alex", "Doubt")}
Alex: No, no puedo... {ChangeMood("Alex", "Iddle")}
Alex: Y la reunión es demasiado importante para mi reputación. {ChangeMood("Alex", "Worried")}
Alex: ¿Y dónde está ese estúpido gato? {ChangeMood("Alex", "Angry")}
Alex: Agh... Son ya las nueve. Tengo que irme corriendo. 
Alex: ... {HideCharacter("Alex")} 
Alex: ... {HideBackground("District")}
Alex: ...
//(Te vas corriendo, llegas a la puerta del restaurante)
 {ShowBackground("Restaurant")}
Alex: Aquí es. ¿"La Sardina Indiscreta"? Vaya nombre... {ShowCharacter("Alex", "Left", "Shocked")}
???: Vaya, vaya... Al fin me hiciste caso. ¿Qué tal, amigo?
Alex: ¿Eh? Ho... hola. ¿Quién eres? {ShowCharacter("Cheese", "Right", "Smiling")} {ChangeMood("Alex", "Shocked")}
???: ¿Cómo que quién eres? Ja, ja, ja... ¿Es que no te acuerdas de tu Cheese? {ChangeMood("Cheese", "Sarcasm")} {ChangeMood("Alex", "Doubt")}

-> cheese_choice

    === cheese_choice ===
    Alex: ¿Cheese? 
    * La verdad es que no caigo. {ChangeMood("Alex", "Depressed")}
    -> dunno
    * ¿Qué clase de nombre es ese? {ChangeMood("Alex", "Sarcasm")}
    -> what
    * Sí, claro, sí que me acuerdo. {ChangeMood("Alex", "Smiling")}
    -> yeah

    === dunno ===
    ~DeltaWaves += 0
    Cheese: Hmm. Sinceridad ante todo, ¿eh? {ChangeMood("Cheese", "Iddle")}
    -> continue2
    === what ===
    ~DeltaWaves += 1
    Cheese: Ja, ja, ja. Me gusta tu sentido del humor. Has ganado en ironía con los años. {ChangeMood("Cheese", "Sarcasm")}
    -> continue2
    === yeah ===
    ~DeltaWaves -= 1
    Cheese: Agh. Qué falso. Se te nota que mientes. {ChangeMood("Cheese", "Doubt")}
    -> continue2

=== continue2 ===
Alex: Disculpa, es que creo que no te conozco. Aunque tengo la sensación de que te he visto antes en alguna parte. {ChangeMood("Alex", "Iddle")}
Cheese: Hmm... más bien la cuestión es que no me recuerdas, pero no te diste cuenta todavía. Pero date tiempo, amigo. {ChangeMood("Cheese", "Smiling")}
Cheese: Aunque creo que tiempo es lo que te falta ahora mismo. ¿No se te quita de la cabeza esa reunión de negocios, verdad? {ChangeMood("Cheese", "Sarcasm")}
Alex: ¿Cómo puede esta persona saber toda mi vida? {ChangeMood("Alex", "Worried")} #thought 
Cheese: Ja, ja, tranquilo... Dejemos al tiempo que sea quien me descubra. {ChangeMood("Cheese", "Smiling")}
Alex: Qué forma de hablar más extraña. Pero no sé por qué, de algún modo parece que me es familiar.  #thought 
Alex: ¿Será alguien del colegio, de cuándo era pequeño? #thought
Alex: ...
Cheese: Y cuéntame, ¿qué tal todo? {ChangeMood("Cheese", "Iddle")}
Cheese: ¿Tus padres? ¿Tus amigos Elena y Jorge? ¿Tu trabajo y tu compañero Isaac?
-> interest_choice

    === interest_choice ===
    Alex: No sé quién es esta persona y por qué sabe tanto de mí, pero una fuerza extraña me incita a hablar {ChangeMood("Alex", "Iddle")} #thought
    * Hablar sobre mis amigos.
    -> friends
    * Hablar sobre mis compañeros de trabajo.
    -> pals
    * Hablar sobre mis padres.
    -> momdad

    === friends ===
    Alex: Pues, eh, bien. Jorge se marcha ahora a Suecia. Va a pasar frío allí... je, je. {ChangeMood("Alex", "Smiling")}
    Alex: ¿Pero qué estoy diciendo?  #thought
    Alex: En realidad, hace tiempo que no los veo. Pero es que la agenda está demasiado apretada. Y desde lo que pasó la última vez. La época en que ellos dos estaban juntos... {ChangeMood("Alex", "Depressed")}
    Alex: Entre eso y mi trabajo nos distanciamos bastante. Y aquella maldita pelea. No quiero ni acordarme... {ChangeMood("Alex", "Sad")}
    Alex: Y ojalá hubiera sido más sincero con Elena.
    Alex: ¿Pero por qué hablo de esto con un desconocido? #thought
    Alex: En fin... {ChangeMood("Alex", "Iddle")}
        ~Need = "cuero"
    ~Count += 1
    {Count:
        -3: -> endconver
    }
    -> interest_choice


    === pals ===
    Alex: Pues, eh, bien. La verdad es que es un tipo muy competente. Desde que entró la productividad de la empresa subió un 170%. {ChangeMood("Alex", "Doubt")}
    Alex: ¿Qué haces? ¡Eso es confidencial! #thought
    Alex: Hicieron bien en contratarle, porque yo estaba desbordado. Pero lo cierto es que empecé a sentir envidia. 
    Alex: Además es un tanto arrogante. {ChangeMood("Alex", "Worried")}
    Alex: Solo que luego me empezó a contar de sus problemas, y empezamos a caernos bien. Teníamos más cosas en común de lo que pensábamos. 
    Alex: Incluso es de los Sharks como yo. {ChangeMood("Alex", "Smiling")}
    Alex: ¿Pero por qué le cuento esto? #thought
    Alex: En fin... {ChangeMood("Alex", "Iddle")}
    ~Need = "metal"
    ~Count += 1
    {Count:
        -3: -> endconver
    }
    -> interest_choice

    === momdad ===
    Alex: Pues, eh, bien. Los dos con sus achaques. Pero son pequeños. Bueno, lo de Papá... Por suerte parece que fue solo un susto. {ChangeMood("Alex", "Worried")}
    Alex: ¿Pero qué le importa esto a este tipo? #thought
    Alex: Está igual de terco que siempre, y eso me tranquiliza. 
    Alex: Mira que me peleaba antes con él. Pero ahora cada vez lo echo más de menos. 
    Alex: Ojalá pudiera ir más veces los fines de semana. {ChangeMood("Alex", "Sad")}
    Alex: Mamá tan cariñosa como siempre. Aunque ahora toca menos el piano y eso me preocupa. {ChangeMood("Alex", "Worried")}
    Alex: Recuerdo cuando era pequeño y tocaba para mí. Me relajaba los días que me hacía pis en la cama.
    Alex: Dios, esto es demasiado personal #thought
    Alex: En fin... {ChangeMood("Alex", "Iddle")}
    ~Need = "goma"
    ~Count += 1
    {Count:
       -3: -> endconver
    }
    -> interest_choice

    === endconver ===
    -> continue3


=== continue3 ===

Tienes {DeltaWaves} ondas delta #thought

Alex: Aggh... me ha vuelto el dolor de cabeza. {ChangeMood("Alex", "Shocked")}
Cheese: Está bien. No te apures, déjalo estar. Se te nota en la cara que no lo estás pasando bien con las prisas. {ChangeMood("Cheese", "Smiling")}
Cheese: Y después de estar un rato inconsciente. {ChangeMood("Cheese", "Worried")}
Alex: ¿Qué? ¿He estado inconsciente? ¿Y cómo lo sabes? {ChangeMood("Alex", "Doubt")}
Cheese: Bueno te veré dentro, amigo. {ChangeMood("Cheese", "Iddle")}
Alex: Espera... {ChangeMood("Alex", "Shocked")}
Cheese: Una última cosa: cuida bien lo que guardas en el bolsillo de tu chaqueta... ja, ja, ja... {ChangeMood("Cheese", "Sarcasm")}
 {not takeclock:
 Alex: Hmmm... ¿Qué es esto? #thought
 Alex: ¿Por qué tengo el reloj en el bolsillo? #thought
 }
Alex: ¿Qué? ¿Por qué ahora tiene una correa de {Need}?  #thought
Has obtenido reloj infantil con correa de {Need}
{Need:
       -"goma": {ShowItem("CatClock")}  
       -"cuero": {ShowItem("MouseClock")}
       -"metal": {ShowItem("DogClock")}
}
...
{HideItem()}
Cheese: Bueno, te dejo. Nos vemos dentro...
Cheese: Ciaooo... {HideCharacter("Cheese")}
Cheese: Vaya, qué oscuro está este sitio...
//(Cheese desaparece en la oscuridad del restaurante. La puerta se cierra).
Alex: Vaya personaje más extraño. {ChangeMood("Alex", "Depressed")}
Alex: Supongo que tendré que entrar. {ChangeMood("Alex", "Doubt")}
Alex: En fin, vaya nochecita. {HideCharacter("Alex")}
Alex: Espero que no haya más problemas en la reunión...
Alex: ¿Pero qué? {HideBackground("Alley")} 

//(El interior es enorme y parece no haber paredes, solo está iluminado por unas antorchas lejanas que flotan en el aire)
//(Solo se escuchan el sonido de tus pasos, como si estuvieras dentro de un enorme vaso hueco)

-> sleepN2_knot


=== sleepN2_knot ===
{ShowCT()}
...
{HideCT()} 
//SUEÑO N2 (LIGHT SLEEP)
MUNDO ONÍRICO, TEMPLO {ShowBackground("Temple")}
//Este es el nivel de sueño sleep N2: Sueño Ligero

//(En el fondo hay una especie de mesa o altar iluminado por un foco en el techo. Cuando te acercas, ves que hay una extraña comida encima y tres personajes a su alrededor. Cada uno con un libro idéntico y los tres los consultan cada vez que hablan)

Alex: ¡¡¡¿¿¿Pero qué???!!!
Alex: ¿Q-Qué es esto?? ¿Dónde me he metido?
Alex: ¿Qué son esas antorchas flotando?
Alex: ¿Y todas esas columnas?
Alex: Esto debe de ser una broma. Desde fuera no se veía así.
???: Grunt...
Alex: Se escucha algo allí al fondo. Voy a ver...
{HideBackground("Temple")} 
Alex: ¿Pero quéeeee???
{ShowBackground("Shrine")}
???: Esquirlas del tiempo entre las flores. {ShowCharacter("Cruz", "Left", "Iddle")}
???: Hantalë tancave. {HideCharacter("Cruz")} {ShowCharacter("Florian", "Right", "Iddle")}
???: Grunt... {HideCharacter("Florian")} {ShowCharacter("Oddstrong", "Center", "Iddle")}
???: Gladhweg gladhweg {HideCharacter("Oddstrong")} {ShowCharacter("Florian", "Right", "Iddle")}
???: Color del fuego de la serendipia. {HideCharacter("Florian")} {ShowCharacter("Cruz", "Left", "Smiling")}
???: Grunt... {HideCharacter("Cruz")} {ShowCharacter("Oddstrong", "Center", "Iddle")}
???: Elen síla lúmenn' omentielvo. {HideCharacter("Oddstrong")} {ShowCharacter("Florian", "Right", "Iddle")}
???: Uuuuuh, flores del viento emergen. ¡Alex! {HideCharacter("Florian")} {ShowCharacter("Cruz", "Left", "Iddle")}
{HideCharacter("Cruz")}
Alex: ¿Eeeh?, ¿eeeehh?, ¿me está hablando a mí? {ShowCharacter("Alex", "Left", "Shocked")}

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

Tienes {DeltaWaves} ondas delta. #thought
Cheese: Uhuh, uhuh, uhuh. Espera, espera, espera... {ShowCharacter("Cheese", "Right", "Worried")} {ChangeMood("Alex", "Iddle")}
{lucky:
Cheese: Esta vez has tenido suerte, pero... 
}
{not lucky:
Cheese: Es de mala educación quedarse callado o inventarse palabras... {ChangeMood("Cheese", "Angry")}
}
Cheese: Vas a necesitar esto. {ChangeMood("Cheese", "Iddle")}
{DeltaWaves:
    -1: Cheese: O lo vas a pasar mal. {ChangeMood("Cheese", "Sad")}
}
{ShowItem("Dictionary")} 
Has obtenido Diccionario Onírico Multilingüe
{HideItem()}
Cheese: Y bien, amigo, bienvenido a tu cena de empresa. {ChangeMood("Cheese", "Sarcasm")}
Alex: ¿Quéee? ¿Pero qué es esta locura? Estoy soñando, ¿verdad? {ChangeMood("Cheese", "Shocked")}
Cheese: Tranquilo, no tendrás que estar consultándolo todo el tiempo. {ChangeMood("Cheese", "Sarcasm")}
Cheese: Con tener el diccionario te valdrá para entenderles.
Alex: ¿Se supone que ahora puedo mantener una conversación con estas... cosas?
Cheese: Se supone que ahora van a oírte. Pero bueno, detuve el tiempo por ti... {ChangeMood("Cheese", "Smiling")} {ChangeMood("Alex", "Iddle")}
Cheese: Solo un poquito, claro...
Alex: Oye, ¿qué es este sitio? {ChangeMood("Alex", "Sad")}
Cheese: Ajá, no me escuchas, ¿eh?... Ahora no es el momento... No puedo estar mucho tiempo pulsando el botón de pausa. {ChangeMood("Cheese", "Iddle")}
Cheese: Tú déjate llevar... {ChangeMood("Cheese", "Smiling")}
Alex: ¿Qué??? {ChangeMood("Alex", "Shocked")} {HideCharacter("Cheese")}

//(Los tres personajes ya no tienen libros)

???: Alex, por fin estás aquí. ¿Por qué no pruebas el vino? {ShowCharacter("Cruz", "Center", "Iddle")} {ChangeMood("Alex", "Iddle")}
???: ¿O es que prefieres otra cosa? ¿Un refresco, quizás? {ChangeMood("Cruz", "Smiling")}
Alex: No, señora Cruz.
Alex: ¿Qué? ¿Por qué la he llamado como mi jefa?  #thought
Sra. Cruz: Bien, se te ve pálido. Prúebalo, entrarás en calor. Mira a Juan, ya se ha tomado unas cuantas.
Sr. Florián: Solo han sido dos... y media.  {ShowCharacter("Florian", "Right", "Iddle")}
Sra. Cruz: Ja, ja, ja...
Sra. Cruz: Añade a eso la copa de burbrujilda que te tomaste antes de que yo llegara. {ChangeMood("Cruz", "Sarcasm")}
Alex: ¿Burbu qué? Esto cada vez es más raro...  #thought
Alex: ¿Realmente esto es mi cena de empresa? ¿Dónde están mis compañeros? #thought
Sra. Cruz: Oh, pero deja que te presente al señor Oddstrong. {HideCharacter("Cruz")} {HideCharacter("Florian")}
Oddstrong: ... {ShowCharacter("Oddstrong", "Right", "Iddle")}
Alex: En... encantado... {ChangeMood("Alex", "Sad")}
Oddstrong: Grunt...
Oddstrong: Gruunt...
Oddstrong: Gruuunt...
Alex: ¿Pero por qué no habla este tipo?  #thought 
Alex: Esa cabeza me da escalofríos  #thought
Sra. Cruz: Ja, ja, ja... usted siempre tan ingenioso, señor Oddstrong. {ShowCharacter("Cruz", "Center", "Smiling")} 
Sra. Cruz: ¿Verdad que es divertido, Alex? {ChangeMood("Alex", "Worried")}

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
Tienes {DeltaWaves} ondas delta. #thought
Sra. Cruz: Sé que no es fácil pillarle el humor al señor Oddstrong, pero ya le irás entendiendo. {ChangeMood("Cruz", "Iddle")}
Alex: Claro. Es un honor tenerle aquí señor Oddstrong. {ChangeMood("Alex", "Doubt")}
Alex: Pero, ¿por qué he dicho eso?  #thought
Alex: Es como si mi boca hablara sola  #thought
Alex: ¿Acaso me estoy empezando a sentir tranquilo entre estos seres? #thought
Oddstrong: Gruuunt...
Sr. Florián: Ja, ja, cierto. Usted siempre tan al grano, señor Oddstrong. Se le nota la vena nuevaportina. {HideCharacter("Oddstrong")} {ShowCharacter("Florian", "Right", "Iddle")}
Sra. Cruz: New Porter, Juan, no seas palurdo. Ya conoce sus modales puertovejeros, señor Oddstrong. {ChangeMood("Cruz", "Smiling")}
Alex: ¿Qué??? ¿Este tipo es el pez gordo de New Port??? #thought
Sra. Cruz: Pero bueno, Alex, te ha comido la lengua el gato. Estamos esperando tus informes. {ChangeMood("Cruz", "Shocked")} 
Sra. Cruz: El señor Oddstrong está muy interesado en participar en nuestra empresa.
Alex: Sí. Enseguida. {ChangeMood("Alex", "Worried")} {ChangeMood("Cruz", "Iddle")} 
Alex: He vuelto a hacerlo. #thought
Alex: Siento como si en vez de vivir, estuviera viendo una película. #thought
//(Abres tu maletín, pero solo hay dibujos infantiles que hiciste de niño)
Alex: Lo tengo todo aquí, en mi maletín. {HideCharacter("Cruz")} {HideCharacter("Florian")}
Alex: ¿Qué? ¿De dónde sale esto?
{ShowItem("Drawings")}
Alex: ...
{HideItem()}
Alex: Vaya, parece que el piloto automático ha parado de mi boca. Tengo que hacer algo #thought
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
    Alex: Como puede ver en esta gráfica, hemos incrementado un 170% nuestra productividad en los últimos seis meses, {ChangeMood("Alex", "Angry")} 
    Alex: lo que es un claro indicio de la proyección al alza de nuestra empresa.
    -> continue6
    === drawings ===
    ~DeltaWaves += 1
    Alex: En este dibujo de aquí estoy con mis amigos Elena y Jorge jugando a la pelota en el barrio del muro. {ChangeMood("Alex", "Smiling")} 
    Alex: Y aquí salgo en clase de niño tirando bolas de papel. La profesora nos riñó mucho aquel día.
    -> continue6
    === excuse ===
    ~DeltaWaves += 0
    Alex: No, no puedo creerlo. {ChangeMood("Alex", "Shocked")} 
    Alex: ¿Dónde? ¿Dónde están los informes?
    -> continue6
    
    
=== continue6 ===
Tienes {DeltaWaves} ondas delta. #thought
//(Vas barajando dibujos mientras hablas. La imagen se dirige hacia un dibujo de la playa. La pantalla se pone en negro)
Alex: ¿Cómo puede ser?
{ShowItem("ClassDrawing")}
Alex: Dibujos...
{HideItem()}

{ShowItem("BallDrawing")}
Alex: Y dibujos...
{HideItem()}

{ShowItem("BeachDrawing")}
Alex: Y más dibujos...
{HideItem()}
{HideCharacter("Oddstrong")}
{HideCharacter("Alex")}
{HideHud()}

-> coming_soon

=== coming_soon ===

{HideBackground("Shrine")}
{ShowBackground("Epilogue")}

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
