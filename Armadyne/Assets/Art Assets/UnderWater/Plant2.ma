//Maya ASCII 2012 scene
//Name: Plant2.ma
//Last modified: Fri, Mar 23, 2012 02:42:39 AM
//Codeset: 1252
requires maya "2012";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya 2012";
fileInfo "version" "2012 x64";
fileInfo "cutIdentifier" "001200000000-796618";
fileInfo "osv" "Microsoft Windows 7 Enterprise Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
fileInfo "license" "education";
createNode transform -n "Plant2";
	setAttr ".t" -type "double3" 7 0 0 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" -7 0 0 ;
	setAttr ".sp" -type "double3" -7 0 0 ;
createNode mesh -n "PlantShape2" -p "Plant2";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.36287114794850239 0.58901813178665541 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode mesh -n "PlantShape2Orig" -p "Plant2";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 45 ".uvst[0].uvsp[0:44]" -type "float2" 0.67361611 0.31641126
		 0.36968416 0.38392606 0.46614155 0.24528046 0.53295285 0.24528046 0.76936668 0.36304438
		 0.32322758 0.49790406 0.36287117 0.58901817 0.7365427 0.49974608 0.44362748 0.75432789
		 0.63897693 0.7168715 0.5686307 0.89180624 0.52030092 0.8937788 0.40324938 0.67167318
		 0.68775976 0.60830885 0.4819642 0.82405335 0.60380381 0.80433893 0.41791284 0.31460327
		 0.60328448 0.28084585 0.53238338 0.89328563 0.51242411 0.81912476 0.49246484 0.74496382
		 0.47437698 0.65583205 0.45628905 0.56670016 0.43476236 0.46418914 0.44566715 0.36704737
		 0.46425575 0.30616391 0.48284435 0.24528046 0.54446584 0.89279246 0.54288399 0.81419617
		 0.5413022 0.73559976 0.54550457 0.63999099 0.54970694 0.5443821 0.54629719 0.43047422
		 0.52165014 0.35016865 0.51059866 0.29772455 0.49954718 0.24528044 0.55654824 0.89229935
		 0.57334387 0.80926752 0.59013957 0.72623563 0.61663216 0.62414992 0.64312482 0.52206409
		 0.65783191 0.3967593 0.59763312 0.33328995 0.55694157 0.28928518 0.51625001 0.24528044;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 45 ".pt[0:44]" -type "float3"  0 0 0.51449728 0 0 0.51449728 
		-0.23057623 0 -2.6695037 -0.19256955 0 -2.6790068 0 0 -0.15642343 0 0 -0.15642343 
		0.23057623 0 -2.6842458 0 0 -0.97071546 0 0 -0.96717882 0.17611191 0 -2.6814358 0 
		0 -0.9682557 0 0 -0.9682557 0 0 -1.9226283 0 0 -1.6520066 0 0 -0.9682557 0 0 -0.9682557 
		0 0 -0.9682557 0 4.4703484e-008 -0.96825588 0 0 -0.10914063 0 0 0 0 0 0 0 0 0 0 0 
		0.0006073516 0 0 0.00087523158 0 0 -0.0015755828 0 0 0 0 0 0.81055272 0 0 -0.073064424 
		0 0 0.73876798 0 0 0.73876798 0 0 0.73876798 0 0 0.7399826 0 0 0.73242873 0 0 0.73807651 
		0 0 0.73876798 0 0 1.0364398 0 0 -0.10914063 0 0 0 0 0 0 0 0 0 0 0 0.0018220547 0 
		0 0.0082463566 0 0 0.00019274191 0 0 0 0 0 0.81055272;
	setAttr -s 45 ".vt[0:44]"  -8 0 0 -6 0 0 0.80294073 4.21009541 0.039960884
		 -0.41524196 8.46925545 0.0081362631 -5.38013077 19.47606087 0 -6.82689285 19.53511238 0
		 -13.97785854 7.19900703 -0.0094120065 -12.25416756 4.075258255 -0.0082378704 -1.82997453 2.56336045 0.0036066326
		 -12.23217392 10.20835304 0 -2.82615471 14.11713791 0 -9.52953339 14.87173271 0 -10.8808527 12.54004383 0
		 -1.54916716 11.43767834 0 -4.10314322 16.79660034 0 -8.17821312 17.20342255 0 -9.85170555 1.81036758 0
		 -3.85443258 1.37021458 0 -6.46520233 19.5203495 0 -7.15944576 17.101717 0 -7.85368872 14.68308353 0
		 -8.54793167 12.26445293 0 -9.27794075 9.77357864 0.0020340658 -10.28265858 6.45177937 0.0029312158
		 -9.64811993 3.69728374 -0.0052767447 -8.35238743 1.7003293 0 -7.5 0 0 -6.10351181 19.50558662 0
		 -6.14067793 17.000011444092 0 -6.17784405 14.49443531 0 -6.21500969 11.98886108 0
		 -6.32370758 9.33880424 0.0040681316 -6.96883106 5.78117275 -0.021230366 -7.042071342 3.31930923 -0.0023156186
		 -6.85306883 1.59029102 0 -7 0 0 -5.74182129 19.49082375 0 -5.12191057 16.89830589 0
		 -4.50199938 14.30578613 0 -3.88208842 11.71327019 0 -3.36947489 8.90402985 0.0061021973
		 -2.89225888 4.95732307 0.027617661 -4.43602276 2.94133472 0.00064550701 -5.35375071 1.48025274 0
		 -6.5 0 0;
	setAttr -s 76 ".ed[0:75]"  0 26 0 2 3 0 4 36 0 6 7 0 8 2 0 2 41 1 9 6 0
		 3 40 1 11 12 0 3 13 0 12 9 0 13 10 0 12 21 1 10 14 0 5 15 0 10 38 1 14 4 0 15 11 0
		 14 37 1 7 16 0 1 17 0 7 24 1 16 0 0 17 8 0 16 25 1 18 5 0 19 15 1 18 19 1 20 11 1
		 19 20 1 21 30 1 20 21 1 22 9 1 21 22 1 23 6 1 22 23 1 24 33 1 23 24 1 25 34 1 24 25 1
		 26 35 0 25 26 1 27 18 0 28 19 1 27 28 1 29 20 1 28 29 1 30 39 1 29 30 1 31 22 1 30 31 1
		 32 23 1 31 32 1 33 42 1 32 33 1 34 43 1 33 34 1 35 44 0 34 35 1 36 27 0 37 28 1 36 37 1
		 38 29 1 37 38 1 39 13 1 38 39 1 40 31 1 39 40 1 41 32 1 40 41 1 42 8 1 41 42 1 43 17 1
		 42 43 1 44 1 0 43 44 1;
	setAttr -s 32 ".fc[0:31]" -type "polyFaces" 
		f 4 69 -6 1 7
		mu 0 4 40 41 4 7
		f 4 -65 67 -8 9
		mu 0 4 13 39 40 7
		f 4 -19 16 2 61
		mu 0 4 37 15 10 36
		f 4 64 11 15 65
		mu 0 4 39 13 9 38
		f 4 18 63 -16 13
		mu 0 4 15 37 38 9
		f 4 72 23 -71 73
		mu 0 4 43 17 0 42
		f 4 4 5 71 70
		mu 0 4 0 4 41 42
		f 4 -73 75 74 20
		mu 0 4 17 43 44 3
		f 4 -27 -28 25 14
		mu 0 4 14 19 18 11
		f 4 -30 26 17 -29
		mu 0 4 20 19 14 8
		f 4 12 -32 28 8
		mu 0 4 12 21 20 8
		f 4 -34 -13 10 -33
		mu 0 4 22 21 12 6
		f 4 6 -35 -36 32
		mu 0 4 6 5 23 22
		f 4 -38 34 3 21
		mu 0 4 24 23 5 1
		f 4 24 -40 -22 19
		mu 0 4 16 25 24 1
		f 4 -42 -25 22 0
		mu 0 4 26 25 16 2
		f 4 -44 -45 42 27
		mu 0 4 19 28 27 18
		f 4 -47 43 29 -46
		mu 0 4 29 28 19 20
		f 4 30 -49 45 31
		mu 0 4 21 30 29 20
		f 4 -51 -31 33 -50
		mu 0 4 31 30 21 22
		f 4 35 -52 -53 49
		mu 0 4 22 23 32 31
		f 4 -55 51 37 36
		mu 0 4 33 32 23 24
		f 4 38 -57 -37 39
		mu 0 4 25 34 33 24
		f 4 -59 -39 41 40
		mu 0 4 35 34 25 26
		f 4 -61 -62 59 44
		mu 0 4 28 37 36 27
		f 4 -64 60 46 -63
		mu 0 4 38 37 28 29
		f 4 47 -66 62 48
		mu 0 4 30 39 38 29
		f 4 -68 -48 50 -67
		mu 0 4 40 39 30 31
		f 4 52 -69 -70 66
		mu 0 4 31 32 41 40
		f 4 -72 68 54 53
		mu 0 4 42 41 32 33
		f 4 55 -74 -54 56
		mu 0 4 34 43 42 33
		f 4 -76 -56 58 57
		mu 0 4 44 43 34 35;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode joint -n "PlantRootJoint2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -127.41030475708696 -1.2879156511013388 90.984872989857848 ;
	setAttr ".bps" -type "matrix" -0.017184087633287382 0.99959967745753564 0.022476475680193786 0
		 0.60712208874731355 0.028292840557123999 -0.79410470627512864 0 -0.79442273160283539 -3.3306690738754696e-016 -0.60736523074068804 0
		 0 0 0 1;
	setAttr ".radi" 0.64764536420057428;
createNode joint -n "joint7" -p "PlantRootJoint2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 152.4902001121234 3.66110844883432 8.6115903545916002 ;
	setAttr ".bps" -type "matrix" 0.12449423690897155 0.99054110236268178 -0.057701902105356383 0
		 -0.89870241990424615 0.13721634206654565 0.41654007721722158 0 0.42051771120216197 -3.5571652791406473e-016 0.90728432950497639 0
		 -0.06625240846281702 3.8539076117100119 0.086656951439436511 1;
	setAttr ".radi" 0.70677618106830709;
createNode joint -n "joint8" -p "joint7";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 9.5484175563885447 0.37512702325604491 5.6578486697757455 ;
	setAttr ".bps" -type "matrix" 0.032532808492747721 0.99922197513436839 -0.022294859949009684 0
		 -0.82424493337886962 0.039439122816966342 0.56485825247639898 0 0.56529806843013097 -8.0163971029573804e-017 0.82488671575505601 0
		 0.55696743055349118 8.8125698091006335 -0.20219955335868756 1;
	setAttr ".radi" 0.74976746173790254;
createNode joint -n "joint9" -p "joint8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 38.10979949959362 3.0509253619067565 -1.6215494094566614 ;
	setAttr ".bps" -type "matrix" 0.025677620414723816 0.99629167209122393 -0.082119205619091806 0
		 -0.29733101422508246 0.086040130878987639 0.95088977482051529 0 0.95442911092952376 -7.221808946739321e-016 0.29843771914803041 0
		 0.74664303373236585 14.638320478166118 -0.33218498051784762 1;
	setAttr ".radi" 0.72026566271447823;
createNode joint -n "joint10" -p "joint9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 5.2762900732623281 -1.7503359872605984e-015 -3.8163916471489756e-015 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -72.636206942873827 -85.064160885541384 ;
	setAttr ".bps" -type "matrix" 1 -1.2305041937386927e-015 -1.1657341758564144e-015 0
		 1.1032841307212493e-015 1.0000000000000002 -1.0547118733938987e-015 0 9.9920072216264089e-016 9.3633036902982682e-016 1 0
		 0.88212560743156809 19.895044337694969 -0.76546972995005258 1;
	setAttr ".radi" 0.72026566271447823;
createNode animCurveTU -n "Plant2_visibility";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 60 ".ktv[0:59]"  1 1 2 1 3 1 4 1 5 1 6 1 7 1 8 1 9 1 10 1
		 11 1 12 1 13 1 14 1 15 1 16 1 17 1 18 1 19 1 20 1 21 1 22 1 23 1 24 1 25 1 26 1 27 1
		 28 1 29 1 30 1 31 1 32 1 33 1 34 1 35 1 36 1 37 1 38 1 39 1 40 1 41 1 42 1 43 1 44 1
		 45 1 46 1 47 1 48 1 49 1 50 1 51 1 52 1 53 1 54 1 55 1 56 1 57 1 58 1 59 1 60 1;
createNode groupId -n "skinCluster2GroupId";
	setAttr ".ihi" 0;
createNode objectSet -n "skinCluster2Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode skinCluster -n "skinCluster2";
	setAttr -s 45 ".wl";
	setAttr -s 5 ".wl[0].w[0:4]"  0.99344129797782432 0.0062711726559620748 
		0.00024428299542677889 3.3377217219557522e-005 9.8691535673131626e-006;
	setAttr -s 5 ".wl[1].w[0:4]"  0.99362045861117854 0.0060763659344837719 
		0.00025875358115842707 3.4361759264093538e-005 1.0060113915063807e-005;
	setAttr -s 5 ".wl[2].w[0:4]"  0.32988559684751517 0.3523418464962082 
		0.24579548440533874 0.055454502103038913 0.016522570147899016;
	setAttr -s 5 ".wl[3].w[0:4]"  0.12174444193450115 0.37452001819497793 
		0.37452001819497782 0.1067910156805998 0.022424505994943316;
	setAttr -s 5 ".wl[4].w[0:4]"  7.7861758806878448e-006 3.600433562740906e-005 
		0.00081101175751212349 0.60002388366772097 0.39912131406325874;
	setAttr -s 5 ".wl[5].w[0:4]"  6.6651114350524576e-006 3.0438042483458272e-005 
		0.00068100740220227688 0.59844757612472843 0.40083431331915076;
	setAttr -s 5 ".wl[6].w[0:4]"  0.27150630994182534 0.34264334324741907 
		0.28381081507192435 0.080008494350943385 0.022031037387887763;
	setAttr -s 5 ".wl[7].w[0:4]"  0.43664960888885751 0.43664960888885729 
		0.10680511037971732 0.015738154946712078 0.0041575168958558877;
	setAttr -s 5 ".wl[8].w[0:4]"  0.47056018889604639 0.41114295121425326 
		0.10097670426282604 0.013634076356788299 0.0036860792700861207;
	setAttr -s 5 ".wl[9].w[0:4]"  0.10083060260261699 0.34206411558325062 
		0.37159668283452596 0.15507516399086693 0.030433434988739419;
	setAttr -s 5 ".wl[10].w[0:4]"  0.0045250141200638199 0.040080811768500445 
		0.46563174659001028 0.45400230606570857 0.035760121455716824;
	setAttr -s 5 ".wl[11].w[0:4]"  0.0035019907867735031 0.026401360896136723 
		0.4621347266754306 0.46547765865336521 0.042484262988293962;
	setAttr -s 5 ".wl[12].w[0:4]"  0.027662419251789045 0.18312997237549608 
		0.44468082211369653 0.30444423520334019 0.040082551055678262;
	setAttr -s 5 ".wl[13].w[0:4]"  0.033433067692344449 0.25497073726458053 
		0.44198347619009015 0.23774756391630839 0.031865154936676521;
	setAttr -s 5 ".wl[14].w[0:4]"  0.00049870643997695864 0.0032209835982722245 
		0.16729290281031001 0.74536898937637863 0.083618417775062237;
	setAttr -s 5 ".wl[15].w[0:4]"  0.00041052532752434788 0.0024438013372310012 
		0.11713060069266348 0.77935722364583182 0.10065784899674934;
	setAttr -s 5 ".wl[16].w[0:4]"  0.66771008252556086 0.3157926908678883 
		0.014336475985695927 0.0016985181409813945 0.00046223247987349524;
	setAttr -s 5 ".wl[17].w[0:4]"  0.69981656529426262 0.27521851816758819 
		0.021695283172653131 0.0025672376243069516 0.00070239574118907222;
	setAttr -s 5 ".wl[18].w[0:4]"  2.7278068962157609e-006 1.2538370019371404e-005 
		0.00028791548224317088 0.65523110669705498 0.34446571164378625;
	setAttr -s 5 ".wl[19].w[0:4]"  4.6260994100930915e-005 0.00029706745599593435 
		0.029088192248531642 0.95468845512248124 0.015880024178890121;
	setAttr -s 5 ".wl[20].w[0:4]"  0.00025535377749307626 0.0026651540630705409 
		0.49670487527429047 0.49662413260212268 0.003750484283023181;
	setAttr -s 5 ".wl[21].w[0:4]"  0.0035741477356065962 0.07081217210597425 
		0.76422568421202797 0.15684786395979017 0.0045401319866010528;
	setAttr -s 5 ".wl[22].w[0:4]"  0.021890075294668548 0.43091380095776399 
		0.51225069366054898 0.032211567418061589 0.0027338626689566996;
	setAttr -s 5 ".wl[23].w[0:4]"  0.27249995312265995 0.52174014757318643 
		0.19227444426332288 0.011466166663838623 0.0020192883769922215;
	setAttr -s 5 ".wl[24].w[0:4]"  0.49191192035004211 0.48999535106498665 
		0.016527873105911781 0.0012749160582878082 0.00028993942077182219;
	setAttr -s 5 ".wl[25].w[0:4]"  0.92721656531999874 0.071696027257407702 
		0.00096602205108615676 9.6277062099892367e-005 2.5108309407470362e-005;
	setAttr -s 5 ".wl[26].w[0:4]"  0.99647069951836464 0.0033783230266661636 
		0.00012850928140188355 1.7358217084054382e-005 5.1099564832459275e-006;
	setAttr -s 5 ".wl[27].w[0:4]"  2.1125260803756983e-006 9.7501941241515779e-006 
		0.00022594193547433909 0.67918509766484003 0.32057709767948117;
	setAttr -s 5 ".wl[28].w[0:4]"  7.7678796551411755e-005 0.00050903905895727632 
		0.051873832107327336 0.92675865684107162 0.02078079319609237;
	setAttr -s 5 ".wl[29].w[0:4]"  5.1260132332674482e-005 0.00060756859437274336 
		0.51107897110509115 0.48758279153211714 0.00067940863608627984;
	setAttr -s 5 ".wl[30].w[0:4]"  0.00023221458874429402 0.0086579957309197934 
		0.97508153342218162 0.015777419170132621 0.00025083708802166869;
	setAttr -s 5 ".wl[31].w[0:4]"  0.00055283340372394227 0.37899885613473761 
		0.61978331879733417 0.00062375648968327011 4.1235174521005612e-005;
	setAttr -s 5 ".wl[32].w[0:4]"  0.018151180608302904 0.97889784453067774 
		0.0028955148709309628 4.7939391222794472e-005 7.5205988656285891e-006;
	setAttr -s 5 ".wl[33].w[0:4]"  0.72376821284166537 0.27608168097801145 
		0.00014011820582086499 8.1969778671261053e-006 1.7909966351864113e-006;
	setAttr -s 5 ".wl[34].w[0:4]"  0.99118288669366239 0.008709221645973049 
		9.6263196378169825e-005 9.2404658886043739e-006 2.3879980978101913e-006;
	setAttr -s 5 ".wl[35].w[0:4]"  0.99516766001644819 0.0046192542754811871 
		0.00018148290028468652 2.4427080892451857e-005 7.1757268935962576e-006;
	setAttr -s 5 ".wl[36].w[0:4]"  3.0906785652421184e-006 1.4295465178017516e-005 
		0.00032940248032325579 0.6531200287871598 0.34653318258877375;
	setAttr -s 5 ".wl[37].w[0:4]"  6.2524045476289563e-005 0.00041934993388438027 
		0.044802384711050226 0.93774592714175908 0.016969814167830097;
	setAttr -s 5 ".wl[38].w[0:4]"  0.00038939959184079883 0.0045232508106706421 
		0.50752712918948573 0.48315515908408713 0.0044050613239156608;
	setAttr -s 5 ".wl[39].w[0:4]"  0.0053467773061487032 0.12268343726309133 
		0.73127838078687435 0.13543420779188903 0.0052571968519966759;
	setAttr -s 5 ".wl[40].w[0:4]"  0.027675066569623784 0.4707065136215336 
		0.47417990472310162 0.024884286386106715 0.0025542286996343777;
	setAttr -s 5 ".wl[41].w[0:4]"  0.35106291783307586 0.47466991575724543 
		0.16100845167542191 0.011033984858275083 0.0022247298759815576;
	setAttr -s 5 ".wl[42].w[0:4]"  0.55211074762115364 0.42889184563297122 
		0.017379495787763398 0.0013127309329361788 0.00030518002517554064;
	setAttr -s 5 ".wl[43].w[0:4]"  0.90159120032696072 0.095786671629646422 
		0.0023288493623679768 0.00023245748308668623 6.0821197938245749e-005;
	setAttr -s 5 ".wl[44].w[0:4]"  0.99651857020194601 0.0033262800659693134 
		0.00013236242624866285 1.7624622843383276e-005 5.1626829926165331e-006;
	setAttr -s 5 ".pm";
	setAttr ".pm[0]" -type "matrix" -0.017184087633287378 0.60712208874731344 -0.7944227316028355 -0
		 0.99959967745753553 0.028292840557124041 -3.0010716134398763e-016 -0 0.022476475680193734 -0.79410470627512864 -0.60736523074068816 -0
		 -0 0 -0 1;
	setAttr ".pm[1]" -type "matrix" 0.12449423690897153 -0.89870241990424615 0.4205177112021623 -0
		 0.99054110236268178 0.13721634206654565 -3.8857805861880489e-016 0 -0.057701902105356404 0.41654007721722153 0.90728432950497695 -0
		 -3.8042055801434986 -0.62445639819527499 -0.050762182915258455 1;
	setAttr ".pm[2]" -type "matrix" 0.032532808492747707 -0.82424493337886939 0.5652980684301312 -0
		 0.99922197513436828 0.039439122816966321 -1.1449174941446927e-016 0 -0.022294859949009715 0.56485825247639876 0.82488671575505634 -0
		 -8.8283411361378157 0.22573164601824963 -0.14806088717319377 1;
	setAttr ".pm[3]" -type "matrix" 0.025677620414723785 -0.29733101422508229 0.95442911092952398 -0
		 0.99629167209122382 0.086040130878987639 -7.3899220076612002e-016 0 -0.082119205619091848 0.95088977482051573 0.29843771914803074 -0
		 -14.630487568923524 -0.72161157798286746 -0.61348131894591429 1;
	setAttr ".pm[4]" -type "matrix" 1 1.2305041937386913e-015 1.1657341758564157e-015 -0
		 -1.1032841307212501e-015 0.99999999999999978 1.0547118733938971e-015 0 -9.992007221626399e-016 -9.363303690298278e-016 1 -0
		 -0.88212560743154689 -19.895044337694966 0.7654697299500306 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 7 0 0 1;
	setAttr -s 5 ".ma";
	setAttr -s 5 ".dpf[0:4]"  4 4 4 4 4;
	setAttr -s 5 ".lw";
	setAttr -s 5 ".lw";
	setAttr ".mmi" yes;
	setAttr ".mi" 5;
	setAttr ".ucm" yes;
	setAttr ".nw" 2;
createNode dagPose -n "bindPose2";
	setAttr -s 5 ".wm";
	setAttr -s 5 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 -0.6248776485341504 -0.6428145453649714 0.30883896140848033 0.31770407700529613 1
		 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.8554510356709586 5.8980598183211441e-016
		 -1.2212453270876722e-015 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.96751568230555318 0.080463016173378449 -0.013097612428451529 0.23930641460223503 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 5.006013567294687 2.0677903833643541e-015
		 -1.1657341758564144e-015 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.082966394630685128 0.0073659357633821601 0.048910357962324028 0.99532411667572518 1
		 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 0 5.8302867771518727 7.6327832942979512e-015
		 -4.163336342344337e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.32668165889068546 0.020541964626877195 -0.022060390813830336 0.94465361937105752 1
		 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 0 0 0 0 5.2762900732623281 -1.7503359872605984e-015
		 -3.8163916471489756e-015 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.40037475269667816 -0.43644151707766987 -0.54468338689883011 0.59374983588244912 1
		 1 1 yes;
	setAttr -s 5 ".m";
	setAttr -s 5 ".p";
	setAttr ".bp" yes;
createNode animCurveTU -n "PlantRootJoint2_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
createNode animCurveTU -n "PlantRootJoint2_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
createNode animCurveTU -n "PlantRootJoint2_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
createNode animCurveTA -n "PlantRootJoint2_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 -0.02785606052560901 60 0;
createNode animCurveTA -n "PlantRootJoint2_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 2.6888341281689541 60 0;
createNode animCurveTA -n "PlantRootJoint2_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 2.0556562891184091 60 0;
createNode animCurveTU -n "PlantRootJoint2_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTL -n "PlantRootJoint2_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 0 60 0;
createNode animCurveTL -n "PlantRootJoint2_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 0 60 0;
createNode animCurveTL -n "PlantRootJoint2_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 0 60 0;
createNode animCurveTU -n "joint7_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 7 1 37 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint7_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 7 1 37 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint7_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 7 1 37 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint7_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -0.19886278142162286 7 -0.27135362708259003
		 37 0.24014255670099763 60 -0.19886278142162286;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.99991995096206665 1 1 0.9999203085899353;
	setAttr -s 4 ".kiy[0:3]"  -0.0126555310562253 0 0 -0.012625285424292088;
	setAttr -s 4 ".kox[0:3]"  0.99991995096206665 1 1 0.9999203085899353;
	setAttr -s 4 ".koy[0:3]"  -0.012655528262257576 0 0 -0.012625285424292088;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint7_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 2.3066030000007269 7 3.0485932554382269
		 37 -1.4198101096872704 60 2.3066030000007269;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.9951358437538147 1 1 0.99515831470489502;
	setAttr -s 4 ".kiy[0:3]"  0.098512232303619385 0 0 0.098285496234893799;
	setAttr -s 4 ".kox[0:3]"  0.9951358437538147 1 1 0.99515831470489502;
	setAttr -s 4 ".koy[0:3]"  0.098512247204780579 0 0 0.098285481333732605;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint7_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 5.5758140003394088 7 6.5954993590176576
		 37 -3.1091577268265089 60 5.5758140003394088;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.98917675018310547 1 1 0.98887079954147339;
	setAttr -s 4 ".kiy[0:3]"  0.14672939479351044 0 0 0.14877733588218689;
	setAttr -s 4 ".kox[0:3]"  0.98917669057846069 1 1 0.98887073993682861;
	setAttr -s 4 ".koy[0:3]"  0.14672952890396118 0 0 0.14877726137638092;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint7_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 7 1 37 1 60 1;
	setAttr -s 4 ".kot[0:3]"  5 5 5 5;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint7_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 3.8554510356709586 7 3.8554510356709586
		 37 3.8554510356709586 60 3.8554510356709586;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint7_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 5.8980598183211441e-016 7 5.8980598183211441e-016
		 37 5.8980598183211441e-016 60 5.8980598183211441e-016;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint7_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -1.2212453270876722e-015 7 -1.2212453270876722e-015
		 37 -1.2212453270876722e-015 60 -1.2212453270876722e-015;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint8_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 15 1 45 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint8_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 15 1 45 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint8_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 15 1 45 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint8_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0.08826044538348414 15 -0.021798033906526043
		 45 0.21593606321060629 60 0.08826044538348414;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.99996960163116455 1 1 0.99996984004974365;
	setAttr -s 4 ".kiy[0:3]"  -0.00779716856777668 0 0 -0.007776050828397274;
	setAttr -s 4 ".kox[0:3]"  0.99996966123580933 1 1 0.99996984004974365;
	setAttr -s 4 ".koy[0:3]"  -0.0077971704304218292 0 0 -0.007776056881994009;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint8_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -0.25117092386675738 15 2.3997104688462465
		 45 -2.6391602724787315 60 -0.25117092386675738;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.99068665504455566 1 1 0.9908258318901062;
	setAttr -s 4 ".kiy[0:3]"  0.13616184890270233 0 0 0.13514518737792969;
	setAttr -s 4 ".kox[0:3]"  0.99068671464920044 1 1 0.9908258318901062;
	setAttr -s 4 ".koy[0:3]"  0.13616153597831726 0 0 0.13514502346515656;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint8_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -0.65304440205357162 15 3.4914640297120925
		 45 -3.8700782794128572 60 -0.65304440205357162;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.97489529848098755 1 1 0.97495687007904053;
	setAttr -s 4 ".kiy[0:3]"  0.22266395390033722 0 0 0.22239403426647186;
	setAttr -s 4 ".kox[0:3]"  0.97489529848098755 1 1 0.97495687007904053;
	setAttr -s 4 ".koy[0:3]"  0.22266392409801483 0 0 0.22239412367343903;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint8_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 15 1 45 1 60 1;
	setAttr -s 4 ".kot[0:3]"  5 5 5 5;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint8_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 5.006013567294687 15 5.006013567294687
		 45 5.006013567294687 60 5.006013567294687;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint8_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 2.0677903833643541e-015 15 2.0677903833643541e-015
		 45 2.0677903833643541e-015 60 2.0677903833643541e-015;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint8_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -1.1657341758564144e-015 15 -1.1657341758564144e-015
		 45 -1.1657341758564144e-015 60 -1.1657341758564144e-015;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint9_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint9_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint9_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint9_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 -0.57338663072609641 60 0;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint9_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 9.2293100457937438 60 0;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint9_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 2.8177225178907066 60 0;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint9_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint9_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 5.8302867771518727 30 5.8302867771518727
		 60 5.8302867771518727;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint9_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 7.6327832942979512e-015 30 7.6327832942979512e-015
		 60 7.6327832942979512e-015;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint9_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 -4.163336342344337e-016 30 -4.163336342344337e-016
		 60 -4.163336342344337e-016;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode groupParts -n "skinCluster2GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode tweak -n "tweak2";
createNode objectSet -n "tweakSet2";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId4";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts4";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode materialInfo -n "materialInfo1";
createNode shadingEngine -n "lambert2SG";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dsm";
	setAttr ".ro" yes;
createNode lambert -n "SeaWeed";
createNode file -n "file2";
	setAttr ".ftn" -type "string" "C:/Users/Student/Desktop/Production2//sourceimages/SeaWeed.png";
createNode place2dTexture -n "place2dTexture2";
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 3 ".lnk";
	setAttr -s 3 ".slnk";
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 3 ".st";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 3 ".s";
select -ne :defaultTextureList1;
	setAttr -s 2 ".tx";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 2 ".u";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
select -ne :defaultRenderGlobals;
	setAttr ".mcfr" 30;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
	setAttr ".hwfr" 30;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "Plant2_visibility.o" "Plant2.v";
connectAttr "skinCluster2GroupId.id" "PlantShape2.iog.og[0].gid";
connectAttr "skinCluster2Set.mwc" "PlantShape2.iog.og[0].gco";
connectAttr "groupId4.id" "PlantShape2.iog.og[1].gid";
connectAttr "tweakSet2.mwc" "PlantShape2.iog.og[1].gco";
connectAttr "skinCluster2.og[0]" "PlantShape2.i";
connectAttr "tweak2.vl[0].vt[0]" "PlantShape2.twl";
connectAttr "PlantRootJoint2_scaleX.o" "PlantRootJoint2.sx";
connectAttr "PlantRootJoint2_scaleY.o" "PlantRootJoint2.sy";
connectAttr "PlantRootJoint2_scaleZ.o" "PlantRootJoint2.sz";
connectAttr "PlantRootJoint2_rotateX.o" "PlantRootJoint2.rx";
connectAttr "PlantRootJoint2_rotateY.o" "PlantRootJoint2.ry";
connectAttr "PlantRootJoint2_rotateZ.o" "PlantRootJoint2.rz";
connectAttr "PlantRootJoint2_visibility.o" "PlantRootJoint2.v";
connectAttr "PlantRootJoint2_translateX.o" "PlantRootJoint2.tx";
connectAttr "PlantRootJoint2_translateY.o" "PlantRootJoint2.ty";
connectAttr "PlantRootJoint2_translateZ.o" "PlantRootJoint2.tz";
connectAttr "PlantRootJoint2.s" "joint7.is";
connectAttr "joint7_scaleX.o" "joint7.sx";
connectAttr "joint7_scaleY.o" "joint7.sy";
connectAttr "joint7_scaleZ.o" "joint7.sz";
connectAttr "joint7_rotateX.o" "joint7.rx";
connectAttr "joint7_rotateY.o" "joint7.ry";
connectAttr "joint7_rotateZ.o" "joint7.rz";
connectAttr "joint7_visibility.o" "joint7.v";
connectAttr "joint7_translateX.o" "joint7.tx";
connectAttr "joint7_translateY.o" "joint7.ty";
connectAttr "joint7_translateZ.o" "joint7.tz";
connectAttr "joint7.s" "joint8.is";
connectAttr "joint8_scaleX.o" "joint8.sx";
connectAttr "joint8_scaleY.o" "joint8.sy";
connectAttr "joint8_scaleZ.o" "joint8.sz";
connectAttr "joint8_rotateX.o" "joint8.rx";
connectAttr "joint8_rotateY.o" "joint8.ry";
connectAttr "joint8_rotateZ.o" "joint8.rz";
connectAttr "joint8_visibility.o" "joint8.v";
connectAttr "joint8_translateX.o" "joint8.tx";
connectAttr "joint8_translateY.o" "joint8.ty";
connectAttr "joint8_translateZ.o" "joint8.tz";
connectAttr "joint8.s" "joint9.is";
connectAttr "joint9_scaleX.o" "joint9.sx";
connectAttr "joint9_scaleY.o" "joint9.sy";
connectAttr "joint9_scaleZ.o" "joint9.sz";
connectAttr "joint9_rotateX.o" "joint9.rx";
connectAttr "joint9_rotateY.o" "joint9.ry";
connectAttr "joint9_rotateZ.o" "joint9.rz";
connectAttr "joint9_visibility.o" "joint9.v";
connectAttr "joint9_translateX.o" "joint9.tx";
connectAttr "joint9_translateY.o" "joint9.ty";
connectAttr "joint9_translateZ.o" "joint9.tz";
connectAttr "joint9.s" "joint10.is";
connectAttr "skinCluster2GroupId.msg" "skinCluster2Set.gn" -na;
connectAttr "PlantShape2.iog.og[0]" "skinCluster2Set.dsm" -na;
connectAttr "skinCluster2.msg" "skinCluster2Set.ub[0]";
connectAttr "skinCluster2GroupParts.og" "skinCluster2.ip[0].ig";
connectAttr "skinCluster2GroupId.id" "skinCluster2.ip[0].gi";
connectAttr "bindPose2.msg" "skinCluster2.bp";
connectAttr "PlantRootJoint2.wm" "skinCluster2.ma[0]";
connectAttr "joint7.wm" "skinCluster2.ma[1]";
connectAttr "joint8.wm" "skinCluster2.ma[2]";
connectAttr "joint9.wm" "skinCluster2.ma[3]";
connectAttr "joint10.wm" "skinCluster2.ma[4]";
connectAttr "PlantRootJoint2.liw" "skinCluster2.lw[0]";
connectAttr "joint7.liw" "skinCluster2.lw[1]";
connectAttr "joint8.liw" "skinCluster2.lw[2]";
connectAttr "joint9.liw" "skinCluster2.lw[3]";
connectAttr "joint10.liw" "skinCluster2.lw[4]";
connectAttr "PlantRootJoint2.msg" "bindPose2.m[0]";
connectAttr "joint7.msg" "bindPose2.m[1]";
connectAttr "joint8.msg" "bindPose2.m[2]";
connectAttr "joint9.msg" "bindPose2.m[3]";
connectAttr "joint10.msg" "bindPose2.m[4]";
connectAttr "bindPose2.w" "bindPose2.p[0]";
connectAttr "bindPose2.m[0]" "bindPose2.p[1]";
connectAttr "bindPose2.m[1]" "bindPose2.p[2]";
connectAttr "bindPose2.m[2]" "bindPose2.p[3]";
connectAttr "bindPose2.m[3]" "bindPose2.p[4]";
connectAttr "PlantRootJoint2.bps" "bindPose2.wm[0]";
connectAttr "joint7.bps" "bindPose2.wm[1]";
connectAttr "joint8.bps" "bindPose2.wm[2]";
connectAttr "joint9.bps" "bindPose2.wm[3]";
connectAttr "joint10.bps" "bindPose2.wm[4]";
connectAttr "tweak2.og[0]" "skinCluster2GroupParts.ig";
connectAttr "skinCluster2GroupId.id" "skinCluster2GroupParts.gi";
connectAttr "groupParts4.og" "tweak2.ip[0].ig";
connectAttr "groupId4.id" "tweak2.ip[0].gi";
connectAttr "groupId4.msg" "tweakSet2.gn" -na;
connectAttr "PlantShape2.iog.og[1]" "tweakSet2.dsm" -na;
connectAttr "tweak2.msg" "tweakSet2.ub[0]";
connectAttr "PlantShape2Orig.w" "groupParts4.ig";
connectAttr "groupId4.id" "groupParts4.gi";
connectAttr "lambert2SG.msg" "materialInfo1.sg";
connectAttr "SeaWeed.msg" "materialInfo1.m";
connectAttr "file2.msg" "materialInfo1.t" -na;
connectAttr "SeaWeed.oc" "lambert2SG.ss";
connectAttr "PlantShape1.iog" "lambert2SG.dsm" -na;
connectAttr "PlantShape2.iog" "lambert2SG.dsm" -na;
connectAttr "PlantShape4.iog" "lambert2SG.dsm" -na;
connectAttr "PlantShape5.iog" "lambert2SG.dsm" -na;
connectAttr "file2.oc" "SeaWeed.c";
connectAttr "file2.ot" "SeaWeed.it";
connectAttr "place2dTexture2.c" "file2.c";
connectAttr "place2dTexture2.tf" "file2.tf";
connectAttr "place2dTexture2.rf" "file2.rf";
connectAttr "place2dTexture2.mu" "file2.mu";
connectAttr "place2dTexture2.mv" "file2.mv";
connectAttr "place2dTexture2.s" "file2.s";
connectAttr "place2dTexture2.wu" "file2.wu";
connectAttr "place2dTexture2.wv" "file2.wv";
connectAttr "place2dTexture2.re" "file2.re";
connectAttr "place2dTexture2.of" "file2.of";
connectAttr "place2dTexture2.r" "file2.ro";
connectAttr "place2dTexture2.n" "file2.n";
connectAttr "place2dTexture2.vt1" "file2.vt1";
connectAttr "place2dTexture2.vt2" "file2.vt2";
connectAttr "place2dTexture2.vt3" "file2.vt3";
connectAttr "place2dTexture2.vc1" "file2.vc1";
connectAttr "place2dTexture2.o" "file2.uv";
connectAttr "place2dTexture2.ofs" "file2.fs";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "SeaWeed.msg" ":defaultShaderList1.s" -na;
connectAttr "file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
// End of Plant2.ma
