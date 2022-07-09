//Maya ASCII 2012 scene
//Name: Plant4.ma
//Last modified: Fri, Mar 23, 2012 02:45:38 AM
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
createNode transform -n "Plant4";
	setAttr ".t" -type "double3" -8 0 0 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" 8 0 0 ;
	setAttr ".sp" -type "double3" 8 0 0 ;
createNode mesh -n "PlantShape4" -p "Plant4";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.79436188217402426 0.42419676005604712 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode mesh -n "PlantShape4Orig" -p "Plant4";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 45 ".uvst[0].uvsp[0:44]" -type "float2" 0.76740879 0.42419675
		 0.58941758 0.90568399 0.61666298 0.99123704 0.66573113 0.99395895 0.75043499 0.96451104
		 0.94328833 0.7528584 0.96581554 0.58433616 0.82131499 0.42419675 0.70947218 0.58092219
		 0.64944494 0.74330306 0.81455326 0.89414257 0.60767812 0.96302372 0.61943126 0.82449353
		 0.87892079 0.82350045 0.67945856 0.66211259 0.95455194 0.66859722 0.73844051 0.50255948
		 0.89356518 0.50426638 0.65346408 0.9932785 0.71474582 0.96413922 0.75826931 0.89702791
		 0.81404841 0.82374871 0.86982751 0.75046957 0.88577861 0.66697609 0.9017297 0.58348268
		 0.85478401 0.50383967 0.80783844 0.42419675 0.64119703 0.992598 0.67905658 0.96376741
		 0.70198536 0.89991331 0.74917603 0.82399702 0.79636663 0.74808073 0.81700522 0.66535497
		 0.83764386 0.5826292 0.81600285 0.50341296 0.79436183 0.42419675 0.62892997 0.99191749
		 0.64336735 0.9633956 0.64570147 0.90279865 0.68430364 0.82424527 0.72290576 0.7456919
		 0.74823189 0.66373378 0.77355802 0.58177567 0.77722168 0.50298619 0.78088534 0.42419675;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 37 ".pt";
	setAttr ".pt[0:20]" -type "float3" 0 7.4505806e-009 -0.036155965  0 0 -1.8159109  
		0 0 -3.8073885  0 0 -3.8052838  -0.26478845 -0.11014704 -3.4025013  0 0 -0.96952677  
		5.9604645e-008 0 -0.96952683  0 7.4505806e-009 -0.036155965  0 0 -0.96952677  0 0 
		-0.96952677  0.066107213 0.15186261 -1.8102576  0 0 -3.2933519  0 0 -0.96952677  
		0 0 -0.96952677  0 0 -0.96952677  0 0 -0.96952677  0 0 -0.96952677  0 0 -0.96952677  
		0 0 -3.6777885  -0.15537639 -0.088540018 -2.4416232  0.10993149 0.10928333 -0.84821057 ;
	setAttr ".pt[24]" -type "float3" 5.9604645e-008 0 -1.1175871e-008 ;
	setAttr ".pt[26:38]" -type "float3" 0 7.4505806e-009 0.15010808  0 0 -3.6419375  
		-2.9802322e-008 -2.9802322e-008 -2.0902197  0 0 -0.4872331  0 0 0.35915107  0 0 0.35915107  
		0 0 0.35915107  -2.9802322e-008 5.9604645e-007 0.35915071  0 0 0.35915107  0 7.4505806e-009 
		0.21910767  0 0 -3.7148983  -2.9802322e-008 -2.9802322e-008 -2.4493711  0 0 -0.84638417 ;
	setAttr ".pt[40]" -type "float3" 4.1723251e-007 -3.5762787e-007 1.0728836e-006 ;
	setAttr ".pt[44]" -type "float3" 0 7.4505806e-009 0.15010808 ;
	setAttr -s 45 ".vt[0:44]"  7.04475069 0 0 0.73653865 16.051523209 0
		 1.8369503 19.90317535 -0.0014651685 3.35542822 20.075744629 -0.0040513151 7.070232868 19.19758415 0
		 13.22819233 11.21403027 0 13.78710365 5.53082228 0 8.95524979 0 0 4.99140978 5.22481632 0
		 2.86397433 10.63816929 0 8.84977531 16.54327965 0 1.37544918 18.41506577 0.002243235
		 1.80025637 13.34484673 0 10.95261002 13.87865448 0 13.62908173 8.37242603 0 3.92769194 7.93149281 0
		 11.37117577 2.76541018 0 6.018080235 2.61240816 0 2.97580862 20.03260231 -0.0034047787
		 5.64653683 19.001953125 0.00056080875 6.82146597 16.42033958 0 8.66452122 13.74520302 0
		 10.63713837 11.070064545 0 11.2037344 8.26219273 0 11.58818054 5.45432091 0 10.032901764 2.7271595 0
		 8.47762489 0 0 2.59618902 19.98945999 -0.0027582417 4.22284079 18.80632401 0.0011216176
		 4.79315662 16.29740143 0 6.3764329 13.61175156 0 8.04608345 10.92609978 0 8.77838707 8.15195942 0
		 9.38925648 5.37781954 0 8.69462776 2.68890905 0 8 0 0 2.21656966 19.94631767 -0.002111705
		 2.79914498 18.61069489 0.0016824263 2.76484776 16.17446136 0 4.088344574 13.47829914 0
		 5.45502901 10.78213501 0 6.35303974 8.041726112 0 7.19033337 5.30131817 0 7.35635376 2.65065861 0
		 7.52237511 0 0;
	setAttr -s 76 ".ed[0:75]"  2 36 0 3 4 0 7 26 0 4 10 0 1 11 0 11 2 0
		 4 19 1 9 12 0 1 38 1 10 13 0 12 1 0 13 5 0 12 39 1 5 14 0 8 15 0 5 22 1 14 6 0 15 9 0
		 14 23 1 6 16 0 0 17 0 6 24 1 16 7 0 17 8 0 16 25 1 18 3 0 19 28 1 18 19 1 20 10 1
		 19 20 1 21 13 1 20 21 1 22 31 1 21 22 1 23 32 1 22 23 1 24 33 1 23 24 1 25 34 1 24 25 1
		 26 35 0 25 26 1 27 18 0 28 37 1 27 28 1 29 20 1 28 29 1 30 21 1 29 30 1 31 40 1 30 31 1
		 32 41 1 31 32 1 33 42 1 32 33 1 34 43 1 33 34 1 35 44 0 34 35 1 36 27 0 37 11 1 36 37 1
		 38 29 1 37 38 1 39 30 1 38 39 1 40 9 1 39 40 1 41 15 1 40 41 1 42 8 1 41 42 1 43 17 1
		 42 43 1 44 0 0 43 44 1;
	setAttr -s 32 ".fc[0:31]" -type "polyFaces" 
		f 4 60 5 0 61
		mu 0 4 37 11 2 36
		f 4 -61 63 -9 4
		mu 0 4 11 37 38 1
		f 4 -13 10 8 65
		mu 0 4 39 12 1 38
		f 4 7 12 67 66
		mu 0 4 9 12 39 40
		f 4 68 17 -67 69
		mu 0 4 41 14 9 40
		f 4 -73 75 74 20
		mu 0 4 16 43 44 0
		f 4 14 -69 71 70
		mu 0 4 8 14 41 42
		f 4 72 23 -71 73
		mu 0 4 43 16 8 42
		f 4 6 -28 25 1
		mu 0 4 4 19 18 3
		f 4 -30 -7 3 -29
		mu 0 4 20 19 4 10
		f 4 -31 -32 28 9
		mu 0 4 13 21 20 10
		f 4 -34 30 11 15
		mu 0 4 22 21 13 5
		f 4 18 -36 -16 13
		mu 0 4 15 23 22 5
		f 4 -38 -19 16 21
		mu 0 4 24 23 15 6
		f 4 24 -40 -22 19
		mu 0 4 17 25 24 6
		f 4 -42 -25 22 2
		mu 0 4 26 25 17 7
		f 4 26 -45 42 27
		mu 0 4 19 28 27 18
		f 4 -47 -27 29 -46
		mu 0 4 29 28 19 20
		f 4 -48 -49 45 31
		mu 0 4 21 30 29 20
		f 4 -51 47 33 32
		mu 0 4 31 30 21 22
		f 4 34 -53 -33 35
		mu 0 4 23 32 31 22
		f 4 -55 -35 37 36
		mu 0 4 33 32 23 24
		f 4 38 -57 -37 39
		mu 0 4 25 34 33 24
		f 4 -59 -39 41 40
		mu 0 4 35 34 25 26
		f 4 43 -62 59 44
		mu 0 4 28 37 36 27
		f 4 -64 -44 46 -63
		mu 0 4 38 37 28 29
		f 4 -65 -66 62 48
		mu 0 4 30 39 38 29
		f 4 -68 64 50 49
		mu 0 4 40 39 30 31
		f 4 51 -70 -50 52
		mu 0 4 32 41 40 31
		f 4 -72 -52 54 53
		mu 0 4 42 41 32 33
		f 4 55 -74 -54 56
		mu 0 4 34 43 42 33
		f 4 -76 -56 58 57
		mu 0 4 44 43 34 35;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode joint -n "PlantRootJoint4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 17.357811847132108 4.3891474094558083 76.242363933233378 ;
	setAttr ".bps" -type "matrix" 0.23711789619081314 0.96846178868690069 -0.076530171562670918 0
		 -0.92164739377786953 0.24916212363312584 0.29746313668939145 0 0.30715010149518662 5.5511151231257827e-017 0.95166108208305789 0
		 0 0 0 1;
	setAttr ".radi" 0.72853676987919735;
createNode joint -n "joint17" -p "PlantRootJoint4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 148.93499524708457 6.1512090980347782 24.513915627515583 ;
	setAttr ".bps" -type "matrix" -0.19861284865088619 0.97887761120793659 -0.048492871915611607 0
		 0.9509435833105051 0.20444711364028528 0.23218027281561404 0 0.2371902985186301 8.2350402950405285e-018 -0.9714632068630511 0
		 1.288573328529153 5.2629263781816684 -0.41588905556103922 1;
	setAttr ".radi" 0.74430700992437626;
createNode joint -n "joint18" -p "joint17";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -3.2256192011864173 -2.0799814676054069 -20.9847567990908 ;
	setAttr ".bps" -type "matrix" -0.51703622569482466 0.84018383007224906 -0.16359912287166048 0
		 0.80104022902608552 0.54230169802899031 0.25346285683845304 0 0.30167547596894051 -1.2362240779549897e-016 -0.95341067080189179 0
		 0.15051970945589543 10.87190492932843 -0.69375369905056572 1;
	setAttr ".radi" 0.79057408000407825;
createNode joint -n "joint19" -p "joint18";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -24.8907574303045 -19.72258485933645 -3.1885389098138157 ;
	setAttr ".bps" -type "matrix" -0.42608841923315777 0.76127794088740885 -0.48877863671974847 0
		 0.50024499526936672 0.64842570639837127 0.57384583991671856 0 0.75379281218604099 1.7199476081995101e-016 -0.65711216416732077 0
		 -3.3178342870760869 16.50797992762579 -1.7912003448412304 1;
	setAttr ".radi" 0.66349842763257083;
createNode joint -n "joint20" -p "joint19";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 4.76952337710311 -1.1102230246251565e-015 1.3322676295501878e-015 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -179.9999987355458 -48.919999036807532 130.42301007896543 ;
	setAttr ".bps" -type "matrix" 0.99999999999999967 1.9487413701365538e-008 1.4603593834205952e-008 0
		 -1.9487413789873215e-008 0.99999999999999978 -2.8569935338448987e-010 0 -1.4603594000739406e-008 2.8569890697745832e-010 1 0
		 -5.3500729633215425 20.138912863161206 -4.1224414789046602 1;
	setAttr ".radi" 0.66349842763257083;
createNode animCurveTU -n "Plant4_visibility";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 60 ".ktv[0:59]"  1 1 2 1 3 1 4 1 5 1 6 1 7 1 8 1 9 1 10 1
		 11 1 12 1 13 1 14 1 15 1 16 1 17 1 18 1 19 1 20 1 21 1 22 1 23 1 24 1 25 1 26 1 27 1
		 28 1 29 1 30 1 31 1 32 1 33 1 34 1 35 1 36 1 37 1 38 1 39 1 40 1 41 1 42 1 43 1 44 1
		 45 1 46 1 47 1 48 1 49 1 50 1 51 1 52 1 53 1 54 1 55 1 56 1 57 1 58 1 59 1 60 1;
createNode groupId -n "skinCluster4GroupId";
	setAttr ".ihi" 0;
createNode objectSet -n "skinCluster4Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode skinCluster -n "skinCluster4";
	setAttr -s 45 ".wl";
	setAttr -s 5 ".wl[0].w[0:4]"  0.99915520517513079 0.00077188077661544856 
		5.8082067546739778e-005 1.055331079396819e-005 4.2786699131314729e-006;
	setAttr -s 5 ".wl[1].w[0:4]"  0.0025175898575168529 0.013382987830684687 
		0.37088322267471668 0.47331366519430923 0.13990253444277251;
	setAttr -s 5 ".wl[2].w[0:4]"  4.1905885990995577e-006 1.9295318348090081e-005 
		0.00059100209213943853 0.49969275600045665 0.49969275600045665;
	setAttr -s 5 ".wl[3].w[0:4]"  1.2789193186710857e-006 6.5711488266554353e-006 
		0.00026290746173700063 0.74790199772532717 0.25182724474479051;
	setAttr -s 5 ".wl[4].w[0:4]"  0.0013350389482774761 0.0096639640305042716 
		0.29988871187490546 0.53006858629725695 0.15904369884905589;
	setAttr -s 5 ".wl[5].w[0:4]"  0.10827801350167135 0.43587740624687238 
		0.42137161408587387 0.027470024927582031 0.0070029412380003724;
	setAttr -s 5 ".wl[6].w[0:4]"  0.46941359222633133 0.46941359222633133 
		0.054729397346787181 0.0047901989412328086 0.0016532192593174072;
	setAttr -s 5 ".wl[7].w[0:4]"  0.99898759349766708 0.00094827203964271685 
		5.2082068898109854e-005 8.5812718656606122e-006 3.4711219264985786e-006;
	setAttr -s 5 ".wl[8].w[0:4]"  0.46103529842164104 0.44502257305756132 
		0.082524677978638092 0.0088509720611926381 0.0025664784809669148;
	setAttr -s 5 ".wl[9].w[0:4]"  0.045474732098623398 0.28648583096433938 
		0.4926776450326204 0.1528884717365433 0.022473320167873508;
	setAttr -s 5 ".wl[10].w[0:4]"  0.0059890957332860506 0.08265125248658034 
		0.55089130078845361 0.32735414036048316 0.033114210631196801;
	setAttr -s 5 ".wl[11].w[0:4]"  0.00016016525896171233 0.00079370476770254986 
		0.033663038327794804 0.62463545822119315 0.34074763342434777;
	setAttr -s 5 ".wl[12].w[0:4]"  0.0097033239058148292 0.066414627863218764 
		0.48068848217814192 0.39868350848487111 0.044510057567953343;
	setAttr -s 5 ".wl[13].w[0:4]"  0.020357653686612506 0.42255250294810365 
		0.49306741557288425 0.055294603547267035 0.0087278242451324269;
	setAttr -s 5 ".wl[14].w[0:4]"  0.31970878550455956 0.46328036917181475 
		0.20104035547754917 0.012300038825858823 0.0036704510202177471;
	setAttr -s 5 ".wl[15].w[0:4]"  0.17436465342140547 0.45257834755104653 
		0.32345031110467815 0.040763340539868541 0.0088433473830013144;
	setAttr -s 5 ".wl[16].w[0:4]"  0.6824523755417653 0.31030040218784638 
		0.0063335609467483128 0.00066940698967622378 0.00024425433396382243;
	setAttr -s 5 ".wl[17].w[0:4]"  0.85604928530966951 0.13418680672252409 
		0.0082191735286645685 0.0011405080076513263 0.00040422643149060002;
	setAttr -s 5 ".wl[18].w[0:4]"  1.8035937682339085e-007 9.0974587765092389e-007 
		3.6416860141498579e-005 0.86640571096038144 0.1335567820742227;
	setAttr -s 5 ".wl[19].w[0:4]"  0.00022746742383635831 0.001706563614788026 
		0.20267806555644227 0.73331884539892433 0.062069058006009058;
	setAttr -s 5 ".wl[20].w[0:4]"  0.00066953643250997963 0.010490366463964073 
		0.6491053978987078 0.33307776439998676 0.0066569348048313151;
	setAttr -s 5 ".wl[21].w[0:4]"  0.0033737920895891664 0.21893612976565574 
		0.75080217042135855 0.024882423880492992 0.0020054838429035414;
	setAttr -s 5 ".wl[22].w[0:4]"  0.016934327282186624 0.4969864258754671 
		0.48062824252151604 0.0046383628607754206 0.00081264146005469281;
	setAttr -s 5 ".wl[23].w[0:4]"  0.17777314758973439 0.7132927490808757 
		0.10612162669528884 0.0022645690602455695 0.00054790757385553615;
	setAttr -s 5 ".wl[24].w[0:4]"  0.49535772197124256 0.49535772197124256 
		0.0086314831106989419 0.00049977797170148444 0.00015329497511437287;
	setAttr -s 5 ".wl[25].w[0:4]"  0.93885906135306041 0.060430675269545528 
		0.00062526091009414294 6.2951409985410016e-005 2.2051057314550369e-005;
	setAttr -s 5 ".wl[26].w[0:4]"  0.99992474952044796 7.0215396049829899e-005 
		4.076243182279566e-006 6.8332631470692834e-007 2.7551400526951729e-007;
	setAttr -s 5 ".wl[27].w[0:4]"  2.2116637504333513e-007 1.0877213736426451e-006 
		4.1313684477191745e-005 0.74510458110991085 0.25485279631786339;
	setAttr -s 5 ".wl[28].w[0:4]"  3.0525273610892721e-005 0.00021238242571831097 
		0.043980795861124369 0.93628134061472812 0.019494955824818236;
	setAttr -s 5 ".wl[29].w[0:4]"  6.7203262510699295e-005 0.00081571414538587125 
		0.55904147042059482 0.43879831321486079 0.0012772989566477095;
	setAttr -s 5 ".wl[30].w[0:4]"  0.00092434910074830226 0.041466333743658629 
		0.93388695345017703 0.022743920745778582 0.00097844295963752954;
	setAttr -s 5 ".wl[31].w[0:4]"  0.0005376198873599528 0.4995718075675093 
		0.4995718075675093 0.00028375340210406432 3.5011575517437784e-005;
	setAttr -s 5 ".wl[32].w[0:4]"  0.0082817591406606772 0.98275450110023932 
		0.0088620522766451344 8.4365837642976394e-005 1.7321644811967041e-005;
	setAttr -s 5 ".wl[33].w[0:4]"  0.49748554077999557 0.50232375238027327 
		0.0001797601339594956 8.5345524012452296e-006 2.4121533703747668e-006;
	setAttr -s 5 ".wl[34].w[0:4]"  0.99811770147360712 0.0018562880665871123 
		2.2813425563788568e-005 2.379407507957499e-006 8.1762673405873899e-007;
	setAttr -s 5 ".wl[35].w[0:4]"  0.9999971963130031 2.6019793659228249e-006 
		1.6260692451253959e-007 2.7871723647801617e-008 1.1228982891326224e-008;
	setAttr -s 5 ".wl[36].w[0:4]"  9.2334082068926826e-007 4.39805428154554e-006 
		0.00015117481934918809 0.53393721679119999 0.46590628699434861;
	setAttr -s 5 ".wl[37].w[0:4]"  1.8103411527301446e-005 0.00010864443348206342 
		0.012925674515615469 0.95274187648670261 0.034205701152672491;
	setAttr -s 5 ".wl[38].w[0:4]"  0.00040944212689891834 0.0032825528645194402 
		0.48942464330518592 0.49157547693349107 0.015307884769904719;
	setAttr -s 5 ".wl[39].w[0:4]"  0.0033545005056446571 0.053226290674173865 
		0.75056126063676731 0.18537891738932044 0.0074790307940937025;
	setAttr -s 5 ".wl[40].w[0:4]"  0.011289357617370224 0.38573387318909397 
		0.58381471191825862 0.017326257958929277 0.0018357993163479636;
	setAttr -s 5 ".wl[41].w[0:4]"  0.088259706075003455 0.7318584916244556 
		0.17512597661545129 0.0039881548585108031 0.00076767082657883904;
	setAttr -s 5 ".wl[42].w[0:4]"  0.50129639590360531 0.48909169442258765 
		0.0089539621484320039 0.000516175644385081 0.000141771880989848;
	setAttr -s 5 ".wl[43].w[0:4]"  0.97735656674874705 0.0220229627052064 
		0.00053725592217468562 6.1908329026515375e-005 2.1306294845324776e-005;
	setAttr -s 5 ".wl[44].w[0:4]"  0.99992969994632597 6.4795587917821393e-005 
		4.4138273612968813e-006 7.7701519788185267e-007 3.1362319704247063e-007;
	setAttr -s 5 ".pm";
	setAttr ".pm[0]" -type "matrix" 0.23711789619081317 -0.92164739377786964 0.30715010149518662 -0
		 0.96846178868690058 0.24916212363312584 9.7144514654701197e-017 0 -0.07653017156267089 0.29746313668939151 0.95166108208305789 -0
		 -0 0 -0 1;
	setAttr ".pm[1]" -type "matrix" -0.19861284865088613 0.95094358331050477 0.23719029851863008 -0
		 0.97887761120793659 0.20444711364028526 -4.1633363423443358e-017 0 -0.048492871915611538 0.23218027281561396 -0.97146320686305088 0
		 -4.916001236265406 -2.2047894113292297 -0.70965800807154711 1;
	setAttr ".pm[2]" -type "matrix" -0.51703622569482455 0.8010402290260854 0.30167547596894045 -0
		 0.84018383007224884 0.54230169802899031 -1.6653345369377343e-016 0 -0.16359912287166037 0.25346285683845304 -0.95341067080189146 0
		 -9.1700720778884062 -5.8405840520164469 -0.70684028457590597 1;
	setAttr ".pm[3]" -type "matrix" -0.42608841923315771 0.50024499526936694 0.75379281218604111 -0
		 0.76127794088740885 0.6484257063983716 2.2204460492503136e-016 0 -0.48877863671974842 0.57384583991671878 -0.65711216416732088 0
		 -14.8563521968149 -8.0165956821934401 1.3239401025664759 1;
	setAttr ".pm[4]" -type "matrix" 0.99999999999999978 -1.9487413697193309e-008 -1.460359383977349e-008 -0
		 1.9487413794045452e-008 0.99999999999999989 2.856990687982139e-010 -0 1.460359399517187e-008 -2.8569919156373606e-010 0.99999999999999978 -0
		 5.3500726310686746 -20.138912968598067 4.1224413950206982 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -8 0 0 1;
	setAttr -s 5 ".ma";
	setAttr -s 5 ".dpf[0:4]"  4 4 4 4 4;
	setAttr -s 5 ".lw";
	setAttr -s 5 ".lw";
	setAttr ".mmi" yes;
	setAttr ".mi" 5;
	setAttr ".ucm" yes;
	setAttr ".nw" 2;
createNode dagPose -n "bindPose4";
	setAttr -s 5 ".wm";
	setAttr -s 5 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0.095255827216277775 0.12286491093804491 0.6052646244121489 0.78069537943858058 1
		 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 5.4343149514628397 -3.5856734248440603e-015
		 6.6613381477509392e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.93711017196108137 0.21828851733158436 0.0062520863578726937 0.27227846081617402 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 5.7300100512312993 1.2698175844150228e-015
		 3.6082248300317588e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.030973890995026752 -0.012715192443984866 -0.18250490165156308 0.98263467414441141 1
		 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 0 6.7081450470341748 -2.7755575615628914e-016
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.21689538530028635 -0.16126721464985133 -0.063661018274594555 0.96067505019478927 1
		 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 0 0 0 0 4.76952337710311 -1.1102230246251565e-015
		 1.3322676295501878e-015 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.38164055967419064 -0.82638161329937199 -0.17360194402309878 0.37590727240065258 1
		 1 1 yes;
	setAttr -s 5 ".m";
	setAttr -s 5 ".p";
	setAttr ".bp" yes;
createNode animCurveTU -n "PlantRootJoint4_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "PlantRootJoint4_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "PlantRootJoint4_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "PlantRootJoint4_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 0.14263389519611056 60 0;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "PlantRootJoint4_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 -0.52254528345062456 60 0;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "PlantRootJoint4_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 -1.6789850940319626 60 0;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "PlantRootJoint4_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "PlantRootJoint4_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 0 60 0;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "PlantRootJoint4_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 0 60 0;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "PlantRootJoint4_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 0 60 0;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint17_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 7 1 37 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint17_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 7 1 37 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint17_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 7 1 37 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint17_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -0.087259117590246973 7 -0.11080717867941685
		 37 0.038507573507777795 60 -0.087259117590246973;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.99998629093170166 1 1 0.99999183416366577;
	setAttr -s 4 ".kiy[0:3]"  -0.0052430639043450356 0 0 -0.0040464163757860661;
	setAttr -s 4 ".kox[0:3]"  0.99998629093170166 1 1 0.99999183416366577;
	setAttr -s 4 ".koy[0:3]"  -0.0052430611103773117 0 0 -0.0040464163757860661;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint17_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0.37537755203149736 7 0.48692032529669943
		 37 -0.20224939913612827 60 0.37537755203149736;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.99976921081542969 1 1 0.99980491399765015;
	setAttr -s 4 ".kiy[0:3]"  0.021482756361365318 0 0 0.019752213731408119;
	setAttr -s 4 ".kox[0:3]"  0.99976921081542969 1 1 0.99980491399765015;
	setAttr -s 4 ".koy[0:3]"  0.021482741460204124 0 0 0.019752200692892075;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint17_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -1.4423764472815319 7 -2.0459849506288394
		 37 0.84286555763320115 60 -1.4423764472815319;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.9953879714012146 1 1 0.99541324377059937;
	setAttr -s 4 ".kiy[0:3]"  -0.095931045711040497 0 0 -0.095669128000736237;
	setAttr -s 4 ".kox[0:3]"  0.99538803100585938 1 1 0.99541318416595459;
	setAttr -s 4 ".koy[0:3]"  -0.095930948853492737 0 0 -0.095669180154800415;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint17_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 7 1 37 1 60 1;
	setAttr -s 4 ".kot[0:3]"  5 5 5 5;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint17_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 5.4343149514628397 7 5.4343149514628397
		 37 5.4343149514628397 60 5.4343149514628397;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint17_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -3.5856734248440603e-015 7 -3.5856734248440603e-015
		 37 -3.5856734248440603e-015 60 -3.5856734248440603e-015;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint17_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 6.6613381477509392e-016 7 6.6613381477509392e-016
		 37 6.6613381477509392e-016 60 6.6613381477509392e-016;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint18_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 15 1 45 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint18_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 15 1 45 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint18_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 15 1 45 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint18_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -0.13938557780552441 15 -0.82876127550924739
		 45 0.3995741289019355 60 -0.13938557780552441;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.99955791234970093 1 1 0.99955874681472778;
	setAttr -s 4 ".kiy[0:3]"  -0.029731551185250282 0 0 -0.02970467321574688;
	setAttr -s 4 ".kox[0:3]"  0.9995579719543457 1 1 0.99955874681472778;
	setAttr -s 4 ".koy[0:3]"  -0.029731553047895432 0 0 -0.029704658314585686;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint18_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0.29270971339160096 15 1.1782264112349294
		 45 -0.67017307227777834 60 0.29270971339160096;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.99931555986404419 1 1 0.99931693077087402;
	setAttr -s 4 ".kiy[0:3]"  0.036992374807596207 0 0 0.036955151706933975;
	setAttr -s 4 ".kox[0:3]"  0.99931555986404419 1 1 0.99931693077087402;
	setAttr -s 4 ".koy[0:3]"  0.036992359906435013 0 0 0.036955144256353378;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint18_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -1.0358814908246499 15 -4.5621459400009341
		 45 2.4599350953020855 60 -1.0358814908246499;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.98227208852767944 1 1 0.98230463266372681;
	setAttr -s 4 ".kiy[0:3]"  -0.18746078014373779 0 0 -0.18729028105735779;
	setAttr -s 4 ".kox[0:3]"  0.98227208852767944 1 1 0.98230463266372681;
	setAttr -s 4 ".koy[0:3]"  -0.18746070563793182 0 0 -0.18729019165039063;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint18_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 15 1 45 1 60 1;
	setAttr -s 4 ".kot[0:3]"  5 5 5 5;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint18_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 5.7300100512312993 15 5.7300100512312993
		 45 5.7300100512312993 60 5.7300100512312993;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint18_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1.2698175844150228e-015 15 1.2698175844150228e-015
		 45 1.2698175844150228e-015 60 1.2698175844150228e-015;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint18_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 3.6082248300317588e-016 15 3.6082248300317588e-016
		 45 3.6082248300317588e-016 60 3.6082248300317588e-016;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint19_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint19_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint19_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint19_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 -11.21211585432469 60 0;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint19_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 10.251690471700561 60 0;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint19_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 -14.300977909375016 60 0;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint19_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint19_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 6.7081450470341748 30 6.7081450470341748
		 60 6.7081450470341748;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint19_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 -2.7755575615628914e-016 30 -2.7755575615628914e-016
		 60 -2.7755575615628914e-016;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint19_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 0 60 0;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode groupParts -n "skinCluster4GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode tweak -n "tweak4";
createNode objectSet -n "tweakSet4";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId8";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts8";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode materialInfo -n "materialInfo1";
createNode shadingEngine -n "lambert2SG";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
createNode lambert -n "SeaWeed";
createNode file -n "file2";
	setAttr ".ftn" -type "string" "C:/Users/Student/Desktop/Production2//sourceimages/SeaWeed.png";
createNode place2dTexture -n "place2dTexture2";
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 3 ".lnk";
	setAttr -s 3 ".slnk";
select -ne :time1;
	setAttr ".o" 60;
	setAttr ".unw" 60;
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
connectAttr "Plant4_visibility.o" "Plant4.v";
connectAttr "skinCluster4GroupId.id" "PlantShape4.iog.og[0].gid";
connectAttr "skinCluster4Set.mwc" "PlantShape4.iog.og[0].gco";
connectAttr "groupId8.id" "PlantShape4.iog.og[1].gid";
connectAttr "tweakSet4.mwc" "PlantShape4.iog.og[1].gco";
connectAttr "skinCluster4.og[0]" "PlantShape4.i";
connectAttr "tweak4.vl[0].vt[0]" "PlantShape4.twl";
connectAttr "PlantRootJoint4_scaleX.o" "PlantRootJoint4.sx";
connectAttr "PlantRootJoint4_scaleY.o" "PlantRootJoint4.sy";
connectAttr "PlantRootJoint4_scaleZ.o" "PlantRootJoint4.sz";
connectAttr "PlantRootJoint4_rotateX.o" "PlantRootJoint4.rx";
connectAttr "PlantRootJoint4_rotateY.o" "PlantRootJoint4.ry";
connectAttr "PlantRootJoint4_rotateZ.o" "PlantRootJoint4.rz";
connectAttr "PlantRootJoint4_visibility.o" "PlantRootJoint4.v";
connectAttr "PlantRootJoint4_translateX.o" "PlantRootJoint4.tx";
connectAttr "PlantRootJoint4_translateY.o" "PlantRootJoint4.ty";
connectAttr "PlantRootJoint4_translateZ.o" "PlantRootJoint4.tz";
connectAttr "PlantRootJoint4.s" "joint17.is";
connectAttr "joint17_scaleX.o" "joint17.sx";
connectAttr "joint17_scaleY.o" "joint17.sy";
connectAttr "joint17_scaleZ.o" "joint17.sz";
connectAttr "joint17_rotateX.o" "joint17.rx";
connectAttr "joint17_rotateY.o" "joint17.ry";
connectAttr "joint17_rotateZ.o" "joint17.rz";
connectAttr "joint17_visibility.o" "joint17.v";
connectAttr "joint17_translateX.o" "joint17.tx";
connectAttr "joint17_translateY.o" "joint17.ty";
connectAttr "joint17_translateZ.o" "joint17.tz";
connectAttr "joint17.s" "joint18.is";
connectAttr "joint18_scaleX.o" "joint18.sx";
connectAttr "joint18_scaleY.o" "joint18.sy";
connectAttr "joint18_scaleZ.o" "joint18.sz";
connectAttr "joint18_rotateX.o" "joint18.rx";
connectAttr "joint18_rotateY.o" "joint18.ry";
connectAttr "joint18_rotateZ.o" "joint18.rz";
connectAttr "joint18_visibility.o" "joint18.v";
connectAttr "joint18_translateX.o" "joint18.tx";
connectAttr "joint18_translateY.o" "joint18.ty";
connectAttr "joint18_translateZ.o" "joint18.tz";
connectAttr "joint18.s" "joint19.is";
connectAttr "joint19_scaleX.o" "joint19.sx";
connectAttr "joint19_scaleY.o" "joint19.sy";
connectAttr "joint19_scaleZ.o" "joint19.sz";
connectAttr "joint19_rotateX.o" "joint19.rx";
connectAttr "joint19_rotateY.o" "joint19.ry";
connectAttr "joint19_rotateZ.o" "joint19.rz";
connectAttr "joint19_visibility.o" "joint19.v";
connectAttr "joint19_translateX.o" "joint19.tx";
connectAttr "joint19_translateY.o" "joint19.ty";
connectAttr "joint19_translateZ.o" "joint19.tz";
connectAttr "joint19.s" "joint20.is";
connectAttr "skinCluster4GroupId.msg" "skinCluster4Set.gn" -na;
connectAttr "PlantShape4.iog.og[0]" "skinCluster4Set.dsm" -na;
connectAttr "skinCluster4.msg" "skinCluster4Set.ub[0]";
connectAttr "skinCluster4GroupParts.og" "skinCluster4.ip[0].ig";
connectAttr "skinCluster4GroupId.id" "skinCluster4.ip[0].gi";
connectAttr "bindPose4.msg" "skinCluster4.bp";
connectAttr "PlantRootJoint4.wm" "skinCluster4.ma[0]";
connectAttr "joint17.wm" "skinCluster4.ma[1]";
connectAttr "joint18.wm" "skinCluster4.ma[2]";
connectAttr "joint19.wm" "skinCluster4.ma[3]";
connectAttr "joint20.wm" "skinCluster4.ma[4]";
connectAttr "PlantRootJoint4.liw" "skinCluster4.lw[0]";
connectAttr "joint17.liw" "skinCluster4.lw[1]";
connectAttr "joint18.liw" "skinCluster4.lw[2]";
connectAttr "joint19.liw" "skinCluster4.lw[3]";
connectAttr "joint20.liw" "skinCluster4.lw[4]";
connectAttr "PlantRootJoint4.msg" "bindPose4.m[0]";
connectAttr "joint17.msg" "bindPose4.m[1]";
connectAttr "joint18.msg" "bindPose4.m[2]";
connectAttr "joint19.msg" "bindPose4.m[3]";
connectAttr "joint20.msg" "bindPose4.m[4]";
connectAttr "bindPose4.w" "bindPose4.p[0]";
connectAttr "bindPose4.m[0]" "bindPose4.p[1]";
connectAttr "bindPose4.m[1]" "bindPose4.p[2]";
connectAttr "bindPose4.m[2]" "bindPose4.p[3]";
connectAttr "bindPose4.m[3]" "bindPose4.p[4]";
connectAttr "PlantRootJoint4.bps" "bindPose4.wm[0]";
connectAttr "joint17.bps" "bindPose4.wm[1]";
connectAttr "joint18.bps" "bindPose4.wm[2]";
connectAttr "joint19.bps" "bindPose4.wm[3]";
connectAttr "joint20.bps" "bindPose4.wm[4]";
connectAttr "tweak4.og[0]" "skinCluster4GroupParts.ig";
connectAttr "skinCluster4GroupId.id" "skinCluster4GroupParts.gi";
connectAttr "groupParts8.og" "tweak4.ip[0].ig";
connectAttr "groupId8.id" "tweak4.ip[0].gi";
connectAttr "groupId8.msg" "tweakSet4.gn" -na;
connectAttr "PlantShape4.iog.og[1]" "tweakSet4.dsm" -na;
connectAttr "tweak4.msg" "tweakSet4.ub[0]";
connectAttr "PlantShape4Orig.w" "groupParts8.ig";
connectAttr "groupId8.id" "groupParts8.gi";
connectAttr "lambert2SG.msg" "materialInfo1.sg";
connectAttr "SeaWeed.msg" "materialInfo1.m";
connectAttr "file2.msg" "materialInfo1.t" -na;
connectAttr "SeaWeed.oc" "lambert2SG.ss";
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
// End of Plant4.ma
