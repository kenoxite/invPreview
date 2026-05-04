#define ARR_1(ARG1) ARG1
#define ARR_2(ARG1,ARG2) ARG1, ARG2
#define ARR_3(ARG1,ARG2,ARG3) ARG1, ARG2, ARG3
#define ARR_4(ARG1,ARG2,ARG3,ARG4) ARG1, ARG2, ARG3, ARG4
#define ARR_5(ARG1,ARG2,ARG3,ARG4,ARG5) ARG1, ARG2, ARG3, ARG4, ARG5
#define ARR_6(ARG1,ARG2,ARG3,ARG4,ARG5,ARG6) ARG1, ARG2, ARG3, ARG4, ARG5, ARG6
#define ARR_7(ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7) ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7
#define ARR_8(ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8) ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8

#define QUOTE(var1) #var1

#define X_BIS(num) (num * (((safeZoneW / safeZoneH) min 1.2) / 40) + (safeZoneX + (safeZoneW - ((safeZoneW / safeZoneH) min 1.2))/2))
#define Y_BIS(num) (num * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) + (safeZoneY + (safeZoneH - (((safeZoneW / safeZoneH) min 1.2) / 1.2))/2))
#define W_BIS(num) (num * (((safeZoneW / safeZoneH) min 1.2) / 40))
#define H_BIS(num) (num * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25))

#define X_MAKEITBIGGA(num) (num * (safeZoneH / 40) + (safeZoneX + (safeZoneW - safeZoneH)/2))
#define Y_MAKEITBIGGA(num) (num * (safeZoneH / 30) + (safeZoneY + (safeZoneH - (safeZoneH / 1.2))/2))
#define W_MAKEITBIGGA(num) (num * (safeZoneH / 40))
#define H_MAKEITBIGGA(num) (num * (safeZoneH / 30))

#define X_PART(num) linearConversion [ARR_5(0,2,(missionNamespace getVariable [ARR_2("ace_inventory_inventoryDisplaySize",0)]),X_BIS(num),X_MAKEITBIGGA(num))]
#define Y_PART(num) linearConversion [ARR_5(0,2,(missionNamespace getVariable [ARR_2("ace_inventory_inventoryDisplaySize",0)]),Y_BIS(num),Y_MAKEITBIGGA(num))]
#define W_PART(num) linearConversion [ARR_5(0,2,(missionNamespace getVariable [ARR_2("ace_inventory_inventoryDisplaySize",0)]),W_BIS(num),W_MAKEITBIGGA(num))]
#define H_PART(num) linearConversion [ARR_5(0,2,(missionNamespace getVariable [ARR_2("ace_inventory_inventoryDisplaySize",0)]),H_BIS(num),H_MAKEITBIGGA(num))]
