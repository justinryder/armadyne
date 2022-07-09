//Maya ASCII 2012 scene
//Name: Plant3.ma
//Last modified: Wed, Mar 21, 2012 02:00:44 AM
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
createNode transform -n "Plant3";
	setAttr ".t" -type "double3" 10 0 0 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" -10 0 0 ;
	setAttr ".sp" -type "double3" -10 0 0 ;
createNode mesh -n "PlantShape3" -p "Plant3";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.35394987463951111 0.84670966863632202 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode mesh -n "PlantShape3Orig" -p "Plant3";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 45 ".uvst[0].uvsp[0:44]" -type "float2" 0.093767971 0.44305742
		 0.15669581 0.44033545 0.18863603 0.48447269 0.25610325 0.51456386 0.44853187 0.81614971
		 0.19719008 0.99427116 0.15810958 0.99604404 0.070203871 0.93838954 0.010079265 0.55056858
		 0.064086616 0.48118776 0.025429331 0.64958096 0.30816728 0.59616178 0.040870693 0.74918211
		 0.35964638 0.67684305 0.055537283 0.84378582 0.40408906 0.74649656 0.11415671 0.96721673
		 0.32286096 0.90521044 0.1678797 0.99560082 0.16633277 0.95171517 0.16478586 0.90782958
		 0.14267522 0.81946349 0.12056461 0.73109734 0.096113816 0.63622618 0.07158526 0.54156739
		 0.095223971 0.48200899 0.10949993 0.44237691 0.17764983 0.9951576 0.21850884 0.93621361
		 0.25936788 0.87726963 0.22981317 0.79514116 0.20025855 0.71301258 0.16679831 0.6228714
		 0.13309127 0.53256619 0.12636133 0.48283023 0.12523189 0.44169641 0.18741995 0.99471438
		 0.2706849 0.92071199 0.35394987 0.84670967 0.31695113 0.77081883 0.27995247 0.69492781
		 0.23748279 0.60951662 0.19459726 0.52356505 0.15749869 0.48365146 0.14096385 0.44101593;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 41 ".pt";
	setAttr ".pt[0:23]" -type "float3" 0 0 -0.28181869  0 0 -0.28181869  0 
		0 -1.013308  0 0 -1.013308  0 0 -3.0707936  0 0 -1.6556902  0 0 -1.6556902  0 0 -1.6409959  
		0 0 -1.5555865  0 0 -1.013308  0 0 -1.013308  0 0 -1.6020725  0 0 -1.7155644  0 0 
		-1.6020725  0 0 -2.4431059  0 0 -1.6020725  0 0 -1.927947  0 0 -2.0398548  0 0 -1.3890522  
		0 0 -0.61458164  0 0 -0.21663663  -0.2523419 0 0.52211195  -0.32298341 0 0.52211195  
		-0.40118486 0 0.39596373 ;
	setAttr ".pt[26:41]" -type "float3" 0 0 -0.19093673  0 0 -1.2288783  0 0 
		-0.020770779  0 0 0.68788975  0 0 1.6911851  0 0 1.6911851  0 0 1.565037  0 0 1.1682795  
		0 0 0.5938105  0 0 -0.1376788  0 0 -1.4699926  0 0 -0.61458164  -2.9802322e-008 0 
		-0.62768769  0.40118486 0 0.52211195  0.28087091 0 0.52211195  0.14271644 0 0.39596373 ;
	setAttr ".pt[44]" -type "float3" 0 0 -0.19093673 ;
	setAttr -s 45 ".vt[0:44]"  -11 0 0 -9 0 0 -8.10428333 1.57287669 0 -6.37902403 2.79070663 0
		 -0.83113152 13.68351936 0 -9.078853607 19.25004959 0.0030780681 -10.40462875 19.36672783 0
		 -13.24623203 17.50615311 0 -14.9038353 4.75276613 0 -12.38454914 1.68563402 0 -4.8779707 5.73789644 0
		 -14.48064232 8.0087623596 0 -3.39378023 8.65197754 0 -14.054932594 11.28412056 0
		 -2.11245465 11.16775036 0 -13.65058231 14.39513683 0 -5.042793751 16.54203796 0 -11.82543087 18.43643951 0
		 -10.073184967 19.33755875 0.00076951704 -10.12977123 17.96283913 0 -10.14245701 16.55049515 0
		 -10.76605034 13.58829021 0 -11.38964462 10.62608528 0 -12.079974174 7.44104576 0
		 -12.7726326 4.26225138 0 -11.31448269 1.65744472 0 -10.5 0 0 -9.74174118 19.30838966 0.0015390341
		 -8.4341116 17.48923874 0 -7.038681507 15.59483624 0 -7.88151789 12.7814436 0 -8.7243557 9.96804905 0
		 -9.67930603 6.87332916 0 -10.6414299 3.77173638 0 -10.24441624 1.62925529 0 -10 0 0
		 -9.41029739 19.27922058 0.0023085512 -6.73845291 17.015638351 0 -3.93490648 14.63917732 0
		 -4.99698639 11.97459698 0 -6.059067726 9.31001282 0 -7.27863836 6.30561256 0 -8.5102272 3.28122139 0
		 -9.17434978 1.60106599 0 -9.5 0 0;
	setAttr -s 76 ".ed[0:75]"  0 26 0 1 2 0 2 3 0 5 36 0 8 9 0 9 0 0 2 43 1
		 3 10 0 3 42 1 11 8 0 10 12 0 10 41 1 13 11 0 12 14 0 7 15 0 12 40 1 14 4 0 15 13 0
		 14 39 1 4 38 1 4 16 0 6 17 0 16 5 0 17 7 0 16 37 1 18 6 0 19 17 1 18 19 1 20 7 1
		 19 20 1 21 15 1 20 21 1 22 13 1 21 22 1 23 11 1 22 23 1 24 8 1 23 24 1 25 9 1 24 25 1
		 26 35 0 25 26 1 27 18 0 28 19 1 27 28 1 29 20 1 28 29 1 30 21 1 29 30 1 31 22 1 30 31 1
		 32 23 1 31 32 1 33 24 1 32 33 1 34 25 1 33 34 1 35 44 0 34 35 1 36 27 0 37 28 1 36 37 1
		 38 29 1 37 38 1 39 30 1 38 39 1 40 31 1 39 40 1 41 32 1 40 41 1 42 33 1 41 42 1 43 34 1
		 42 43 1 44 1 0 43 44 1;
	setAttr -s 32 ".fc[0:31]" -type "polyFaces" 
		f 4 74 1 6 75
		mu 0 4 44 1 2 43
		f 4 8 73 -7 2
		mu 0 4 3 42 43 2
		f 4 7 11 71 -9
		mu 0 4 3 11 41 42
		f 4 10 15 69 -12
		mu 0 4 11 13 40 41
		f 4 13 18 67 -16
		mu 0 4 13 15 39 40
		f 4 16 19 65 -19
		mu 0 4 15 4 38 39
		f 4 -25 22 3 61
		mu 0 4 37 17 5 36
		f 4 24 63 -20 20
		mu 0 4 17 37 38 4
		f 4 -27 -28 25 21
		mu 0 4 16 19 18 6
		f 4 -30 26 23 -29
		mu 0 4 20 19 16 7
		f 4 -32 28 14 -31
		mu 0 4 21 20 7 14
		f 4 -34 30 17 -33
		mu 0 4 22 21 14 12
		f 4 -36 32 12 -35
		mu 0 4 23 22 12 10
		f 4 -38 34 9 -37
		mu 0 4 24 23 10 8
		f 4 -40 36 4 -39
		mu 0 4 25 24 8 9
		f 4 0 -42 38 5
		mu 0 4 0 26 25 9
		f 4 -44 -45 42 27
		mu 0 4 19 28 27 18
		f 4 -47 43 29 -46
		mu 0 4 29 28 19 20
		f 4 -49 45 31 -48
		mu 0 4 30 29 20 21
		f 4 -51 47 33 -50
		mu 0 4 31 30 21 22
		f 4 -53 49 35 -52
		mu 0 4 32 31 22 23
		f 4 -55 51 37 -54
		mu 0 4 33 32 23 24
		f 4 -57 53 39 -56
		mu 0 4 34 33 24 25
		f 4 40 -59 55 41
		mu 0 4 26 35 34 25
		f 4 -61 -62 59 44
		mu 0 4 28 37 36 27
		f 4 -64 60 46 -63
		mu 0 4 38 37 28 29
		f 4 -66 62 48 -65
		mu 0 4 39 38 29 30
		f 4 -68 64 50 -67
		mu 0 4 40 39 30 31
		f 4 -70 66 52 -69
		mu 0 4 41 40 31 32
		f 4 -72 68 54 -71
		mu 0 4 42 41 32 33
		f 4 -74 70 56 -73
		mu 0 4 43 42 33 34
		f 4 57 -76 72 58
		mu 0 4 35 44 43 34;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode joint -n "PlantRootJoint3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -151.20373758213546 -4.3347332446691498 97.829448013428959 ;
	setAttr ".bps" -type "matrix" -0.13583509271485594 0.98784411980442977 0.075583216092976815 0
		 0.86320914807501936 0.15544772422847219 -0.48031861478792182 0 -0.48622915818237977 1.1102230246251563e-016 -0.87383133712018712 0
		 0 0 0 1;
	setAttr ".radi" 0.67920102654097514;
createNode joint -n "joint12" -p "PlantRootJoint3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 132.42743166631595 12.726200750775408 20.326940589997616 ;
	setAttr ".bps" -type "matrix" 0.27535791813407384 0.9562429520656025 0.098880905870294911 0
		 -0.89997493518939842 0.29257377979727001 -0.32318059874623783 0 -0.33796913017568175 -5.9184013813770985e-017 0.94115719571615275 0
		 -0.60818270325960733 4.4229344212466453 0.33841331989943263 1;
	setAttr ".radi" 0.72684835113381185;
createNode joint -n "joint13" -p "joint12";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 40.520328482492964 11.700130943618277 3.6646068678593631 ;
	setAttr ".bps" -type "matrix" 0.28129441759728324 0.95277141444240931 -0.11445559160659413 0
		 -0.8825141106881742 0.30368837946390087 0.35908524421765209 0 0.37688498917423935 -3.7712235281640799e-016 0.92626006333811739 0
		 0.88212560743156498 9.5983687365559867 0.87358237109562675 1;
	setAttr ".radi" 0.75515956604841816;
createNode joint -n "joint14" -p "joint13";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 120.02890283372442 31.904781003503341 34.666684806700381 ;
	setAttr ".bps" -type "matrix" -0.42892195951763118 0.81188799480122564 -0.39606039506772256 0
		 0.59648629663809616 0.58381322689507875 0.55078690436985211 0 0.67840257264144099 -1.7285228027388548e-016 -0.73469037657606118 0
		 2.5621095213016134 15.288636831922275 0.19001547206515124 1;
	setAttr ".radi" 0.70030836840150279;
createNode joint -n "joint15" -p "joint14";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999966589036 -42.718939036430662 125.7191941077668 ;
	setAttr ".bps" -type "matrix" 1.0000000000000002 -1.6160645122970277e-015 2.0250555510248347e-008 0
		 1.5613922482867601e-015 0.99999999999999978 -5.8313120493061696e-009 0 -2.0250555454737196e-008 5.8313122823617156e-009 0.99999999999999956 0
		 0.28600228315508858 19.596982675556745 -1.9117093567839523 1;
	setAttr ".radi" 0.70030836840150279;
createNode groupId -n "skinCluster3GroupId";
	setAttr ".ihi" 0;
createNode objectSet -n "skinCluster3Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode skinCluster -n "skinCluster3";
	setAttr -s 45 ".wl";
	setAttr -s 5 ".wl[0].w[0:4]"  0.99704754838356779 0.0028058307262008629 
		0.00012047035772062864 1.8633846504392565e-005 7.5166860062689294e-006;
	setAttr -s 5 ".wl[1].w[0:4]"  0.99754932030979304 0.0022891148377869848 
		0.00013301550979932819 2.0797089706494641e-005 7.7522529141825944e-006;
	setAttr -s 5 ".wl[2].w[0:4]"  0.88710123565375498 0.10600931051375866 
		0.0058582457220845846 0.00077240777783376953 0.0002588003325681159;
	setAttr -s 5 ".wl[3].w[0:4]"  0.59147592673683125 0.34691514904426746 
		0.05271297856575298 0.0068914087457481376 0.0020045369074002716;
	setAttr -s 5 ".wl[4].w[0:4]"  0.032788387001017695 0.1198897946469433 
		0.37767353962275368 0.37767353962275368 0.091974739106531644;
	setAttr -s 5 ".wl[5].w[0:4]"  4.643166153263093e-007 2.3967049675602481e-006 
		5.0054685416477914e-005 0.93193868326685048 0.06800840102615012;
	setAttr -s 5 ".wl[6].w[0:4]"  3.4304439817201843e-006 1.6558522520249206e-005 
		0.0002131680954187254 0.4998834214690398 0.49988342146903958;
	setAttr -s 5 ".wl[7].w[0:4]"  0.0038923477864366051 0.017482443604715982 
		0.073104462973559714 0.45501128014100395 0.45050946549428378;
	setAttr -s 5 ".wl[8].w[0:4]"  0.46529209720424253 0.46529209720424253 
		0.057769462861987107 0.0079174586978389971 0.0037288840316888144;
	setAttr -s 5 ".wl[9].w[0:4]"  0.81274017817731858 0.18157741340398836 
		0.0047859297403935238 0.0006350050093093415 0.00026147366899020939;
	setAttr -s 5 ".wl[10].w[0:4]"  0.26846591412120568 0.42006779307670133 
		0.26774764908563725 0.03611704687942785 0.0076015968370279951;
	setAttr -s 5 ".wl[11].w[0:4]"  0.31008476854635125 0.42819932201434763 
		0.22146318007526614 0.027691836755506113 0.012560892608528886;
	setAttr -s 5 ".wl[12].w[0:4]"  0.10547149744926115 0.35593504618652871 
		0.37443194728998686 0.14144484008226277 0.02271666899196044;
	setAttr -s 5 ".wl[13].w[0:4]"  0.1038382212232444 0.36738674689276052 
		0.37297444968414034 0.10310222799387751 0.052698354205977155;
	setAttr -s 5 ".wl[14].w[0:4]"  0.0537158645313532 0.21599257152406423 
		0.37048163461151112 0.30913741719431759 0.050672512138753886;
	setAttr -s 5 ".wl[15].w[0:4]"  0.030898203092730323 0.15832841439529688 
		0.28738369564895355 0.30855450336960261 0.21483518349341665;
	setAttr -s 5 ".wl[16].w[0:4]"  0.0018048845329468901 0.011443688559598935 
		0.43451097093074081 0.4899722125493865 0.062268243427326807;
	setAttr -s 5 ".wl[17].w[0:4]"  0.00040231317458689134 0.0018886396709917998 
		0.01430380359156944 0.49170262178142593 0.49170262178142593;
	setAttr -s 5 ".wl[18].w[0:4]"  1.825520472992199e-006 9.1387837322408991e-006 
		0.00013940175784469657 0.57934781798053947 0.42050181595741065;
	setAttr -s 5 ".wl[19].w[0:4]"  7.8335687632908541e-005 0.00049743440436277508 
		0.011776355468646678 0.85751239560337855 0.13013547883597909;
	setAttr -s 5 ".wl[20].w[0:4]"  0.00047030615229202424 0.0040066037827768989 
		0.12448912369711554 0.80372322803574092 0.067310738332074641;
	setAttr -s 5 ".wl[21].w[0:4]"  0.0069116472856632005 0.1268586994737643 
		0.64480575596314171 0.19579559617189418 0.025628301105536464;
	setAttr -s 5 ".wl[22].w[0:4]"  0.018815430784315527 0.47444224507522875 
		0.48465616481408219 0.018451030690789894 0.0036351286355836674;
	setAttr -s 5 ".wl[23].w[0:4]"  0.20373358485559973 0.66699095957359766 
		0.12373863302055739 0.0042810616205508937 0.0012557609296943596;
	setAttr -s 5 ".wl[24].w[0:4]"  0.4964640525938101 0.49646405259380999 
		0.0063710029608932467 0.00051320284523930003 0.0001876890062474904;
	setAttr -s 5 ".wl[25].w[0:4]"  0.97975533085252287 0.019910006911375653 
		0.00028835868251608126 3.3676330874584724e-005 1.2627222710725895e-005;
	setAttr -s 5 ".wl[26].w[0:4]"  0.99978524295698723 0.00020398565120261799 
		8.8774328539263927e-006 1.3587867800585636e-006 5.3517217602328192e-007;
	setAttr -s 5 ".wl[27].w[0:4]"  1.4386079224505049e-006 7.4031357459834263e-006 
		0.00013189906477376772 0.76167200795086887 0.23818725124068896;
	setAttr -s 5 ".wl[28].w[0:4]"  1.1563182504823487e-005 8.8317129831371431e-005 
		0.010312421909931986 0.98576454593625229 0.0038231518414795196;
	setAttr -s 5 ".wl[29].w[0:4]"  6.6198329246853006e-006 7.7200449966702115e-005 
		0.49988806648824707 0.49988806648824707 0.00014004674061447657;
	setAttr -s 5 ".wl[30].w[0:4]"  0.00035484515842796238 0.014616970210471977 
		0.95535372476876623 0.029110915995942795 0.00056354386639104333;
	setAttr -s 5 ".wl[31].w[0:4]"  0.00029915244763619646 0.4236633117277655 
		0.57562705588631491 0.0003761699778678508 3.4309960415576135e-005;
	setAttr -s 5 ".wl[32].w[0:4]"  0.013121680868336722 0.97308196831462224 
		0.013613761443268556 0.00015220626129669419 3.0383112475842266e-005;
	setAttr -s 5 ".wl[33].w[0:4]"  0.66959866544658209 0.33006574561564517 
		0.00030978093063389976 1.978680847778392e-005 6.0211986610751752e-006;
	setAttr -s 5 ".wl[34].w[0:4]"  0.99923809731430513 0.00074879480131898231 
		1.14000274681011e-005 1.2659418157909375e-006 4.4191509187826449e-007;
	setAttr -s 5 ".wl[35].w[0:4]"  0.99999906649546533 8.8416699419407956e-007 
		4.0725281830096222e-008 6.2165246388266397e-009 2.3957340250190036e-009;
	setAttr -s 5 ".wl[36].w[0:4]"  9.9052803200610152e-008 5.1053189523006643e-007 
		9.8855351944170545e-006 0.96696348099338347 0.033026023886723745;
	setAttr -s 5 ".wl[37].w[0:4]"  0.00011358525244311184 0.0008740103610001042 
		0.20375113580121082 0.78357527481992983 0.011685993765416069;
	setAttr -s 5 ".wl[38].w[0:4]"  0.0037539531686302512 0.028347296498097665 
		0.47209652998374607 0.47209652998374596 0.023705690365780071;
	setAttr -s 5 ".wl[39].w[0:4]"  0.011558090607612717 0.14607473266984036 
		0.55679325719587269 0.27323706456273894 0.012336854963935375;
	setAttr -s 5 ".wl[40].w[0:4]"  0.025741708519965951 0.44524792383275147 
		0.48691359064982886 0.038547418483108636 0.0035493585143451718;
	setAttr -s 5 ".wl[41].w[0:4]"  0.16792887759549288 0.64289277773545594 
		0.18177036359567364 0.0062588057742160655 0.0011491752991614149;
	setAttr -s 5 ".wl[42].w[0:4]"  0.7019730380500403 0.29156269489388242 
		0.0058628380672345742 0.00046728496662625939 0.00013414402221652424;
	setAttr -s 5 ".wl[43].w[0:4]"  0.98833095322926434 0.011347895659131642 
		0.00027816400801835065 3.214269637830202e-005 1.0844407207261171e-005;
	setAttr -s 5 ".wl[44].w[0:4]"  0.99980381282629915 0.00018478986740457209 
		9.402988791053658e-006 1.4466686286861951e-006 5.4764887661974554e-007;
	setAttr -s 5 ".pm";
	setAttr ".pm[0]" -type "matrix" -0.13583509271485594 0.86320914807501936 -0.48622915818237977 -0
		 0.98784411980442999 0.15544772422847219 6.9388939039072296e-017 -0 0.075583216092976871 -0.48031861478792193 -0.87383133712018723 -0
		 -0 -0 -0 1;
	setAttr ".pm[1]" -type "matrix" 0.27535791813407395 -0.89997493518939842 -0.33796913017568186 -0
		 0.95624295206560295 0.29257377979727006 -1.3877787807814462e-016 -0 0.098880905870294897 -0.323180598746238 0.94115719571615331 -0
		 -4.0953945603809725 -1.7320152110201594 -0.52404711035808726 1;
	setAttr ".pm[2]" -type "matrix" 0.2812944175972833 -0.8825141106881742 0.37688498917423918 -0
		 0.95277141444240987 0.30368837946390093 -3.8857805861880499e-016 0 -0.1144555916065943 0.35908524421765242 0.92626006333811794 -0
		 -9.2932019793575229 -2.4501152902130334 -1.1416243623892592 1;
	setAttr ".pm[3]" -type "matrix" -0.42892195951763074 0.59648629663809583 0.67840257264144055 -0
		 0.81188799480122609 0.58381322689507897 -2.7755575615628914e-017 0 -0.39606039506772284 0.55078690436985223 -0.73469037657606151 0
		 -11.238458061402973 -10.558629657255045 -1.5985391519133199 1;
	setAttr ".pm[4]" -type "matrix" 0.99999999999999933 1.7341518253685858e-015 -2.0250555510248334e-008 -0
		 -1.4433049402584075e-015 1.0000000000000002 5.8313120493062027e-009 0 2.0250555454737202e-008 -5.8313122823616842e-009 1 -0
		 -0.28600224444188382 -19.596982686704521 1.9117092482995361 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10 0 0 1;
	setAttr -s 5 ".ma";
	setAttr -s 5 ".dpf[0:4]"  4 4 4 4 4;
	setAttr -s 5 ".lw";
	setAttr -s 5 ".lw";
	setAttr ".mmi" yes;
	setAttr ".mi" 5;
	setAttr ".ucm" yes;
	setAttr ".nw" 2;
createNode dagPose -n "bindPose3";
	setAttr -s 5 ".wm";
	setAttr -s 5 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 -0.62899692371601856 -0.73571634378738582 0.16321460670402368 0.19090658343377595 1
		 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 4.4773606812806497 6.106226635438361e-016
		 3.8857805861880479e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.88726104702814834 0.20447233794453243 -0.02909192492949482 0.41244703580691089 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 5.412258782278883 -1.1986939218999737e-015
		 -1.4710455076283324e-015 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.34124655253621733 0.10658505762210109 -0.0054372953254859246 0.93389552504195228 1
		 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 0 5.972332932234754 7.8409501114151681e-016
		 -2.1094237467877974e-015 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.75405356017753467 0.37923677647524684 -0.084075226819591675 0.52963577294918718 1
		 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 0 0 0 0 5.3065766105942718 2.2204460492503131e-016
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.42483973422125482 0.82876799852785021 0.16614628610107088 -0.32411451133476898 1
		 1 1 yes;
	setAttr -s 5 ".m";
	setAttr -s 5 ".p";
	setAttr ".bp" yes;
createNode animCurveTU -n "PlantRootJoint3_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
createNode animCurveTU -n "PlantRootJoint3_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
createNode animCurveTU -n "PlantRootJoint3_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
createNode animCurveTA -n "PlantRootJoint3_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 -0.046905664311634662 60 0;
createNode animCurveTA -n "PlantRootJoint3_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 -1.4969159943550616 30 -0.47191358867281963
		 60 -1.4969159943550616;
createNode animCurveTA -n "PlantRootJoint3_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 -5.1028778452426371 30 -3.307311142283893
		 60 -5.1028778452426371;
createNode animCurveTU -n "PlantRootJoint3_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTL -n "PlantRootJoint3_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 0 60 0;
createNode animCurveTL -n "PlantRootJoint3_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 0 60 0;
createNode animCurveTL -n "PlantRootJoint3_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 0 60 0;
createNode animCurveTU -n "joint12_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 7 1 37 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint12_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 7 1 37 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint12_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 7 1 37 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint12_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 16.353354472809791 7 16.530184247770563
		 37 15.585336256311617 60 16.353354472809791;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.99952882528305054 1 1 0.99946463108062744;
	setAttr -s 4 ".kiy[0:3]"  0.030694806948304176 0 0 0.032718755304813385;
	setAttr -s 4 ".kox[0:3]"  0.99952882528305054 1 1 0.99946463108062744;
	setAttr -s 4 ".koy[0:3]"  0.030694810673594475 0 0 0.03271876648068428;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint12_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -0.74715394650612732 7 -0.98269617819981336
		 37 0.81011360699547408 60 -0.74715394650612732;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.99885338544845581 1 1 0.99881529808044434;
	setAttr -s 4 ".kiy[0:3]"  -0.047874487936496735 0 0 -0.04866177961230278;
	setAttr -s 4 ".kox[0:3]"  0.99885338544845581 1 1 0.99881529808044434;
	setAttr -s 4 ".koy[0:3]"  -0.047874428331851959 0 0 -0.0486617311835289;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint12_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -4.9399975468156505 7 -4.3022295002712738
		 37 -9.8650841939713363 60 -4.9399975468156505;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.98964947462081909 1 1 0.98784929513931274;
	setAttr -s 4 ".kiy[0:3]"  0.14350606501102448 0 0 0.15541508793830872;
	setAttr -s 4 ".kox[0:3]"  0.98964947462081909 1 1 0.98784929513931274;
	setAttr -s 4 ".koy[0:3]"  0.14350594580173492 0 0 0.15541504323482513;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint12_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 7 1 37 1 60 1;
	setAttr -s 4 ".kot[0:3]"  5 5 5 5;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint12_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 4.4773606812806497 7 4.4773606812806497
		 37 4.4773606812806497 60 4.4773606812806497;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint12_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 6.106226635438361e-016 7 6.106226635438361e-016
		 37 6.106226635438361e-016 60 6.106226635438361e-016;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint12_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 3.8857805861880479e-016 7 3.8857805861880479e-016
		 37 3.8857805861880479e-016 60 3.8857805861880479e-016;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint13_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 16 1 45 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint13_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 16 1 45 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint13_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 16 1 45 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint13_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 16 -0.11759831389792701 45 0.14256433174143254
		 60 0;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.99997925758361816 1 1 0.99996834993362427;
	setAttr -s 4 ".kiy[0:3]"  -0.0064397640526294708 0 0 -0.007956111803650856;
	setAttr -s 4 ".kox[0:3]"  0.99997925758361816 1 1 0.99996834993362427;
	setAttr -s 4 ".koy[0:3]"  -0.0064397631213068962 0 0 -0.0079561108723282814;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint13_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0.58493729477769785 16 2.6075976773082421
		 45 -1.4156295696993373 60 0.58493729477769785;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.98883497714996338 1 1 0.98829913139343262;
	setAttr -s 4 ".kiy[0:3]"  0.14901497960090637 0 0 0.15252821147441864;
	setAttr -s 4 ".kox[0:3]"  0.98883497714996338 1 1 0.98829913139343262;
	setAttr -s 4 ".koy[0:3]"  0.14901484549045563 0 0 0.1525283008813858;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint13_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0.99997797392418997 16 3.317279016365561
		 45 -1.8098807772093752 60 0.99997797392418997;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.98669081926345825 1 1 0.97801864147186279;
	setAttr -s 4 ".kiy[0:3]"  0.16260771453380585 0 0 0.20851749181747437;
	setAttr -s 4 ".kox[0:3]"  0.98669081926345825 1 1 0.97801864147186279;
	setAttr -s 4 ".koy[0:3]"  0.16260766983032227 0 0 0.20851761102676392;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint13_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 16 1 45 1 60 1;
	setAttr -s 4 ".kot[0:3]"  5 5 5 5;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint13_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 5.412258782278883 16 5.412258782278883
		 45 5.412258782278883 60 5.412258782278883;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint13_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -1.1986939218999737e-015 16 -1.1986939218999737e-015
		 45 -1.1986939218999737e-015 60 -1.1986939218999737e-015;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint13_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -1.4710455076283324e-015 16 -1.4710455076283324e-015
		 45 -1.4710455076283324e-015 60 -1.4710455076283324e-015;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint14_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
createNode animCurveTU -n "joint14_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
createNode animCurveTU -n "joint14_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
createNode animCurveTA -n "joint14_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 -1.6240365776528174 60 0;
createNode animCurveTA -n "joint14_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 3.9888991336008819 60 0;
createNode animCurveTA -n "joint14_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 -8.0177316958151277 60 0;
createNode animCurveTU -n "joint14_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTL -n "joint14_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 5.972332932234754 30 5.972332932234754
		 60 5.972332932234754;
createNode animCurveTL -n "joint14_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 7.8409501114151681e-016 30 7.8409501114151681e-016
		 60 7.8409501114151681e-016;
createNode animCurveTL -n "joint14_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 -2.1094237467877974e-015 30 -2.1094237467877974e-015
		 60 -2.1094237467877974e-015;
createNode animCurveTA -n "joint15_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 60 0;
createNode animCurveTA -n "joint15_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 60 0;
createNode animCurveTA -n "joint15_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 60 0;
createNode animCurveTU -n "joint15_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 60 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "joint15_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 5.3065766105942718 60 5.3065766105942718;
createNode animCurveTL -n "joint15_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 2.2204460492503131e-016 60 2.2204460492503131e-016;
createNode animCurveTL -n "joint15_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 60 0;
createNode animCurveTU -n "joint15_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 60 1;
createNode animCurveTU -n "joint15_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 60 1;
createNode animCurveTU -n "joint15_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 60 1;
createNode groupParts -n "skinCluster3GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode tweak -n "tweak3";
createNode objectSet -n "tweakSet3";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId6";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts6";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode materialInfo -n "materialInfo1";
createNode shadingEngine -n "lambert2SG";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
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
connectAttr "skinCluster3GroupId.id" "PlantShape3.iog.og[0].gid";
connectAttr "skinCluster3Set.mwc" "PlantShape3.iog.og[0].gco";
connectAttr "groupId6.id" "PlantShape3.iog.og[1].gid";
connectAttr "tweakSet3.mwc" "PlantShape3.iog.og[1].gco";
connectAttr "skinCluster3.og[0]" "PlantShape3.i";
connectAttr "tweak3.vl[0].vt[0]" "PlantShape3.twl";
connectAttr "PlantRootJoint3_scaleX.o" "PlantRootJoint3.sx";
connectAttr "PlantRootJoint3_scaleY.o" "PlantRootJoint3.sy";
connectAttr "PlantRootJoint3_scaleZ.o" "PlantRootJoint3.sz";
connectAttr "PlantRootJoint3_rotateX.o" "PlantRootJoint3.rx";
connectAttr "PlantRootJoint3_rotateY.o" "PlantRootJoint3.ry";
connectAttr "PlantRootJoint3_rotateZ.o" "PlantRootJoint3.rz";
connectAttr "PlantRootJoint3_visibility.o" "PlantRootJoint3.v";
connectAttr "PlantRootJoint3_translateX.o" "PlantRootJoint3.tx";
connectAttr "PlantRootJoint3_translateY.o" "PlantRootJoint3.ty";
connectAttr "PlantRootJoint3_translateZ.o" "PlantRootJoint3.tz";
connectAttr "PlantRootJoint3.s" "joint12.is";
connectAttr "joint12_scaleX.o" "joint12.sx";
connectAttr "joint12_scaleY.o" "joint12.sy";
connectAttr "joint12_scaleZ.o" "joint12.sz";
connectAttr "joint12_rotateX.o" "joint12.rx";
connectAttr "joint12_rotateY.o" "joint12.ry";
connectAttr "joint12_rotateZ.o" "joint12.rz";
connectAttr "joint12_visibility.o" "joint12.v";
connectAttr "joint12_translateX.o" "joint12.tx";
connectAttr "joint12_translateY.o" "joint12.ty";
connectAttr "joint12_translateZ.o" "joint12.tz";
connectAttr "joint12.s" "joint13.is";
connectAttr "joint13_scaleX.o" "joint13.sx";
connectAttr "joint13_scaleY.o" "joint13.sy";
connectAttr "joint13_scaleZ.o" "joint13.sz";
connectAttr "joint13_rotateX.o" "joint13.rx";
connectAttr "joint13_rotateY.o" "joint13.ry";
connectAttr "joint13_rotateZ.o" "joint13.rz";
connectAttr "joint13_visibility.o" "joint13.v";
connectAttr "joint13_translateX.o" "joint13.tx";
connectAttr "joint13_translateY.o" "joint13.ty";
connectAttr "joint13_translateZ.o" "joint13.tz";
connectAttr "joint13.s" "joint14.is";
connectAttr "joint14_scaleX.o" "joint14.sx";
connectAttr "joint14_scaleY.o" "joint14.sy";
connectAttr "joint14_scaleZ.o" "joint14.sz";
connectAttr "joint14_rotateX.o" "joint14.rx";
connectAttr "joint14_rotateY.o" "joint14.ry";
connectAttr "joint14_rotateZ.o" "joint14.rz";
connectAttr "joint14_visibility.o" "joint14.v";
connectAttr "joint14_translateX.o" "joint14.tx";
connectAttr "joint14_translateY.o" "joint14.ty";
connectAttr "joint14_translateZ.o" "joint14.tz";
connectAttr "joint14.s" "joint15.is";
connectAttr "joint15_rotateX.o" "joint15.rx";
connectAttr "joint15_rotateY.o" "joint15.ry";
connectAttr "joint15_rotateZ.o" "joint15.rz";
connectAttr "joint15_visibility.o" "joint15.v";
connectAttr "joint15_translateX.o" "joint15.tx";
connectAttr "joint15_translateY.o" "joint15.ty";
connectAttr "joint15_translateZ.o" "joint15.tz";
connectAttr "joint15_scaleX.o" "joint15.sx";
connectAttr "joint15_scaleY.o" "joint15.sy";
connectAttr "joint15_scaleZ.o" "joint15.sz";
connectAttr "skinCluster3GroupId.msg" "skinCluster3Set.gn" -na;
connectAttr "PlantShape3.iog.og[0]" "skinCluster3Set.dsm" -na;
connectAttr "skinCluster3.msg" "skinCluster3Set.ub[0]";
connectAttr "skinCluster3GroupParts.og" "skinCluster3.ip[0].ig";
connectAttr "skinCluster3GroupId.id" "skinCluster3.ip[0].gi";
connectAttr "bindPose3.msg" "skinCluster3.bp";
connectAttr "PlantRootJoint3.wm" "skinCluster3.ma[0]";
connectAttr "joint12.wm" "skinCluster3.ma[1]";
connectAttr "joint13.wm" "skinCluster3.ma[2]";
connectAttr "joint14.wm" "skinCluster3.ma[3]";
connectAttr "joint15.wm" "skinCluster3.ma[4]";
connectAttr "PlantRootJoint3.liw" "skinCluster3.lw[0]";
connectAttr "joint12.liw" "skinCluster3.lw[1]";
connectAttr "joint13.liw" "skinCluster3.lw[2]";
connectAttr "joint14.liw" "skinCluster3.lw[3]";
connectAttr "joint15.liw" "skinCluster3.lw[4]";
connectAttr "PlantRootJoint3.msg" "bindPose3.m[0]";
connectAttr "joint12.msg" "bindPose3.m[1]";
connectAttr "joint13.msg" "bindPose3.m[2]";
connectAttr "joint14.msg" "bindPose3.m[3]";
connectAttr "joint15.msg" "bindPose3.m[4]";
connectAttr "bindPose3.w" "bindPose3.p[0]";
connectAttr "bindPose3.m[0]" "bindPose3.p[1]";
connectAttr "bindPose3.m[1]" "bindPose3.p[2]";
connectAttr "bindPose3.m[2]" "bindPose3.p[3]";
connectAttr "bindPose3.m[3]" "bindPose3.p[4]";
connectAttr "PlantRootJoint3.bps" "bindPose3.wm[0]";
connectAttr "joint12.bps" "bindPose3.wm[1]";
connectAttr "joint13.bps" "bindPose3.wm[2]";
connectAttr "joint14.bps" "bindPose3.wm[3]";
connectAttr "joint15.bps" "bindPose3.wm[4]";
connectAttr "tweak3.og[0]" "skinCluster3GroupParts.ig";
connectAttr "skinCluster3GroupId.id" "skinCluster3GroupParts.gi";
connectAttr "groupParts6.og" "tweak3.ip[0].ig";
connectAttr "groupId6.id" "tweak3.ip[0].gi";
connectAttr "groupId6.msg" "tweakSet3.gn" -na;
connectAttr "PlantShape3.iog.og[1]" "tweakSet3.dsm" -na;
connectAttr "tweak3.msg" "tweakSet3.ub[0]";
connectAttr "PlantShape3Orig.w" "groupParts6.ig";
connectAttr "groupId6.id" "groupParts6.gi";
connectAttr "lambert2SG.msg" "materialInfo1.sg";
connectAttr "SeaWeed.msg" "materialInfo1.m";
connectAttr "file2.msg" "materialInfo1.t" -na;
connectAttr "SeaWeed.oc" "lambert2SG.ss";
connectAttr "PlantShape3.iog" "lambert2SG.dsm" -na;
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
// End of Plant3.ma
