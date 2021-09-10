extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.j
func callback(labelName):
	get_parent().get_parent().get_parent().get_parent().get_node("ScrollContainer2").visible = true
	get_parent().get_parent().get_parent().visible = false
	match labelName:
		"Variables" :
			get_parent().get_parent().get_parent().get_parent().get_node("ScrollContainer2/VBoxContainerM/MenuEntries/Label").text = "Una variabile è come un contenitore \ndi informazioni, come per esempio \nlettere, parole, valori binari come \n“vero” e “falso” e numeri. Una \nvariabile può essere usata al posto \ndel suo valore, per esempio le \nvariabili numeriche possono essere \nusate in vere e proprie espressioni \nmatematiche!"
		"Istructions":
			get_parent().get_parent().get_parent().get_parent().get_node("ScrollContainer2/VBoxContainerM/MenuEntries/Label").text = "Una istruzione è un comando, \nscritto in uno speciale linguaggio \ncomprensibile ai computer, che ci \npermette di comunicare con essi \ndandogli ordini. Le istruzioni, a \nseconda dell’ordine in cui sono \nscritte dal programmatore e lette \ndal computer, possono portare a \nrisultati diversi."
		"Functions":
			get_parent().get_parent().get_parent().get_parent().get_node("ScrollContainer2/VBoxContainerM/MenuEntries/Label").text = "Le funzioni sono un modo ingegnoso \nper riutilizzare del codice già \nscritto senza doverlo riscrivere \nogni volta che ci serve. Sono \ncomposte da un nome, una lista di \nparametri e un corpo. Il corpo della \nfunzione è la sequenza di istruzioni \nche vogliamo riutilizzare; il nome, \nscelto accuratamente in base al \nproblema che la funzione risolve, è \nseguito generalmente da una coppia \ndi parentesi tonde, il cui inserire \neventuali parametri. \nI parametri non sono obbligatori ma \nsono molto utili quando vogliamo \nche la nostra funzione modifichi \ndelle variabili “esterne” al suo \ncorpo che non può modificare \ndirettamente."
		"HealthCoins":
			get_parent().get_parent().get_parent().get_parent().get_node("ScrollContainer2/VBoxContainerM/MenuEntries/Label").text = "I PV (Punti Vita) rappresentano la \nsalute del tuo personaggio: possono \nraggiungere il valore massimo di 15 \ne, se durante i combattimenti \ndovessero scendere a 0, saresti \ncostretto a ricominciare la partita \ndall’ultimo salvataggio. Le monete \nsono la valuta spendibile nel \nvillaggio, si guadagnano vincendo \ni combattimenti: ogni vittoria ti \nfarà guadagnare 10 monete."
		"Battles":
			get_parent().get_parent().get_parent().get_parent().get_node("ScrollContainer2/VBoxContainerM/MenuEntries/Label").text = "Per risolvere il bug e quindi \nsconfiggere il nemico il valore del \ntuo Attacco (ATT) dovrà essere \nuguale al numero di Punti Vita(PV) \ndel nemico. Per farlo dovrai \nmanipolare la ‘variabile’ ATT (che ha \ncome valore iniziale 2)attraverso \ni comandi proposti. Scrivi la giusta \nsequenza di istruzioni per vincere. \nSe il risultato è errato il nemico \nattaccherà, facendo scendere i tuoi \nPV in base al valore di ATT del \nnemico, se scendono a 0 hai perso e \ndovrai ricominciare dall'ultimo \nsalvataggio. Ogni istruzione può \nessere selezionata una sola volta \nusando il tasto invio (per \ndeselezionarla ripremi invio), dopo \nche hai selezionato le istruzioni \nche credi corrette, premi il \npulsante attacca con il mouse. \nPer usare un oggetto clicca due \nvolte sulla sua immagine dopo aver \naperto il menu “usa oggetto”. Se \nvuoi puoi tentare la fuga, ma non è \ncerto che essa abbia successo, in \ncaso di tentativo fallito il nemico \nattaccherà. Se ne hai acquistata \nalmeno una, potrai utilizzare le \nfunzioni premendo l’apposito tasto e \nselezionandone una dalla lista, ma \nricorda, puoi utilizzarne solo una \nalla volta e non potrai \nutilizzare altre istruzioni."
		"Inn":
			get_parent().get_parent().get_parent().get_parent().get_node("ScrollContainer2/VBoxContainerM/MenuEntries/Label").text = "Alla locanda puoi far riposare il \ntuo personaggio. Riposare ti \ncosterà 20 monete e ripristinerà \ntutti i PV. Puoi riposare anche se \nhai i PV al massimo, quindi \ncontrolla sempre i tuoi PV dal menu \ndi Pausa per evitare di sprecare \nmonete."
		"Shop":
			get_parent().get_parent().get_parent().get_parent().get_node("ScrollContainer2/VBoxContainerM/MenuEntries/Label").text = "Nel negozio del villaggio potrai \nutilizzare le monete per acquistare \npozioni curative e per creare le tue \nfunzioni. È consigliabile scegliere \ni nomi di ogni funzione in modo che \nrappresentino i bug a cui sono \ndedicate, perché durante i \ncombattimenti non potrai leggerne \nil corpo. Ogni funzione costa 50 \nmonete.La pozione curativa costa \ninvece 15 monete, si può assumere \ndurante i combattimenti e \nrispristina 5 PV."
		"Bugs":
			get_parent().get_parent().get_parent().get_parent().get_node("ScrollContainer2/VBoxContainerM/MenuEntries/Label").text = "I bug sono creature (umani e \nanimali del bosco) infettati da un \nvirus che altera il loro \ncomportamento rendendoli molto \naggressivi: attaccano chiunque gli \ncapiti a tiro, impedendo così agli \nabitanti dei villaggi vicini di \nattraversare il bosco. \nIl virus, secondo gli abitanti del \nvillaggio, è stato portato dal \nmostro nella montagna, che lo usa \nper piegare i malcapitati alla sua \nvolontà e usarli per tenere lontana \nla gente dalla sua tana."
		"Bridge":
			get_parent().get_parent().get_parent().get_parent().get_node("ScrollContainer2/VBoxContainerM/MenuEntries/Label").text = "Il ponte rotto nel bosco è l’unica \nvia per attraversare il fiume e \nquindi avvicinarsi alla montagna. \nÈ stato distrutto il giorno in cui \nil virus ha iniziato ad infettare le \ncreature che si trovavano nel bosco \ne nessuno dei falegnami del \nvillaggio ha mai voluto provare ad \naggiustarlo per paura di essere \nattaccato o infettato.\nSe vuoi che il ponte venga riparato, \nparla con il capo villaggio che ti \ndirà cosa fare."
