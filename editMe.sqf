/**
*  editMe
*
*  Defines all global config for the mission
*
*  Domain: Client, Server
**/

/* Attacker Waves */

// List_Bandits, List_ParaBandits, List_OPFOR, List_INDEP, List_NATO, List_Viper, List_SPET
HOSTILE_LEVEL_1 = List_Bandits;  // Wave 0 >
HOSTILE_LEVEL_2 = List_INDEP;    // Wave 5 >
HOSTILE_LEVEL_3 = List_Viper;    // Wave 10 >
HOSTILE_ARMED_CARS = List_Armour;//expects vehicles
HOSTILE_ARMOUR = List_ArmedCars; //expects vehicles
POINT_BANK_INIT_AMOUNT 		   = ("POINT_BANK_INIT_AMOUNT" call BIS_fnc_getParamValue);
MAX_POINT_BANK_DEPOSIT_AMOUNT  = ("MAX_POINT_BANK_DEPOSIT_AMOUNT" call BIS_fnc_getParamValue);
MAX_POINT_BANK_WITHDRAW_AMOUNT = ("MAX_POINT_BANK_WITHDRAW_AMOUNT" call BIS_fnc_getParamValue);

HOSTILE_MULTIPLIER = ("HOSTILE_MULTIPLIER" call BIS_fnc_getParamValue);  // How many hostiles per wave (waveCount x HOSTILE_MULTIPLIER)
HOSTILE_TEAM_MULTIPLIER = ("HOSTILE_TEAM_MULTIPLIER" call BIS_fnc_getParamValue) / 100;   // How many extra units are added per player
PISTOL_HOSTILES = ("PISTOL_HOSTILES" call BIS_fnc_getParamValue);  //What wave enemies stop only using pistols

/* LOCATION LIST OPTIONS */
// List_AllCities - for any random City
// List_SpecificPoint - will start the mission on the "Specific Bulwark Pos" marker (move with mission editor). Location must meet BULWARK_LANDRATIO and LOOT_HOUSE_DENSITY, BULWARK_MINSIZE, etc requirements
// List_LocationMarkers - for a location selected randomly from the Bulwark Zones in editor (Currently broken)
// *IMPORTANT* If you get an error using List_SpecificPoint it means that there isn't a building that qualifies. Turning down the "Minimum spawn room size" parameter might help.
BULWARK_LOCATIONS = List_AllCities;

BULWARK_RADIUS = ("BULWARK_RADIUS" call BIS_fnc_getParamValue);
BULWARK_MINSIZE = ("BULWARK_MINSIZE" call BIS_fnc_getParamValue);   // Spawn room must be bigger than x square metres
BULWARK_LANDRATIO = ("BULWARK_LANDRATIO" call BIS_fnc_getParamValue);
LOOT_HOUSE_DENSITY = ("LOOT_HOUSE_DENSITY" call BIS_fnc_getParamValue);

PLAYER_STARTWEAPON = if ("PLAYER_STARTWEAPON" call BIS_fnc_getParamValue == 1) then {true} else {false};
PLAYER_STARTMAP    = if ("PLAYER_STARTMAP" call BIS_fnc_getParamValue == 1) then {true} else {false};
PLAYER_STARTNVG    = if ("PLAYER_STARTNVG" call BIS_fnc_getParamValue == 1) then {true} else {false};

/* Respawn */
RESPAWN_TIME = ("RESPAWN_TIME" call BIS_fnc_getParamValue);
RESPAWN_TICKETS = ("RESPAWN_TICKETS" call BIS_fnc_getParamValue);

/* Loot Blacklist */
LOOT_BLACKLIST = [
    "O_Static_Designator_02_weapon_F", // If players find and place CSAT UAVs they count as hostile units and round will not progress
    "O_UAV_06_backpack_F",
    "O_UAV_06_medical_backpack_F",
    "O_UAV_01_backpack_F",
    "B_IR_Grenade",
    "O_IR_Grenade",
    "I_IR_Grenade",
	"B_SSU_RadioBag_MCAM_Alpine",
	"B_SSU_RadioBag_ADR1",
	"B_SSU_RadioBag_ADR2",
	"B_SSU_RadioBag_MCAM_Black",
	"B_SSU_RadioBag_Black",
	"B_SSU_RadioBag_M81",
	"B_SSU_RadioBag_01_mtp_F",
	"B_SSU_RadioBag_MCAM",
	"B_SSU_RadioBag_OCP",
	"B_SSU_RadioBag_MCAM_Tropic",
	"B_SSU_RadioBag_MCAM_Woodland",
    "TrainingMine_01_F",
    "TrainingMine_01_used_F",
    "Item_I_UavTerminal",			// UAV-Terminal
    "Item_O_UavTerminal",
    "Item_I_E_UavTerminal",
    "Item_B_UavTerminal",
    "Item_C_UavTerminal",
    "I_UGV_02_Demining_backpack_F",		// UGV
    "O_UGV_02_Demining_backpack_F",
    "C_IDAP_UGV_02_Demining_backpack_F",
    "I_E_UGV_02_Demining_backpack_F",
    "B_UGV_02_Demining_backpack_F",
    "I_UGV_02_Science_backpack_F",
    "O_UGV_02_Science_backpack_F",
    "I_E_UGV_02_Science_backpack_F",
    "B_UGV_02_Science_backpack_F",
    "O_UAV_06_backpack_F",			// UAV
    "C_UAV_06_backpack_F",
    "I_E_UAV_06_backpack_F",
    "C_IDAP_UAV_06_backpack_F",
    "I_UAV_06_medical_backpack_F",
    "O_UAV_06_medical_backpack_F",
    "B_UAV_06_medical_backpack_F",
    "C_UAV_06_medical_backpack_F",
    "I_E_UAV_06_medical_backpack_F",
    "C_IDAP_UAV_06_medical_backpack_F",
    "I_UAV_01_backpack_F",	
    "O_UAV_01_backpack_F",
    "B_UAV_01_backpack_F",
    "I_E_UAV_01_backpack_F",
    "C_IDAP_UAV_01_backpack_F",	
    "C_IDAP_UAV_06_antimine_backpack_F",	
    "I_HMG_01_high_weapon_F",		// Mk30 HMG
    "I_HMG_01_support_high_F",
    "O_HMG_01_high_weapon_F",
    "O_HMG_01_support_high_F",
    "I_E_HMG_01_high_Weapon_F",
    "I_E_HMG_01_support_high_F",
    "B_HMG_01_high_weapon_F",
    "B_HMG_01_support_high_F",
    "I_HMG_01_weapon_F",
    "I_HMG_01_support_F",
    "O_HMG_01_weapon_F",
    "O_HMG_01_support_F",
    "I_E_HMG_01_Weapon_F",
    "I_E_HMG_01_support_F",
    "B_HMG_01_weapon_F",
    "B_HMG_01_support_F",
    "I_HMG_01_A_weapon_F",
    "O_HMG_01_A_weapon_F",
    "I_E_HMG_01_A_weapon_F",
    "B_HMG_01_A_weapon_F",
    "I_HMG_02_high_weapon_F",		// M2 HMG
    "I_HMG_02_support_high_F",
    "I_G_HMG_02_high_weapon_F",
    "I_G_HMG_02_support_high_F",
    "I_E_HMG_02_high_weapon_F",
    "I_E_HMG_02_support_high_F",
    "I_C_HMG_02_high_weapon_F",
    "I_C_HMG_02_support_high_F",
    "I_HMG_02_weapon_F",
    "I_HMG_02_support_F",
    "I_G_HMG_02_weapon_F",
    "I_G_HMG_02_support_F",
    "I_E_HMG_02_weapon_F",
    "I_E_HMG_02_support_F",
    "I_C_HMG_02_weapon_F",
    "I_C_HMG_02_support_F",
    "I_GMG_01_A_weapon_F",			// static GMG
    "O_GMG_01_A_weapon_F",
    "I_E_GMG_01_A_Weapon_F",
    "B_GMG_01_A_weapon_F",
    "I_GMG_01_high_weapon_F",
    "O_GMG_01_high_weapon_F",
    "I_E_GMG_01_high_Weapon_F",
    "B_GMG_01_high_weapon_F",
    "I_GMG_01_weapon_F",
    "O_GMG_01_weapon_F",
    "I_E_GMG_01_Weapon_F",
    "B_GMG_01_Weapon_F",
    "I_AA_01_weapon_F",			// static Titan
    "O_AA_01_weapon_F",
    "I_E_AA_01_weapon_F",
    "B_AA_01_weapon_F",
    "I_AT_01_weapon_F",
    "O_AT_01_weapon_F",
    "I_E_AT_01_weapon_F",
    "B_AT_01_weapon_F",
    "I_Mortar_01_weapon_F",			// Mortar
    "I_Mortar_01_support_F",
    "O_Mortar_01_weapon_F",
    "O_Mortar_01_support_F",
    "B_Mortar_01_weapon_F",
    "B_Mortar_01_support_F",
    "I_E_Mortar_01_Weapon_F",
    "I_E_Mortar_01_support_F",
	"CUP_B_Tow_Gun_Bag",
	"CUP_B_TOW_Tripod_Bag",
	"CUP_B_TOW2_Tripod_Bag",
	"CUP_B_SearchLight_Tripod_Bag",
	"CUP_B_SearchLight_Gun_Bag",
	"CUP_B_Predator_MTP",
	"CUP_B_Predator_Radio_MTP",
	"CUP_B_Podnos_Bipod_Bag",
	"CUP_B_Podnos_Gun_Bag",
	"CUP_B_Metis_Gun_Bag",
	"CUP_B_Metis_Tripod_Bag",
	"CUP_B_Mk19_gun_bag",
	"CUP_B_Mk19_Tripod_Bag",
	"CUP_B_M252_Bipod_Bag",
	"CUP_B_M252_Gun_Bag",
	"NDS_B_M224_mortar",
	"B_Respawn_TentA_F",
	"B_SCBA_01_F",
	"B_Respawn_Sleeping_bag_F",
	"B_Patrol_Respawn_bag_F",
	"B_Respawn_TentDome_F",
	"B_Respawn_Sleeping_bag_brown_F",
	"B_Respawn_Sleeping_bag_blue_F",
	"CUP_Mxx_Camo",
	"CUP_SVD_camo_d",
	"CUP_SVD_camo_g",
	"CUP_SVD_camo_d_half",
	"CUP_SVD_camo_g_half",
	"CUP_B_M2_MiniTripod_Bag",
	"CUP_B_M2_Gun_Bag",
	"CUP_item_Kostey_map_case",
	"CUP_item_Kostey_notebook",
	"CUP_item_Kostey_photos",
	"CUP_Mxx_camo_half",
	"CUP_B_M2_Tripod_Bag",
	"CUP_B_L16A2_Gun_Bag",
	"CUP_B_L16A2_Bipod_Bag",
	"CUP_B_L134A1_Tripod_Bag",
	"CUP_B_L134A1_Gun_Bag",
	"CUP_B_L111A1_MiniTripod_Bag",
	"CUP_B_L111A1_Tripod_Bag",
	"CUP_B_Komet_Tripod_Bag",
	"CUP_B_Komet_Gun_Bag",
	"CUP_B_Kord_TripodHigh_Bag",
	"CUP_B_Kord_Tripod_Bag",
	"CUP_B_Kord_Gun_Bag",
	"CUP_B_AGS30_Tripod_Bag",
	"CUP_B_AGS30_Gun_Bag",
	"ace_gunbag",
	"ace_gunbag_Tan",
	"CUP_optic_G36Optics15x_desert",
	"CUP_optic_G36Optics15x_desert_3D",
	"CUP_optic_G36Optics15x_wood",
	"CUP_optic_G36Optics_desert",
	"CUP_optic_G36Optics_desert_3D",
	"CUP_optic_G36DualOptics_desert",
	"CUP_optic_G36DualOptics_desert_3D",
	"CUP_optic_G36Optics_RDS_desert_3D",
	"CUP_optic_G36Optics_RDS_desert",
	"CUP_optic_G36Optics_Holo_desert",
	"CUP_optic_G36Optics_Holo_desert_3D",
	"CUP_DSHKM_carry"
];


/* Whitelist modes */
/* 0 = Off */
/* 1 = Only Whitelist Items will spawn as loot */
/* 2 = Whitelist items get added to existing loot (increases the chance of loot spawning */
LOOT_WHITELIST_MODE = 1;

/* Loot Whitelists */
/* Fill with classname arrays: ["example_item_1", "example_item_2"] */
/* To use Whitelisting there MUST be at least one applicaple item in each LOOT_WHITELIST array*/
LOOT_WHITELIST_WEAPON = [
	"CUP_arifle_AK101_railed",
    "CUP_arifle_AK107_GL_railed",
    "arifle_AK12_GL_F",
    "CUP_arifle_AK74M_railed",
    "CUP_srifle_AS50",
    "CUP_arifle_AUG_A1",
    "srifle_DMR_04_F",
    "OSS_Burnside",
    "OSS_Lightning_Rifle",
    "arifle_TRG20_F",
    "Cup_sgun_CZ584_RIS",
    "CUP_arifle_CZ805_GL",
    "CUP_arifle_FNFAL5061_wooden_railed",
    "CUP_Famas_F1_Wood",
    "LMG_03_F",
    "CUP_srifle_G22_des",
    "CUP_arifle_AG36",
	"CUP_arifle_G36A3_AG36_hex",
    "CUP_arifle_G36K_AG36",
    "CUP_arifle_Galil_black",
    "OSS_Henry_Rifle",
    "CUP_arifle_HK416_Wood",
    "CUP_arifle_HK416_AGL_Wood",
    "CUP_arifle_L85A2",
    "CUP_arifle_L85A2_GL",
    "CUP_srifle_M107_Pristine",
    "CUP_sgun_M1014_Entry_vfg",
    "CUP_srifle_M14",
    "CUP_arifle_Colt727_M203",
    "OSS_M1867Wern",
    "srifle_LRR_tna_F",
    "CUP_srifle_2010_hex",
    "CUP_lmg_M240_B",
    "CUP_lmg_m249_pip1",
    "CUP_arifle_HK_M27_AG36",
    "CUP_arifle_M4_MOE_BW",
    "CUP_arifle_M4A1_BUIS_camo_GL",
    "CUP_smg_Mac10_rail",
    "CUP_lmg_MG3_rail",
    "CUP_lmg_minimi_railed",
    "CUP_arifle_Mk16_CQC_EGLM_black",
    "CUP_arifle_Mk17_CQC_Black",
    "CUP_srifle_mk18_wdl",
    "CUP_smg_MP5A5_Rail",
    "CUP_arifle_OTS14_GROZA_762",
    "SMG_03C_hex",
	"GARG_Gren_M202_F",
	"GARG_HLSR_RPG_F",
	"CUP_launch_M136",
	"CUP_launch_M47",
	"CUP_launch_Mk153Mod0_blk",
	"CUP_launch_M72A6_Special",
	"CUP_launch_RPG7V",
    "SMG_03C_TR_hex",
    "OSS_ENfieldPattern",
    "CUP_smg_bizon",
    "arifle_CTAR_GL_hex_F",
    "arifle_CTAR_ghex_F",
    "CUP_arifle_RPK74_top_rail",
    "CUP_arifle_RPK74M_railed",
    "CUP_arifle_DSA_SA58",
    "CUP_arifle_DSA_SA58_OSW_M203",
    "SMG_02_F",
    "CUP_srifle_SVD_wdl_top_rail",
    "arifle_ARX_hex_F",
    "SMG_01_F",
    "OSS_Winchester1873_Rifle",
    "CUP_arifle_xm29_ke_hexu",
    "CUP_arifle_XM8_Carbine_GL_Tan",
    "CUP_arifle_XM8_SAW_FG_Rail_Shark",
    "CUP_smg_UZI",
	"GARG_HLSR_SRoach_F",
	"GARG_HLSR_M40A1_F",
	"CUP_arifle_ACR_DMR_snw_556",
	"CUP_arifle_ACR_EGLM_snw_556",
	"WBK_survival_weapon_3",
    "WBK_survival_weapon_3_r",
    "WBK_survival_weapon_4",
    "WBK_survival_weapon_4_r",
    "UNSC_knife_reversed",
    "UNSC_knife",
    "WBK_SmallHammer",
    "axe",
    "Shovel_Russian_Rotated",
    "Sashka_Russian",
    "rod",
    "Police_bat",
    "knife_m3",
    "knife_kukri",
    "Weap_melee_knife",
    "WBK_katana",
    "IceAxe",
    "FireAxe",
    "Crowbar",
    "WBK_BrassKnuckles",
    "Bat_Clear",
    "WBK_axe",
	"OSS_colt1860",
    "OSS_Starr44_DA",
    "OSS_ColtSAA",
	"GARG_Gren_M202_F",
    "GARG_HLSR_RPG_F",
    "CUP_launch_M136",
    "CUP_launch_M47",
    "CUP_launch_Mk153Mod0_blk",
    "CUP_launch_M72A6_Special",
    "CUP_launch_RPG7V"
];
LOOT_WHITELIST_APPAREL = [];
LOOT_WHITELIST_ITEM = [];
LOOT_WHITELIST_EXPLOSIVE = [];
LOOT_WHITELIST_STORAGE = [];

/* Loot Spawn */
LOOT_WEAPON_POOL    = List_AllWeapons - LOOT_BLACKLIST;    // Classnames of Loot items as an array
LOOT_APPAREL_POOL   = List_AllClothes + List_Vests - LOOT_BLACKLIST;
LOOT_ITEM_POOL      = List_Optics + List_Items - LOOT_BLACKLIST;
LOOT_EXPLOSIVE_POOL = List_Mines + List_Grenades + List_Charges - LOOT_BLACKLIST;
LOOT_STORAGE_POOL   = List_Backpacks - LOOT_BLACKLIST;

/* Random Loot */
LOOT_HOUSE_DISTRIBUTION = ("LOOT_HOUSE_DISTRIBUTION" call BIS_fnc_getParamValue);  // Every *th house will spwan loot.
LOOT_ROOM_DISTRIBUTION = ("LOOT_ROOM_DISTRIBUTION" call BIS_fnc_getParamValue);   // Every *th position, within that house will spawn loot.
LOOT_DISTRIBUTION_OFFSET = 0; // Offset the position by this number.
LOOT_SUPPLYDROP = ("LOOT_SUPPLYDROP" call BIS_fnc_getParamValue) / 100;        // Radius of supply drop
PARATROOP_COUNT = ("PARATROOP_COUNT" call BIS_fnc_getParamValue);
PARATROOP_CLASS = List_NATO;
DEFECTOR_CLASS = List_NATO;
SPETNAZ_CLASS = List_SPET;

/* Points */
SCORE_KILL = ("SCORE_KILL" call BIS_fnc_getParamValue);                 // Base Points for a kill
SCORE_HIT = ("SCORE_HIT" call BIS_fnc_getParamValue);                   // Every Bullet hit that doesn't result in a kill
SCORE_DAMAGE_BASE = ("SCORE_DAMAGE_BASE" call BIS_fnc_getParamValue);   // Extra points awarded for damage. 100% = SCORE_DAMAGE_BASE. 50% = SCORE_DAMAGE_BASE/2
SCORE_RANDOMBOX = 250;  // Cost to spin the box

/*Point multipliers of SCORE_KILL for different waves */
HOSTILE_LEVEL_1_POINT_SCORE = 0.75;
HOSTILE_LEVEL_2_POINT_SCORE = 1;
HOSTILE_LEVEL_3_POINT_SCORE = 1.50;
HOSTILE_CAR_POINT_SCORE = 2;
HOSTILE_ARMOUR_POINT_SCORE = 4;

/* Comment out or delete the below support items to prevent the player from buying them */

BULWARK_SUPPORTITEMS = [
	[2500,  "+1  Ticket",              "+1",  		  8001, 0],
	[4500,  "+2  Tickets",             "+2",  		  8002, 0],
	[6000,  "+3  Tickets",             "+3",  		  8003, 0],
	[9000,  "+5  Tickets",             "+5",  		  8004, 0],
	[15000, "+10 Tickets",             "+10", 		  8005, 0],
	[20000, "+20 Tickets",             "+20", 		  8006, 0],
    [800,   "Recon UAV",               "reconUAV",    8007, 1],
    [1680,  "Emergency Teleport",      "telePlode",   8008, 1],
    [1950,  "Paratroopers",            "paraDrop",    8009, 1],
    [3850,  "Missile CAS",             "airStrike",   8010, 1],
    [4220,  "Mine Cluster Shell",      "mineField",   8011, 1],
    [4690,  "Rage Stimpack",           "ragePack",    8012, 1],
    [5930,  "Mind Control Gas",        "mindConGas",  8013, 1],
    [6666,  "ARMAKART TM",             "armaKart",    8014, 1],
    [7500,  "Predator Drone",          "droneControl",8015, 1]
];

/* Objects the Player can buy */

/* Radius prevents hostiles walking through objects */

/*  Price - Display Name - Class Name - Rotation When Bought - Object Radius (meters) *prevents AI glitching through object and triggers suicide bombers - Has AI true/false (for objects with AI like autonomous turrests)
- 0 objetos menores
- 1 barricadas
- 2 muros
- 3 predios e bunkeres
- 4 torres e armazem
- 5 veiculos
 */
/*	[preço, 'nome estetico','id',rotaçao,distancia, ia, categoria], */
BUILDITEMS = [
    [1,    "VLC Media Player",	   "RoadCone_F",                        0,   0, false, 0],
    [1,    "Flag (e621)",	       "Flag_e621_F",                       0, .25, false, 0],
    [10,   "Placa de mina",        "Land_Sign_MinesDanger_English_F",   0,   0, false, 0],
    [10,   "Road Barrier",	       "RoadBarrier_F",                     0,   1, false, 0],
    [10,   "Road Barrier (Small)", "RoadBarrier_small_F",               0,  .5, false, 0],
    [25,   "Long Plank (8m)",      "Land_Plank_01_8m_F",                0,   4, false, 0],
    [75,   "Small Ramp (1m)",      "Land_Obstacle_Ramp_F",            180, 1.5, false, 0],
    [200,  "Concrete Walkway",     "Land_GH_Platform_F",                0, 3.5, false, 0],
    [260,  "Portable Light",       "Land_PortableLight_double_F",     180,   1, false, 0],
    [750,  "Ladder",               "Land_PierLadder_F",                 0,   1, false, 0],
	[950,  "Stairs",               "Land_GH_Stairs_F",                180,   4, false, 0],
    [1000, "Hallogen Lamp",        "Land_LampHalogen_F",               90,   1, false, 0],
    [50,   "Junk Barricade",       "Land_Barricade_01_4m_F",            0, 1.5, false, 1],
	[50,   "Wood Wall (Short)",    "Land_Shoot_House_Wall_Crouch_F",    0, 1.2, false, 1],
    [100,  "Wood Wall (Tall)",     "Land_Shoot_House_Wall_F",           0, 1.2, false, 1],
    [115,  "Razor Fence",          "Land_Mil_WiredFence_F",             0,   4, false, 1],
    [115,  "Czech Hedgehog",       "Land_CzechHedgehog_01_new_F",       0,   1, false, 1],
	[125,  "Razorwire Barrier",    "Land_Razorwire_F",                  0,   1, false, 1],
	[10,   "Sandbag (End)",	       "Land_BagFence_End_F",          		0,   1, false, 1],
	[25,   "Sandbag (Corner)",	   "Land_BagFence_Corner_F",            0,   1, false, 1],
    [45,   "Sandbag (Short)",      "Land_BagFence_Short_F",             0,   1, false, 1],
	[65,   "Sandbag (Long)",       "Land_BagFence_Long_F",              0,   2, false, 1],
    [65,   "Sandbag (Round)",      "Land_BagFence_Round_F",           180,   2, false, 1],
	[100,  "Short Sandbag Wall",   "Land_SandbagBarricade_01_half_F",   0, 1.5, false, 1],
    [150,  "Sandbag Wall",         "Land_SandbagBarricade_01_F",        0, 1.5, false, 1],
    [150,  "Sandbag Window",       "Land_SandbagBarricade_01_hole_F",   0, 1.5, false, 1],
	[50,   "Concrete Barrier",     "Land_CncBarrier_F",                 0, 1.2, false, 1],
    [165,  "Concrete Wall (Med)",  "Land_CncBarrierMedium_F",           0, 1.2, false, 1],
	[850,  "Concrete Wall (Tall)", "Land_CncWall1_F",                   0,   1, false, 1],
    [250,  "Tall Concrete Wall",   "Land_Mil_WallBig_4m_F",             0,   2, false, 1],
    [300,  "Long Concrete Wall",   "Land_CncBarrierMedium4_F",          0,   3, false, 1],
    [300,  "Concrete Doorway",     "Land_CncShelter_F",                 0,   1, false, 2],
	[1000, "Concrete Platform",    "BlockConcrete_F",                   0, 3.5, false, 2],
	[1500,  "Mounted DShK",         "CUP_O_DSHKM_ChDKZ", 				0, 0.5, false, 3],
	[2000, 	"Static HMG",          "B_HMG_01_high_F",          			0, 0.5, false, 3],
    [2000, 	"Static GMG",          "B_GMG_01_high_F",          			0, 0.5, false, 3],
    [500, 	"Static AT",           "B_static_AT_F",            			0, 0.5, false, 3],
	[1000, "Spike AA",             "I_static_AA_F",					  180,   1, false, 3],
    [7500, "Autonomous HMG",       "B_HMG_01_A_F",                    180, 3.5,  true, 3],
    [800,  "Storage box small",    "Box_NATO_Support_F",                0,   1, false, 3],
	[10000, "Ammo Truck",		   "O_Truck_02_Ammo_F",  	  		   90, 3.5, false, 4],
	[2025, 	"Repair Truck",		   "C_Truck_02_box_F",  	   		   90, 3.5, false, 4],
	[25000,	"Optimus Prime",   	   "WBK_WRS_WGP1_Ver1",       		    0, 3.5,  true, 4],
    [1200, "Storage box large",    "Box_NATO_AmmoVeh_F",                0,   1, false, 3],
    [400,  "Large Ramp",           "Land_VR_Slope_01_F",                0,   4, false, 2],
	[500,  "Bunker Block",         "Land_Bunker_01_blocks_3_F",         0,   2, false, 2],
	[165,  "H-Barrier (Single)",   "Land_HBarrier_1_F",                 0,   1, false, 1],
    [500,  "H-Barrier (3 Long)",   "Land_HBarrier_3_F",                 0,   2, false, 1],
    [625,  "H-Barrier (5 Long)",   "Land_HBarrier_5_F",                 0,   3, false, 1],
	[1150, "H-Barrier (4 Big)",    "Land_HBarrierBig_F",                0, 4.5, false, 1],
	[1000, "Double H-Barrier",     "Land_HBarrierWall4_F",              0,   4, false, 1],
	[1500, "H-Barrier Corridor", "Land_HBarrierWall_corridor_F", 		90,  5, false, 1],
	[5250, "H-Barrier Tower",      "Land_BagBunker_Tower_F",            0, 5, false, 2],
    [3000, "Small Bunker",         "Land_BagBunker_Small_F",          180,   3, false, 2],
    [4500, "Pillbox",              "Land_PillboxBunker_01_hex_F",      90, 2.5, false, 2],
	[500, "Torre de metal", 	   "Land_Hlaska", 					    0,   3, false, 2],
	[2050, "Tanoa ATC",            "Land_Airport_01_controlTower_F",  180,   5, false, 2],
	[5000, "Castle Tower",    	   "Land_Helfenburk",				  270,   9, false, 2],
    [6000, "Guard Tower",          "Land_Cargo_Patrol_V3_F",            0, 3.5, false, 2],
	[5000, "Emergency Medical Supplies",	"C_IDAP_supplyCrate_F",   180,   1, false, 3],
	[9500, "Modular Bunker",       "Land_Bunker_01_Small_F",          180,   6, false, 2],
	[9500, "Modular Bunker (Tall)", "Land_Bunker_01_Tall_F", 			0, 	 6, false, 2],
	[-1, "garg?", "Alsatian_Random_Visible_F", 							0, 0.5, false, 0], 
	[31039, "Flag (Based)",        "Flag_GrgTrans_F",               0,0.25, false, 0]
];

 _indexed = [];{_indexed pushBack (_x + [_forEachIndex + 1]);  // append index at end
} forEach BUILDITEMS;
BULWARK_BUILDITEMS = _indexed;

// ------- ATENÇÃO !!!!!!! AS LINHAS 479 a 520 FORAM FEITAS NO CHATGPT, simplesmente pq eu tava com preguiça de fazer um randomizador para hashmaps, a vida eh curta demais pra eu aprender linguagem proprietaria /shurg

// --- Cria o HashMap: categoria → lista de itens
/*_categoryMap = createHashMap;

{
    private _item = _x;
    _cat = _item select 6; // índice 6 = categoria

    if (isNil {_categoryMap get _cat}) then {
        _categoryMap set [_cat, []];
    };

    (_categoryMap get _cat) pushBack _item;
} forEach BUILDITEMS;

// --- Embaralha os itens de cada categoria
{
    private _category = _x;
    private _items = _categoryMap get _category;
    private _shuffled = _items call BIS_fnc_arrayShuffle;
	private _limited = _shuffled select [0, 5 min (count _shuffled)];
    _categoryMap set [_category, _limited];
} forEach (keys _categoryMap);

private _cats = keys _categoryMap;
_cats sort true; 			
private _finalList = [];
{_finalList append (_categoryMap get _x);} forEach _cats;

_indexed = [];
{
    _indexed pushBack (_x + [_forEachIndex + 1]); // adiciona índice no final
} forEach _finalList;
*/
/* BULWARK_BUILDITEMS = _indexed;
/* Time of Day*/
DAY_TIME_FROM = ("DAY_TIME_FROM" call BIS_fnc_getParamValue);
DAY_TIME_TO = ("DAY_TIME_TO" call BIS_fnc_getParamValue);

// Check for sneaky inverted configuration. FROM should always be before TO.
if (DAY_TIME_FROM > DAY_TIME_TO) then {
    DAY_TIME_FROM = DAY_TIME_TO - 2;
};

/* Starter MediKits */
BULWARK_MEDIKITS = ("BULWARK_MEDIKIT" call BIS_fnc_getParamValue);
