	object_const_def
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_LASS
	const GOLDENRODPOKECENTER1F_POKEFAN_F

GoldenrodPokecenter1F_MapScripts:
	def_scene_scripts
	scene_const SCENE_GOLDENRODPOKECENTER1F_GS_BALL

	def_callbacks

GoldenrodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

GoldenrodPokecenter1F_GSBallSceneLeft:
	setval BATTLETOWERACTION_GSBALL
	special BattleTowerAction
	ifequal GS_BALL_AVAILABLE, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1F_GSBallSceneRight:
	setval BATTLETOWERACTION_GSBALL
	special BattleTowerAction
	ifequal GS_BALL_AVAILABLE, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtRightDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromRightDoorwayTileMovement
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_PCC_TRADE_CORNER_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1FGameboyKidScript:
	jumptextfaceplayer GoldenrodPokecenter1FGameboyKidText

GoldenrodPokecenter1FLassScript:
	jumptextfaceplayer GoldenrodPokecenter1FLassText

GoldenrodPokecenter1FPokefanF:
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FAskGiveAwayAnEonMailText
	yesorno
	iffalse .NoEonMail
	takeitem EON_MAIL
	iffalse .NoEonMail
	writetext GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FPokefanFThisIsForYouText
	waitbutton
	verbosegiveitem REVIVE
	iffalse .NoRoom
	writetext GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText
	waitbutton
	closetext
	end

.NoEonMail:
	writetext GoldenrodPokecenter1FPokefanFTooBadText
	waitbutton
	closetext
	end

.NoRoom:
	giveitem EON_MAIL
	writetext GoldenrodPokecenter1FPokefanFAnotherTimeThenText
	waitbutton
	closetext
	end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtRightDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromRightDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

GoldenrodPokecomCenterWelcomeToTradeCornerText:
	text "Bonjour! Bienvenue"
	line "au Coin Troc du"
	cont "Centre #com."
	
	para "Içi, vous pouvez"
	line "faire des échanges"
	
	para "de #mon longue"
	line "distance."
	done

GoldenrodPokecomCenterWeMustHoldYourMonText:
	text "Pour faire un"
	line "échange, nous"
	cont "devons garder un"
	
	para "de vos #mon."
	line "Faire un échange?"
	done

GoldenrodPokecomCenterWhatMonDoYouWantText:
	text "Quel #mon"
	line "voulez-vous en"
	cont "échange?"
	done

GoldenrodPokecomCenterWeWillTradeYourMonForMonText:
	text "Bien, nous allons"
	line "essayer d'échanger"
	cont "votre"

	para "@"
	text_ram wStringBuffer3
	text " contre"
	line "@"
	text_ram wStringBuffer4
	text "."

	para "Pour cela, votre"
	line "#mon va rester"
	
	para "avec nous pendant"
	line "l'échange."

	para "Patientez un peu,"
	line "les préparations"
	cont "sont en cours."
	done

GoldenrodPokecomCenterWeWillTradeYourMonForNewText:
	text "Bien, nous allons"
	line "essayer d'échanger"
	cont "votre"

	para "@"
	text_ram wStringBuffer3
	text " contre un #mon"
	line "que vous n'avez"
	cont "jamais vu."

	para "Pour cela, votre"
	line "#mon va rester"
	
	para "avec nous pendant"
	line "l'échange."

	para "Patientez un peu,"
	line "les préparations"
	cont "sont en cours."
	done

GoldenrodPokecomCenterYourMonHasBeenReceivedText:
	text "Votre #mon a"
	line "bien été reçu."

	para "Trouver un parte-"
	line "naire d'échange"

	para "prendra un peu de"
	line "temps. Revenez"
	cont "plus tard s.v.p."
	done

GoldenrodPokecomCenterYouHaveOnlyOneMonText:
	text "Oh? Vous n'avez"
	line "qu'un seul #mon"
	cont "dans votre équipe."

	para "Revenez nous voir"
	line "quand vous aurez"
	cont "rajouté du monde"
	cont "à votre équipe."
	done

GoldenrodPokecomCenterWeHopeToSeeYouAgainText:
	text "Encore merci et"
	line "à bientôt!"
	done

GoldenrodPokecomCenterCommunicationErrorText: ; unreferenced
	text "Erreur de"
	line "communication..."
	done

GoldenrodPokecomCenterCantAcceptLastMonText:
	text "Si nous acceptons"
	line "ce #mon, votre"
	cont "équipe sera vide."
	done

GoldenrodPokecomCenterCantAcceptEggText:
	text "Désolé, mais nous"
	line "n'acceptons pas"
	cont "les Oeufs."
	done

GoldenrodPokecomCenterCantAcceptAbnormalMonText:
	text "Désolé, mais votre"
	line "#mon semble"
	cont "anormal."

	para "Nous ne pouvons"
	line "pas l'accepter."
	done

GoldenrodPokecomCenterAlreadyHoldingMonText:
	text "Oh? N'avons nous"
	line "pas déjà un de vos"
	cont "#mon avec nous?"
	done

GoldenrodPokecomCenterCheckingTheRoomsText:
	text "Nous vérifions"
	line "les salles."

	para "Attendez s.v.p."
	done

GoldenrodPokecomCenterTradePartnerHasBeenFoundText:
	text "Merci de votre"
	line "patience."

	para "Un partenaire"
	line "d'échange à été"  
	cont "trouvé."
	done

GoldenrodPokecomCenterItsYourNewPartnerText:
	text "Le voilà! Votre"
	line "nouveau compagnon!"

	para "Prenez soin de lui"
	line "et aimez-le de"
	cont "tout votre coeur."

	para "En espérant vous"
	line "revoir bientôt!"
	done

GoldenrodPokecomCenterYourPartyIsFullText:
	text "Mince alors! Votre"
	line "équipe est pleine!"

	para "Revenez nous voir"
	line "quand vous aurez"
	cont "fais de la place"
	cont "dans votre équipe."
	done

GoldenrodPokecomCenterNoTradePartnerFoundText:
	text "C'est malheureux,"
	line "mais personne ne"

	para "semble intéressé"
	line "par votre #mon."

	para "Voulez-vous le"
	line "récupérer?"
	done

GoldenrodPokecomCenterReturnedYourMonText:
	text "Votre #mon vous"
	line "a été rendu."
	done

GoldenrodPokecomCenterYourMonIsLonelyText:
	text "C'est malheureux,"
	line "mais personne ne"

	para "semble intéressé"
	line "par votre #mon."

	para "Il est maintenant"
	line "avec nous depuis"

	para "longtemps, et il"
	line "commence à se"
	cont "sentir très seul."

	para "Désolé mais nous"
	line "nous devons de"
	cont "vous le rendre."
	done

GoldenrodPokecenter1FWeHopeToSeeYouAgainText_2:
	text "Encore merci et"
	line "à bientôt!"
	done

GoldenrodPokecomCenterContinueToHoldYourMonText:
	text "Très bien. Votre"
	line "#mon va donc"
	cont "rester avec nous."
	done

GoldenrodPokecomCenterRecentlyLeftYourMonText:
	text "Oh? Vous nous avez"
	line "laissé votre #-"
	cont "mon que récemment."
	
	para "Revenez plus tard"
	line "s'il vous plaît."
	done

GoldenrodPokecomCenterSaveBeforeTradeCornerText:
	text "Nous allons Sauve-"
	line "garder avant la"

	para "connexion avec le"
	line "Centre."
	done

GoldenrodPokecomCenterWhichMonToTradeText:
	text "Quel #mon"
	line "échanger?"
	done

GoldenrodPokecomCenterTradeCanceledText:
	text "Je suis désolée,"
	line "mais l'échange doit"
	cont "être annulé."
	done

GoldenrodPokecomCenterEggTicketText:
	text "Oh!"

	para "Je vois que vous"
	line "avez un Ticket"
	cont "Oeuf!"

	para "C'est un coupon"
	line "que des personnes"

	para "spéciales peuvent"
	line "échanger contre"

	para "un #mon tout"
	line "aussi spécial!"
	done

GoldenrodPokecomCenterOddEggBriefingText:
	text "Laissez-moi tout"
	line "vous expliquer."

	para "Les échanges du"
	line "Coin Troc se font"

	para "entre dresseurs"
	line "qui ne se "
	cont "connaissent pas."

	para "Ainsi, trouver une"
	line "personne voulant"

	para "échanger avec vous"
	line "peut prendre un"
	cont "petit moment."

	para "L'Oeuf Bizarre,"
	line "quant à lui, est"

	para "offert à chaque"
	line "nouvel adhérent."

	para "Récupérez-le dès"
	line "maintenant en vous"
	cont "rendant au Centre!"
	done

GoldenrodPokecomCenterPleaseWaitAMomentText:
	text "Patientez un" 
	line "instant s.v.p."
	done

GoldenrodPokecomCenterHereIsYourOddEggText:
	text "Merci de votre"
	line "patience. Votre"

	para "Oeuf Bizarre a"
	line "bien été reçu."

	para "Le voici le voilà!"

	para "Donnez-lui tout"
	line "votre amour!"
	done

GoldenrodPokecomCenterNoEggTicketServiceText:
	text "Désolé, mais nous"
	
	para "n'acceptons pas"
	line "les Tiquets Oeuf"
	cont "pour l'instant."
	done

GoldenrodPokecomCenterNewsMachineText:
	text "C'est le Terminal"
	line "des Infos #mon."
	done

GoldenrodPokecomCenterWhatToDoText:
	text "Que voulez-vous"
	line "faire?"
	done

GoldenrodPokecomCenterNewsMachineExplanationText:
	text "Les Infos #mon"
	line "proviennent des"

	para "Sauvegardes des"
	line "dresseurs #mon."

	para "Lors de la lecture"
	line "des Infos, votre"

	para "Sauvegarde pourra"
	line "être envoyée si"
	cont "vous le souhaitez."

	para "Votre Sauvegarde"
	line "contiendra le"

	para "récit de vos"
	line "aventures et votre"
	cont "profile mobile."

	para "Votre numéro de"
	line "mobile ne sera pas"
	cont "communiqué."

	para "Le contenu des"
	line "Infos dépendra des"

	para "Sauvegardes que"
	line "vous et les autres"

	para "dresseurs #mon"
	line "enverrez."

	para "Vous pourriez même"
	line "passer aux Infos!"
	done

GoldenrodPokecomCenterWouldYouLikeTheNewsText:
	text "Recevoir les "
	line "dernières Infos?"
	done

GoldenrodPokecomCenterReadingTheLatestNewsText:
    text "Chargement des"
    line "dernières Infos."
    cont "Attendre s.v.p."
    done

GoldenrodPokecomCenterNoOldNewsText:
	text "Il n'y a aucunes"
	line "anciennes Infos…"
	done

GoldenrodPokecomCenterCorruptedNewsDataText:
	text "Les données Infos"
	line "sont corrompues."

	para "Téléchargez les"
	line "Infos à nouveau"
	cont "s.v.p."
	done

GoldenrodPokecomCenterMakingPreparationsText:
	text "Des réglages sont"
	line "encore en cours."

	para "Revenez plus tard"
	line "s.v.p."
	done

GoldenrodPokecomCenterSaveBeforeNewsMachineText:
	text "Nous allons Sauve-"
	line "garder la partie"

	para "avant de démarrer"
	line "le Terminal Infos."
	done

GoldenrodPokecenter1FMobileOffSuperNerdText:
	text "Ce Centre #mon"
	line "est immense! Ils"
	
	para "l'ont construit il"
	line "y a pas longtemps."
	
	para "J'ai jamais vu de"
	line "machines comme"
	cont "celles-ci."
	done

GoldenrodPokecenter1FMobileOnSuperNerdText:
	text "Je viens d'avoir"
	line "une super idée"
	cont "pour le Coin Troc!"

	para "Prends un Roucool,"
	line "fais-lui tenir une"

	para "Lettre, et ensuite"
	line "échange-le contre"
	cont "un autre!"

	para "Si tout le monde"
	line "faisait ça, les"

	para "Lettres pourraient"
	line "être échangées de"
	cont "par le monde!"

	para "Avec ce système de"
	line "Roucool Voyageurs,"

	para "je suis sûr de me"
	line "faire des amis!"
	done

GoldenrodPokecenter1FMobileOffLassText:
	text "Apparemment, tu"
	line "peut échanger tes"
	
	para "#mon avec des"
	line "inconnus par ici."
	
	para "Mais ils ont pas"
	line "encore fini avec"
	cont "leurs réglages."
	done

GoldenrodPokecenter1FMobileOnLassText1:
	text "Une fille que je"
	line "connais pas viens"

	para "de m'envoyer son"
	line "Granivol."

	para "Quand tu fait un"
	line "échange, dit bien"
	
	para "quel #mon tu"
	line "veut en retour."
	done

GoldenrodPokecenter1FMobileOnLassText2:
	text "Le Granivol qu'on"
	line "m'a échangé est"
	
	para "femelle, mais son"
	line "ancien dresseur l'a"
	cont "appelée Michel."

	para "Mon papa aussi il"
	line "s'appelle comme ça!"
	done

GoldenrodPokecenter1FMobileOffYoungsterText:
	text "C'est quoi le"
	line "Terminal Infos?"

	para "Est-ce qu'il reçoit"
	line "ses infos sur une"
	cont "zone plus large"
	cont "que la radio?"
	done

GoldenrodPokecenter1FMobileOffTeacherText:
	text "Le Centre #com"
	line "peut se connecter"

	para "à tous les Centres"
	line "#mon sur le"
	cont "réseau sans-fil."

	para "Que d'opportunités"
	line "pour se faire de"
	cont "nouveaux amis!"
	done

GoldenrodPokecenter1FMobileOffRockerText:
	text "Les machines que"
	line "vous voyez ne sont"
	cont "pas encore prêtes."

	para "Mais bon, c'est"
	line "sympa d'arriver"

	para "dans un endroit"
	line "branché avant les"
	cont "autres."
	done

GoldenrodPokecenter1FMobileOnYoungsterText:
	text "Mon ami est passé"
	line "aux Infos il y a"
	
	para "pas longtemps."
	line "Ca m'a surpris de"
	cont "le voir là-dedans!"
	done

GoldenrodPokecenter1FMobileOnTeacherText:
	text "Je stresse si je"
	line "regarde pas les"
	cont "dernières Infos!"
	done

GoldenrodPokecenter1FMobileOnRockerText:
	text "Si je passe aux"
	line "Infos, je serais"
	
	para "une célébrité, et"
	line "tout le monde"
	
	para "m'aimerait!"
	line "Euh... Comment on"
	
	para "fait pour passer"
	line "aux Infos?"
	done

GoldenrodPokecenter1FGameboyKidText:
	text "Le Colisée sert"
	line "à faire des com-"
	cont "bats en Link."

	para "Les records sont"
	line "affichés sur le"
	cont "mur. Perdre, c'est"
	cont "la honte!"
	done

GoldenrodPokecenter1FMobileOffGrampsText:
	text "Je suis venu dès"
	line "que j'ai appris que"

	para "le Centre #mon"
	line "de Doublonville"
	cont "avait été rénové."

	para "Il est maintenant"
	line "à la pointe de la"

	para "technologie, du"
	line "jamais vu!"

	para "Malheureusement,"
	line "il n'est pas encore"
	cont "opérationnel."
	done

GoldenrodPokecenter1FMobileOnGrampsText:
	text "J'me sens rajeunir"
	line "juste en voyant"

	para "tous ces nouveaux"
	line "trucs ici!"
	done

GoldenrodPokecenter1FLassText:
	text "Un #mon de"
	line "niveau élevé ne"
	cont "gagnera pas à tous"
	cont "les coups."

	para "Après tout, il y a"
	line "peut-être un type"
	cont "désavantagé."

	para "Je ne crois pas"
	line "qu'il y ait un"

	para "type de #mon"
	line "qui soit le plus"
	cont "résistant."
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText:
	text "<PLAYER>?"

	para "Félicitations!"

	para "En cadeau spécial,"
	line "une GS Ball vous a"
	cont "été envoyée!"

	para "C'est pour vous!"
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText:
	text "A très bientôt!"
	done

GoldenrodPokecomCenterSignText:
	text "Centre #com"
	line "A Propos du RDC"

	para "Gauche:"
	line "administration"

	para "Centre:"
	line "Coin Troc"

	para "Droite:"
	line "Infos #mon"
	done

GoldenrodPokecomCenterNewsMachineNotYetText:
	text "C'est une machine"
	line "d'Infos #mon!"

	para "Elle ne marche"
	line "pas maintenant…"
	done

GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText:
	text "Ton Sac a l'air"
	line "siiiii lourd!"

	para "Oh! As-tu un truc"
	line "du nom de Letr"
	cont "Evoli?"

	para "Ma fille en veut"
	line "une."

	para "Tu peux m'en"
	line "donner une?"
	done

GoldenrodPokecenter1FAskGiveAwayAnEonMailText:
	text "Donner Letr.Evoli?"
	done

GoldenrodPokecenter1FPokefanFThisIsForYouText:
	text "Oh, formidable!"
	line "Merci merci!"
	cont "Voilà pour toi!"
	done

GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText:
	text "Ma fille sera"
	line "ravie!"
	done

GoldenrodPokecenter1FPokefanFTooBadText:
	text "Oh? Tu n'en as"
	line "pas? Dommage."
	done

GoldenrodPokecenter1FPokefanFAnotherTimeThenText:
	text "Oh... Une autre"
	line "fois, alors."
	done

GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText:
	text "<PLAYER> donne"
	line "la Letr.Evoli."
	done

GoldenrodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, GOLDENROD_CITY, 15
	warp_event  4,  7, GOLDENROD_CITY, 15
	warp_event  0,  6, POKECOM_CENTER_ADMIN_OFFICE_MOBILE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events
	coord_event  3,  7, SCENE_GOLDENRODPOKECENTER1F_GS_BALL, GoldenrodPokecenter1F_GSBallSceneLeft
	coord_event  4,  7, SCENE_GOLDENRODPOKECENTER1F_GS_BALL, GoldenrodPokecenter1F_GSBallSceneRight

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event 16,  8, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLassScript, -1
	object_event  7,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPokefanF, -1
