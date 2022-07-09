//Maya ASCII 2012 scene
//Name: Plant1.ma
//Last modified: Fri, Mar 23, 2012 02:44:05 AM
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
createNode transform -n "Plant1";
	setAttr ".t" -type "double3" 11 0 0 ;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" -11 0 0 ;
	setAttr ".sp" -type "double3" -11 0 0 ;
createNode mesh -n "PlantShape1" -p "Plant1";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.18585876375436783 0.035122956270756928 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode mesh -n "PlantShape1Orig" -p "Plant1";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 40 ".uvst[0].uvsp[0:39]" -type "float2" 0.22013451 0.035803448
		 0.40427899 0.14849135 0.061100081 0.13174936 0.15158302 0.034442466 0.43566239 0.25842258
		 0.012447031 0.29079092 0.056418851 0.38981077 0.38713211 0.33100376 0.33996281 0.39950231
		 0.13497707 0.42928955 0.036773566 0.21127012 0.41997069 0.20345697 0.034433041 0.34030104
		 0.41139725 0.29471317 0.10634155 0.077103779 0.31220675 0.086155266 0.18622351 0.42184272
		 0.13909717 0.37510902 0.12867409 0.32890406 0.11825087 0.28269884 0.13257284 0.20931685
		 0.14689481 0.13593486 0.15780786 0.079366654 0.16872089 0.034782711 0.23746994 0.4143959
		 0.2217755 0.36040726 0.22291516 0.31750709 0.22405472 0.27460676 0.22837213 0.20736356
		 0.23268956 0.14012036 0.20927416 0.081629522 0.18585876 0.035122957 0.28871638 0.4069491
		 0.30445379 0.34570551 0.3171562 0.30611014 0.32985854 0.26651466 0.32417142 0.20541027
		 0.31848428 0.14430586 0.26074046 0.08389239 0.20299664 0.035463203;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 34 ".pt";
	setAttr ".pt[0:16]" -type "float3" 0 0 -0.25151867  0 0 -0.25151867  0 
		0 -2.4832296  0 0 -2.4832296  0 0 -0.75185835  0 0 -0.75185835  0 0 -1.4196157  0 
		0 -2.4832296  0 0 -2.4832296  1.4901161e-008 0 -1.4196157  0 0 -2.4832296  0 0 -2.4832296  
		0 0 -1.9480649  0 0 -1.9480649  0 0 -1.4196157  0 0 -1.4196157  0 0 -0.5298537 ;
	setAttr ".pt[19:21]" -type "float3" 0 0 0.38177234  0 0 0.38177234  0 0 
		0.38177234 ;
	setAttr ".pt[23:32]" -type "float3" 0 0 -0.013194375  0 0 -0.31280828  0 
		0 0.88749635  0 0 1.3879031  0 0 1.3879031  0 0 1.3879031  0 0 1.3879031  0 0 0.88749635  
		0 0 0.21980602  0 0 -0.5298537 ;
	setAttr ".pt[35:37]" -type "float3" 0 0 0.38177234  0 0 0.38177234  0 0 
		0.38177234 ;
	setAttr ".pt[39]" -type "float3" 0 0 -0.013194375 ;
	setAttr -s 40 ".vt[0:39]"  -12 0 0 -10 0 0 -5.53429413 4.12635374 0
		 -4.42960358 7.20216608 0 -7.39710999 11.81588459 0 -13.37545013 13.35379028 0 -16.58123016 12.11913395 0
		 -18.31407928 9 0 -16.42960358 3.62815881 0 -5.91335678 9.50902271 0 -17.37184143 6.31407833 0
		 -4.98194885 5.66425991 0 -17.44765091 10.55957317 0 -5.17148018 8.35559464 0 -7.76714706 2.06317687 0
		 -14.21480179 1.8140794 0 -11.8808651 12.96931362 0 -13.91426182 11.46660614 0 -14.3786087 10.0085783005 0
		 -14.84296036 8.55054188 0 -14.27436829 6.15162373 0 -13.70577621 3.75270748 0 -12.60288811 1.87635374 0
		 -11.5 0 0 -10.38628006 12.58483696 0 -11.24729252 10.81407833 0 -11.30956459 9.45758343 0
		 -11.37184143 8.1010828 0 -11.17689514 5.98916912 0 -10.9819479 3.87725639 0 -10.99097443 1.9386282 0
		 -11 0 0 -8.89169502 12.20036125 0 -8.58032417 10.16155052 0 -8.24052238 8.90658951 0
		 -7.9007225 7.65162468 0 -8.079421997 5.82671452 0 -8.25812149 4.0018053055 0 -9.37906075 2.00090265274 0
		 -10.5 0 0;
	setAttr -s 67 ".ed[0:66]"  0 23 0 4 32 0 5 6 0 9 4 0 7 10 0 2 11 0 10 8 0
		 11 3 0 10 20 1 6 17 1 3 35 1 6 12 0 3 13 0 12 7 0 13 9 0 12 18 1 1 14 0 2 37 1 8 15 0
		 14 2 0 15 0 0 14 38 1 16 5 0 17 25 1 16 17 1 18 26 1 17 18 1 19 7 1 18 19 1 20 28 1
		 19 20 1 21 8 1 20 21 1 22 15 1 21 22 1 23 31 0 22 23 1 24 16 0 25 33 1 24 25 1 26 34 1
		 25 26 1 27 19 1 26 27 1 28 36 1 27 28 1 29 21 1 28 29 1 30 22 1 29 30 1 31 39 0 30 31 1
		 32 24 0 33 9 1 32 33 1 34 13 1 33 34 1 35 27 1 34 35 1 36 11 1 35 36 1 37 29 1 36 37 1
		 38 30 1 37 38 1 39 1 0 38 39 1;
	setAttr -s 28 ".fc[0:27]" -type "polyFaces" 
		f 4 54 53 3 1
		mu 0 4 32 33 7 8
		f 4 59 7 10 60
		mu 0 4 36 11 4 35
		f 4 55 14 -54 56
		mu 0 4 34 13 7 33
		f 4 -56 58 -11 12
		mu 0 4 13 34 35 4
		f 4 -22 19 17 64
		mu 0 4 38 15 1 37
		f 4 -60 62 -18 5
		mu 0 4 11 36 37 1
		f 4 21 66 65 16
		mu 0 4 15 38 39 0
		f 4 2 9 -25 22
		mu 0 4 9 6 17 16
		f 4 15 -27 -10 11
		mu 0 4 12 18 17 6
		f 4 -29 -16 13 -28
		mu 0 4 19 18 12 5
		f 4 8 -31 27 4
		mu 0 4 10 20 19 5
		f 4 -33 -9 6 -32
		mu 0 4 21 20 10 2
		f 4 -34 -35 31 18
		mu 0 4 14 22 21 2
		f 4 -37 33 20 0
		mu 0 4 23 22 14 3
		f 4 24 23 -40 37
		mu 0 4 16 17 25 24
		f 4 25 -42 -24 26
		mu 0 4 18 26 25 17
		f 4 -44 -26 28 -43
		mu 0 4 27 26 18 19
		f 4 29 -46 42 30
		mu 0 4 20 28 27 19
		f 4 -48 -30 32 -47
		mu 0 4 29 28 20 21
		f 4 -49 -50 46 34
		mu 0 4 22 30 29 21
		f 4 -52 48 36 35
		mu 0 4 31 30 22 23
		f 4 39 38 -55 52
		mu 0 4 24 25 33 32
		f 4 40 -57 -39 41
		mu 0 4 26 34 33 25
		f 4 -59 -41 43 -58
		mu 0 4 35 34 26 27
		f 4 44 -61 57 45
		mu 0 4 28 36 35 27
		f 4 -63 -45 47 -62
		mu 0 4 37 36 28 29
		f 4 -64 -65 61 49
		mu 0 4 30 38 37 29
		f 4 -67 63 51 50
		mu 0 4 39 38 30 31;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode joint -n "PlantRootJoint1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -135.24883750068659 -6.6287436334904193 96.641755803872499 ;
	setAttr ".bps" -type "matrix" -0.11488786984793009 0.98664858322202098 0.11543548236042478 0
		 0.69600517916657589 0.16286366453564405 -0.69932268470808512 0 -0.70878598175691077 5.5511151231257827e-017 -0.70542358343401901 0
		 0 0 0 1;
	setAttr ".radi" 0.64755175977596702;
createNode joint -n "joint2" -p "PlantRootJoint1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -4.6550157105194616 -0.46296117526409208 3.7060019809703295 ;
	setAttr ".bps" -type "matrix" -0.075384838178767594 0.99507986395973747 0.06428989434297977 0
		 0.75713486765295035 0.099076053322033591 -0.64570173287848542 0 -0.64889438151128298 -2.8467956466642933e-016 -0.76087849335034408 0
		 -0.44560361482056687 3.8268110969701721 0.44772758243709254 1;
	setAttr ".radi" 0.63380978064844118;
createNode joint -n "joint3" -p "joint2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -142.24168066624105 -6.6582870843135851 14.200121690718653 ;
	setAttr ".bps" -type "matrix" 0.036653320031276582 0.98230897683821483 -0.18364533251282067 0
		 -0.19226457944774383 0.18726738643730706 0.9633095335699331 0 0.98065838375066527 -8.8700380000382225e-017 0.19572719376605036 0
		 -0.71656876221896149 7.403551042628985 0.67881278627559138 1;
	setAttr ".radi" 0.63621343564985255;
createNode joint -n "joint4" -p "joint3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -17.971084004479625 -11.780636177617287 -21.394460180441758 ;
	setAttr ".bps" -type "matrix" 0.30228333458680601 0.82848025034902739 -0.47142895584880451 0
		 -0.44719213875742814 0.5600182807566314 0.69742291061589279 0 0.84180994093954375 -6.8717915901235045e-017 0.5397740484085557 0
		 -0.58108618851976468 11.03448401776747 8.8817841970012523e-016 1;
	setAttr ".radi" 0.55867802651829124;
createNode joint -n "joint5" -p "joint4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 2.4202654075379395 4.4408920985006262e-016 5.5511151231257827e-016 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -5.8923816193848055e-015 -57.331741332020201 -55.9429380119781 ;
	setAttr ".bps" -type "matrix" 0.99999999999999989 -4.4642548334511188e-016 -3.4972025275692431e-015 0
		 3.4184821967933356e-016 1.0000000000000002 -6.4058614237575167e-016 0 3.8302694349567901e-015 5.7353051587962761e-016 0.99999999999999978 0
		 0.15051970945589888 13.039626108515593 -1.1409831939525907 1;
	setAttr ".radi" 0.55867802651829124;
createNode animCurveTU -n "Plant1_visibility";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 60 ".ktv[0:59]"  1 1 2 1 3 1 4 1 5 1 6 1 7 1 8 1 9 1 10 1
		 11 1 12 1 13 1 14 1 15 1 16 1 17 1 18 1 19 1 20 1 21 1 22 1 23 1 24 1 25 1 26 1 27 1
		 28 1 29 1 30 1 31 1 32 1 33 1 34 1 35 1 36 1 37 1 38 1 39 1 40 1 41 1 42 1 43 1 44 1
		 45 1 46 1 47 1 48 1 49 1 50 1 51 1 52 1 53 1 54 1 55 1 56 1 57 1 58 1 59 1 60 1;
createNode groupId -n "skinCluster1GroupId";
	setAttr ".ihi" 0;
createNode objectSet -n "skinCluster1Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode skinCluster -n "skinCluster1";
	setAttr -s 40 ".wl";
	setAttr -s 5 ".wl[0].w[0:4]"  0.99487895738079124 0.0046523197621374402 
		0.00035676920285811117 7.4524425225759613e-005 3.742922898752642e-005;
	setAttr -s 5 ".wl[1].w[0:4]"  0.99576637627891584 0.0037949857122887669 
		0.00032754923274983623 7.2834183539833493e-005 3.8254592505806357e-005;
	setAttr -s 5 ".wl[2].w[0:4]"  0.34569547186312211 0.33748460150535597 
		0.18475672288530032 0.078498470544155916 0.053564733202065729;
	setAttr -s 5 ".wl[3].w[0:4]"  0.19286057707605034 0.23853051979608961 
		0.23484974214927887 0.17833072787923504 0.15542843309934601;
	setAttr -s 5 ".wl[4].w[0:4]"  0.01033046617035256 0.042678360185941976 
		0.19735864472777984 0.37546941533689432 0.37416311357903126;
	setAttr -s 5 ".wl[5].w[0:4]"  0.0017601326512566007 0.010020380671330365 
		0.19285612253073739 0.42696906242649951 0.36839430172017601;
	setAttr -s 5 ".wl[6].w[0:4]"  0.02642304450584184 0.10156101256342005 
		0.3233412399360257 0.3234142125765907 0.22526049041812168;
	setAttr -s 5 ".wl[7].w[0:4]"  0.10998197615964203 0.2382319668897544 
		0.27242460849954692 0.24197646148495991 0.13738498696609677;
	setAttr -s 5 ".wl[8].w[0:4]"  0.36343298169420285 0.36343298169420285 
		0.18857912860015946 0.05698209557008075 0.027572812441354105;
	setAttr -s 5 ".wl[9].w[0:4]"  0.072773178692011262 0.17741556836810241 
		0.25581808065987294 0.25859367873080441 0.23539949354920894;
	setAttr -s 5 ".wl[10].w[0:4]"  0.21378103196978504 0.29570369331795049 
		0.28563279641368927 0.13854762136946772 0.066334856929107483;
	setAttr -s 5 ".wl[11].w[0:4]"  0.2689091629716463 0.28271553505506219 
		0.22791935319673073 0.12587814298630454 0.094577805790256361;
	setAttr -s 5 ".wl[12].w[0:4]"  0.057602252967107713 0.17684731068065623 
		0.29736665997681661 0.29574674101544596 0.17243703535997337;
	setAttr -s 5 ".wl[13].w[0:4]"  0.13156244514899346 0.22082851215217369 
		0.24688794087251736 0.2123243017363301 0.18839680008998547;
	setAttr -s 5 ".wl[14].w[0:4]"  0.60955307407843951 0.31511470307519418 
		0.054228772453138438 0.013556094616203907 0.007547355777024028;
	setAttr -s 5 ".wl[15].w[0:4]"  0.59241323001836865 0.34829601460484044 
		0.045904417363186539 0.0091211913351773033 0.0042651466784270758;
	setAttr -s 5 ".wl[16].w[0:4]"  9.1450944855822326e-005 0.00062290392746682812 
		0.038788348409307526 0.64482980126601463 0.31566749545235517;
	setAttr -s 5 ".wl[17].w[0:4]"  0.0033592894315918409 0.029556942051687848 
		0.44304781314383551 0.4430478131438354 0.080988142229049376;
	setAttr -s 5 ".wl[18].w[0:4]"  0.012222382679779051 0.13151363457370591 
		0.4621864072375384 0.3427515525233471 0.051326022985629619;
	setAttr -s 5 ".wl[19].w[0:4]"  0.038003606913074431 0.34870615311855674 
		0.43221325287497986 0.15155692264612391 0.029520064447265081;
	setAttr -s 5 ".wl[20].w[0:4]"  0.13283577590242329 0.48087360466104678 
		0.35549517737020342 0.024477381349037715 0.0063180607172887973;
	setAttr -s 5 ".wl[21].w[0:4]"  0.47600846348718595 0.47760063556212928 
		0.041310581867177204 0.0037474615296424997 0.0013328575538651072;
	setAttr -s 5 ".wl[22].w[0:4]"  0.87933518442035641 0.11670557075454428 
		0.0032967102234445862 0.000462231567415926 0.00020030303423892486;
	setAttr -s 5 ".wl[23].w[0:4]"  0.99969758222759419 0.00027630985942721112 
		1.9923944505542912e-005 4.1150145650542743e-006 2.0689539079934763e-006;
	setAttr -s 5 ".wl[24].w[0:4]"  5.7202547756796259e-005 0.00040136728103256649 
		0.022778347269440679 0.68995782850924636 0.28680525439252363;
	setAttr -s 5 ".wl[25].w[0:4]"  0.00015702102349274402 0.0026702682210492791 
		0.5719829507755908 0.42075074651482264 0.0044390134650444052;
	setAttr -s 5 ".wl[26].w[0:4]"  0.0013122831209757405 0.058411903244824967 
		0.86726593108069416 0.069316920831860987 0.0036929617216441141;
	setAttr -s 5 ".wl[27].w[0:4]"  0.0011140103049111557 0.33295906340393727 
		0.66184644204941745 0.0036565524352126641 0.00042393180652137817;
	setAttr -s 5 ".wl[28].w[0:4]"  0.019441121238102339 0.90058921821066917 
		0.078961757206604949 0.00081274537126028881 0.00019515797336326147;
	setAttr -s 5 ".wl[29].w[0:4]"  0.49560512780316374 0.50080097241919863 
		0.0033102827579057996 0.00020997997207201867 7.3637047659705501e-005;
	setAttr -s 5 ".wl[30].w[0:4]"  0.98471116424443783 0.014986423135110082 
		0.00025438746396501123 3.349932337099159e-005 1.4525833115923517e-005;
	setAttr -s 5 ".wl[31].w[0:4]"  0.99998879115347827 1.0242847388173744e-005 
		7.3678507344694619e-007 1.5231553322494207e-007 7.6898527016248048e-008;
	setAttr -s 5 ".wl[32].w[0:4]"  0.0016697628102739462 0.0095473336771860311 
		0.1277000072574424 0.44419685294188987 0.41688604331320772;
	setAttr -s 5 ".wl[33].w[0:4]"  0.013915182327190412 0.10228320808513093 
		0.38668750671232355 0.34609936111058121 0.15101474176477378;
	setAttr -s 5 ".wl[34].w[0:4]"  0.041919836457278037 0.25176635103600703 
		0.39519901794598933 0.22417620619156178 0.086938588369163808;
	setAttr -s 5 ".wl[35].w[0:4]"  0.10457241082270333 0.35768929673841593 
		0.36702977087531435 0.12246264091497186 0.048245880648594551;
	setAttr -s 5 ".wl[36].w[0:4]"  0.2703554302576881 0.4178550749337645 
		0.25456875397829209 0.04069070485361282 0.016530035976642463;
	setAttr -s 5 ".wl[37].w[0:4]"  0.45096772317782635 0.44739497017782187 
		0.083343475681439988 0.012643188360540011 0.0056506426023718442;
	setAttr -s 5 ".wl[38].w[0:4]"  0.82953119309387402 0.16060179057411575 
		0.0079350931478048593 0.0013089438769694377 0.00062297930723600591;
	setAttr -s 5 ".wl[39].w[0:4]"  0.99972211843235004 0.00025219836879259859 
		1.9413485163677976e-005 4.1405398525788544e-006 2.1291738411849871e-006;
	setAttr -s 5 ".pm";
	setAttr ".pm[0]" -type "matrix" -0.11488786984792991 0.69600517916657589 -0.70878598175691054 -0
		 0.98664858322202087 0.16286366453564424 2.7755575615628907e-017 -0 0.11543548236042465 -0.69932268470808512 -0.7054235834340189 -0
		 -0 -0 -0 1;
	setAttr ".pm[1]" -type "matrix" -0.075384838178767455 0.75713486765295035 -0.64889438151128298 -0
		 0.99507986395973747 0.099076053322033772 -2.9143354396410359e-016 -0 0.064289894342979659 -0.64570173287848542 -0.76087849335034408 -0
		 -3.8703587811371332 0.24733516947320447 0.051516606317944441 1;
	setAttr ".pm[2]" -type "matrix" 0.03665332003127672 -0.19226457944774397 0.98065838375066527 -0
		 0.98230897683821472 0.18726738643730698 6.9388939039072299e-018 0 -0.18364533251282081 0.96330953356993365 0.19572719376605033 -0
		 -7.121649225638814 -2.1781212743501954 0.56984704245362627 1;
	setAttr ".pm[3]" -type "matrix" 0.30228333458680623 -0.4471921387574283 0.84180994093954387 -0
		 0.82848025034902717 0.56001828075663129 2.775557561562892e-017 0 -0.47142895584880479 0.69742291061589323 0.53977404840855581 -0
		 -8.96619941076424 -6.4393699441132206 0.48916413003860681 1;
	setAttr ".pm[4]" -type "matrix" 1.0000000000000002 4.4642548334510991e-016 3.4972025275692451e-015 -0
		 -3.4184821967933603e-016 0.99999999999999989 6.4058614237575049e-016 0 -3.8302694349567916e-015 -5.7353051587962929e-016 1.0000000000000002 -0
		 -0.15051970945589879 -13.039626108515591 1.1409831939525821 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11 0 0 1;
	setAttr -s 5 ".ma";
	setAttr -s 5 ".dpf[0:4]"  4 4 4 4 4;
	setAttr -s 5 ".lw";
	setAttr -s 5 ".lw";
	setAttr ".mmi" yes;
	setAttr ".mi" 5;
	setAttr ".ucm" yes;
	setAttr ".nw" 2;
createNode dagPose -n "bindPose1";
	setAttr -s 5 ".wm";
	setAttr -s 5 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 -0.59742615632612805 -0.70412625249623972 0.24829449343383905 0.29263980046026516 1
		 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.8785958466318928 2.7755575615628914e-016
		 -5.5511151231257827e-017 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.040459405995575806 -0.0053478191758523416 0.03214440270028672 0.99864967564786666 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.5944250056732461 -1.7763568394002505e-015
		 -2.7755575615628914e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.93504033410175558 -0.13540213237593438 -0.014599412327269912 0.32734186000361393 1
		 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.6963247417584126 -7.7715611723760958e-016
		 -1.9428902930940239e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.17147598908133746 -0.070765579441531251 -0.1981230215369108 0.96246323891978669 1
		 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.4202654075379395 4.4408920985006262e-016
		 5.5511151231257827e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.22499500295652008 -0.42366286648739476 -0.411543567883499 0.7749315556473354 1
		 1 1 yes;
	setAttr -s 5 ".m";
	setAttr -s 5 ".p";
	setAttr ".bp" yes;
createNode animCurveTU -n "PlantRootJoint1_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
createNode animCurveTU -n "PlantRootJoint1_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
createNode animCurveTU -n "PlantRootJoint1_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
createNode animCurveTA -n "PlantRootJoint1_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 11.137707448547424 30 10.483633960968728
		 60 11.137707448547424;
createNode animCurveTA -n "PlantRootJoint1_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 8.3473150952862234 30 10.296890243818332
		 60 8.3473150952862234;
createNode animCurveTA -n "PlantRootJoint1_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 -9.9148606766699956 30 -7.9766141728405664
		 60 -9.9148606766699956;
createNode animCurveTU -n "PlantRootJoint1_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTL -n "PlantRootJoint1_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 0 60 0;
createNode animCurveTL -n "PlantRootJoint1_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 0 60 0;
createNode animCurveTL -n "PlantRootJoint1_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 0 60 0;
createNode animCurveTU -n "joint2_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 7 1 37 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint2_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 7 1 37 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint2_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 7 1 37 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint2_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0.35330863784205269 7 0.58629277528486079
		 37 -0.91059778768777899 60 0.35330863784205269;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.99936926364898682 1 1 0.99937224388122559;
	setAttr -s 4 ".kiy[0:3]"  0.035510558634996414 0 0 0.03542693704366684;
	setAttr -s 4 ".kox[0:3]"  0.99936932325363159 1 1 0.99937230348587036;
	setAttr -s 4 ".koy[0:3]"  0.035510554909706116 0 0 0.035426933318376541;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint2_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -1.0055707384735344 7 -1.548211462270682
		 37 2.6446798742276614 60 -1.0055707384735344;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.99757027626037598 1 1 0.99758654832839966;
	setAttr -s 4 ".kiy[0:3]"  -0.0696677565574646 0 0 -0.069433622062206268;
	setAttr -s 4 ".kox[0:3]"  0.99757027626037598 1 1 0.99758660793304443;
	setAttr -s 4 ".koy[0:3]"  -0.069667726755142212 0 0 -0.069433599710464478;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint2_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -0.74738365697357279 7 -1.21152471650841
		 37 2.0098278107279772 60 -0.74738365697357279;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.99816197156906128 1 1 0.99817317724227905;
	setAttr -s 4 ".kiy[0:3]"  -0.060602877289056778 0 0 -0.060417909175157547;
	setAttr -s 4 ".kox[0:3]"  0.99816197156906128 1 1 0.99817317724227905;
	setAttr -s 4 ".koy[0:3]"  -0.060602869838476181 0 0 -0.060417987406253815;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint2_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 7 1 37 1 60 1;
	setAttr -s 4 ".kot[0:3]"  5 5 5 5;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint2_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 3.8785958466318928 7 3.8785958466318928
		 37 3.8785958466318928 60 3.8785958466318928;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint2_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 2.7755575615628914e-016 7 2.7755575615628914e-016
		 37 2.7755575615628914e-016 60 2.7755575615628914e-016;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint2_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -5.5511151231257827e-017 7 -5.5511151231257827e-017
		 37 -5.5511151231257827e-017 60 -5.5511151231257827e-017;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint3_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 15 1 45 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint3_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 15 1 45 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint3_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 15 1 45 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint3_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -0.030125053054859741 15 0.090339473519968766
		 45 -0.11706445620343088 60 -0.030125053054859741;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.99997448921203613 1 1 0.99997466802597046;
	setAttr -s 4 ".kiy[0:3]"  0.007142841350287199 0 0 0.0071228309534490108;
	setAttr -s 4 ".kox[0:3]"  0.99997448921203613 1 1 0.99997466802597046;
	setAttr -s 4 ".koy[0:3]"  0.0071428422816097736 0 0 0.0071228393353521824;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint3_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -0.62513667118392724 15 6.698913406021191
		 45 -7.0736288809996122 60 -0.62513667118392724;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.92820554971694946 1 1 0.92648249864578247;
	setAttr -s 4 ".kiy[0:3]"  0.37206792831420898 0 0 0.37633791565895081;
	setAttr -s 4 ".kox[0:3]"  0.92820554971694946 1 1 0.92648255825042725;
	setAttr -s 4 ".koy[0:3]"  0.37206792831420898 0 0 0.37633776664733887;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint3_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -0.03322436815023911 15 -0.1517241218038082
		 45 0.17359781633394988 60 -0.03322436815023911;
	setAttr -s 4 ".kit[0:3]"  1 18 18 1;
	setAttr -s 4 ".kot[0:3]"  1 18 18 1;
	setAttr -s 4 ".kix[0:3]"  0.99995511770248413 1 1 0.99995517730712891;
	setAttr -s 4 ".kiy[0:3]"  -0.0094761494547128677 0 0 -0.0094669098034501076;
	setAttr -s 4 ".kox[0:3]"  0.99995511770248413 1 1 0.99995517730712891;
	setAttr -s 4 ".koy[0:3]"  -0.0094761475920677185 0 0 -0.0094668976962566376;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint3_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 1 15 1 45 1 60 1;
	setAttr -s 4 ".kot[0:3]"  5 5 5 5;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint3_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 3.5944250056732461 15 3.5944250056732461
		 45 3.5944250056732461 60 3.5944250056732461;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint3_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -1.7763568394002505e-015 15 -1.7763568394002505e-015
		 45 -1.7763568394002505e-015 60 -1.7763568394002505e-015;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint3_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -2.7755575615628914e-016 15 -2.7755575615628914e-016
		 45 -2.7755575615628914e-016 60 -2.7755575615628914e-016;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint4_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint4_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint4_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint4_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 -4.8825036919008031 60 0;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint4_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 13.849548622343596 60 0;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTA -n "joint4_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 30 4.6569049898376349 60 0;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTU -n "joint4_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 30 1 60 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint4_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 3.6963247417584126 30 3.6963247417584126
		 60 3.6963247417584126;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint4_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 -7.7715611723760958e-016 30 -7.7715611723760958e-016
		 60 -7.7715611723760958e-016;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode animCurveTL -n "joint4_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 -1.9428902930940239e-016 30 -1.9428902930940239e-016
		 60 -1.9428902930940239e-016;
	setAttr ".pre" 3;
	setAttr ".pst" 3;
createNode groupParts -n "skinCluster1GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode tweak -n "tweak1";
createNode objectSet -n "tweakSet1";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId2";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode materialInfo -n "materialInfo1";
createNode shadingEngine -n "lambert2SG";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
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
connectAttr "Plant1_visibility.o" "Plant1.v";
connectAttr "skinCluster1GroupId.id" "PlantShape1.iog.og[2].gid";
connectAttr "skinCluster1Set.mwc" "PlantShape1.iog.og[2].gco";
connectAttr "groupId2.id" "PlantShape1.iog.og[3].gid";
connectAttr "tweakSet1.mwc" "PlantShape1.iog.og[3].gco";
connectAttr "skinCluster1.og[0]" "PlantShape1.i";
connectAttr "tweak1.vl[0].vt[0]" "PlantShape1.twl";
connectAttr "PlantRootJoint1_scaleX.o" "PlantRootJoint1.sx";
connectAttr "PlantRootJoint1_scaleY.o" "PlantRootJoint1.sy";
connectAttr "PlantRootJoint1_scaleZ.o" "PlantRootJoint1.sz";
connectAttr "PlantRootJoint1_rotateX.o" "PlantRootJoint1.rx";
connectAttr "PlantRootJoint1_rotateY.o" "PlantRootJoint1.ry";
connectAttr "PlantRootJoint1_rotateZ.o" "PlantRootJoint1.rz";
connectAttr "PlantRootJoint1_visibility.o" "PlantRootJoint1.v";
connectAttr "PlantRootJoint1_translateX.o" "PlantRootJoint1.tx";
connectAttr "PlantRootJoint1_translateY.o" "PlantRootJoint1.ty";
connectAttr "PlantRootJoint1_translateZ.o" "PlantRootJoint1.tz";
connectAttr "PlantRootJoint1.s" "joint2.is";
connectAttr "joint2_scaleX.o" "joint2.sx";
connectAttr "joint2_scaleY.o" "joint2.sy";
connectAttr "joint2_scaleZ.o" "joint2.sz";
connectAttr "joint2_rotateX.o" "joint2.rx";
connectAttr "joint2_rotateY.o" "joint2.ry";
connectAttr "joint2_rotateZ.o" "joint2.rz";
connectAttr "joint2_visibility.o" "joint2.v";
connectAttr "joint2_translateX.o" "joint2.tx";
connectAttr "joint2_translateY.o" "joint2.ty";
connectAttr "joint2_translateZ.o" "joint2.tz";
connectAttr "joint2.s" "joint3.is";
connectAttr "joint3_scaleX.o" "joint3.sx";
connectAttr "joint3_scaleY.o" "joint3.sy";
connectAttr "joint3_scaleZ.o" "joint3.sz";
connectAttr "joint3_rotateX.o" "joint3.rx";
connectAttr "joint3_rotateY.o" "joint3.ry";
connectAttr "joint3_rotateZ.o" "joint3.rz";
connectAttr "joint3_visibility.o" "joint3.v";
connectAttr "joint3_translateX.o" "joint3.tx";
connectAttr "joint3_translateY.o" "joint3.ty";
connectAttr "joint3_translateZ.o" "joint3.tz";
connectAttr "joint3.s" "joint4.is";
connectAttr "joint4_scaleX.o" "joint4.sx";
connectAttr "joint4_scaleY.o" "joint4.sy";
connectAttr "joint4_scaleZ.o" "joint4.sz";
connectAttr "joint4_rotateX.o" "joint4.rx";
connectAttr "joint4_rotateY.o" "joint4.ry";
connectAttr "joint4_rotateZ.o" "joint4.rz";
connectAttr "joint4_visibility.o" "joint4.v";
connectAttr "joint4_translateX.o" "joint4.tx";
connectAttr "joint4_translateY.o" "joint4.ty";
connectAttr "joint4_translateZ.o" "joint4.tz";
connectAttr "joint4.s" "joint5.is";
connectAttr "skinCluster1GroupId.msg" "skinCluster1Set.gn" -na;
connectAttr "PlantShape1.iog.og[2]" "skinCluster1Set.dsm" -na;
connectAttr "skinCluster1.msg" "skinCluster1Set.ub[0]";
connectAttr "skinCluster1GroupParts.og" "skinCluster1.ip[0].ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1.ip[0].gi";
connectAttr "bindPose1.msg" "skinCluster1.bp";
connectAttr "PlantRootJoint1.wm" "skinCluster1.ma[0]";
connectAttr "joint2.wm" "skinCluster1.ma[1]";
connectAttr "joint3.wm" "skinCluster1.ma[2]";
connectAttr "joint4.wm" "skinCluster1.ma[3]";
connectAttr "joint5.wm" "skinCluster1.ma[4]";
connectAttr "PlantRootJoint1.liw" "skinCluster1.lw[0]";
connectAttr "joint2.liw" "skinCluster1.lw[1]";
connectAttr "joint3.liw" "skinCluster1.lw[2]";
connectAttr "joint4.liw" "skinCluster1.lw[3]";
connectAttr "joint5.liw" "skinCluster1.lw[4]";
connectAttr "PlantRootJoint1.msg" "bindPose1.m[0]";
connectAttr "joint2.msg" "bindPose1.m[1]";
connectAttr "joint3.msg" "bindPose1.m[2]";
connectAttr "joint4.msg" "bindPose1.m[3]";
connectAttr "joint5.msg" "bindPose1.m[4]";
connectAttr "bindPose1.w" "bindPose1.p[0]";
connectAttr "bindPose1.m[0]" "bindPose1.p[1]";
connectAttr "bindPose1.m[1]" "bindPose1.p[2]";
connectAttr "bindPose1.m[2]" "bindPose1.p[3]";
connectAttr "bindPose1.m[3]" "bindPose1.p[4]";
connectAttr "PlantRootJoint1.bps" "bindPose1.wm[0]";
connectAttr "joint2.bps" "bindPose1.wm[1]";
connectAttr "joint3.bps" "bindPose1.wm[2]";
connectAttr "joint4.bps" "bindPose1.wm[3]";
connectAttr "joint5.bps" "bindPose1.wm[4]";
connectAttr "tweak1.og[0]" "skinCluster1GroupParts.ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1GroupParts.gi";
connectAttr "groupParts2.og" "tweak1.ip[0].ig";
connectAttr "groupId2.id" "tweak1.ip[0].gi";
connectAttr "groupId2.msg" "tweakSet1.gn" -na;
connectAttr "PlantShape1.iog.og[3]" "tweakSet1.dsm" -na;
connectAttr "tweak1.msg" "tweakSet1.ub[0]";
connectAttr "PlantShape1Orig.w" "groupParts2.ig";
connectAttr "groupId2.id" "groupParts2.gi";
connectAttr "lambert2SG.msg" "materialInfo1.sg";
connectAttr "SeaWeed.msg" "materialInfo1.m";
connectAttr "file2.msg" "materialInfo1.t" -na;
connectAttr "SeaWeed.oc" "lambert2SG.ss";
connectAttr "PlantShape1.iog" "lambert2SG.dsm" -na;
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
// End of Plant1.ma
