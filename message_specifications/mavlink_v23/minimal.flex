// MAVLink is available under the MIT-license
module MAVLink::v23.minimal

import MAVLink::v23.tangramcustom (MessageFrame)


// Micro air vehicle / autopilot classes. This identifies the individual model.
enum MavAutopilot uint8 {
    MavAutopilotGeneric = 0;
    MavAutopilotReserved = 1;
    MavAutopilotSlugs = 2;
    MavAutopilotArdupilotmega = 3;
    MavAutopilotOpenpilot = 4;
    MavAutopilotGenericWaypointsOnly = 5;
    MavAutopilotGenericWaypointsAndSimpleNavigationOnly = 6;
    MavAutopilotGenericMissionFull = 7;
    MavAutopilotInvalid = 8;
    MavAutopilotPpz = 9;
    MavAutopilotUdb = 10;
    MavAutopilotFp = 11;
    MavAutopilotPx4 = 12;
    MavAutopilotSmaccmpilot = 13;
    MavAutopilotAutoquad = 14;
    MavAutopilotArmazila = 15;
    MavAutopilotAerob = 16;
    MavAutopilotAsluav = 17;
    MavAutopilotSmartap = 18;
    MavAutopilotAirrails = 19;
    MavAutopilotReflex = 20;
}

// Component ids (values) for the different types and instances of onboard hardware/software that might make
// up a MAVLink system (autopilot, cameras, servos, GPS systems, avoidance systems etc.). Components must
// use the appropriate ID in their source address when sending messages. Components can also use IDs to determine
// if they are the intended recipient of an incoming message. The MAV_COMP_ID_ALL value is used to indicate
// messages that must be processed by all components. When creating new entries, components that can have
// multiple instances (e.g. cameras, servos etc.) should be allocated sequential values. An appropriate number
// of values should be left free after these components to allow the number of instances to be expanded.
enum MavComponent uint32 {
    MavCompIdAll = 0;
    MavCompIdAutopilot1 = 1;
    MavCompIdUser1 = 25;
    MavCompIdUser2 = 26;
    MavCompIdUser3 = 27;
    MavCompIdUser4 = 28;
    MavCompIdUser5 = 29;
    MavCompIdUser6 = 30;
    MavCompIdUser7 = 31;
    MavCompIdUser8 = 32;
    MavCompIdUser9 = 33;
    MavCompIdUser10 = 34;
    MavCompIdUser11 = 35;
    MavCompIdUser12 = 36;
    MavCompIdUser13 = 37;
    MavCompIdUser14 = 38;
    MavCompIdUser15 = 39;
    MavCompIdUser16 = 40;
    MavCompIdUser17 = 41;
    MavCompIdUser18 = 42;
    MavCompIdUser19 = 43;
    MavCompIdUser20 = 44;
    MavCompIdUser21 = 45;
    MavCompIdUser22 = 46;
    MavCompIdUser23 = 47;
    MavCompIdUser24 = 48;
    MavCompIdUser25 = 49;
    MavCompIdUser26 = 50;
    MavCompIdUser27 = 51;
    MavCompIdUser28 = 52;
    MavCompIdUser29 = 53;
    MavCompIdUser30 = 54;
    MavCompIdUser31 = 55;
    MavCompIdUser32 = 56;
    MavCompIdUser33 = 57;
    MavCompIdUser34 = 58;
    MavCompIdUser35 = 59;
    MavCompIdUser36 = 60;
    MavCompIdUser37 = 61;
    MavCompIdUser38 = 62;
    MavCompIdUser39 = 63;
    MavCompIdUser40 = 64;
    MavCompIdUser41 = 65;
    MavCompIdUser42 = 66;
    MavCompIdUser43 = 67;
    MavCompIdTelemetryRadio = 68;
    MavCompIdUser45 = 69;
    MavCompIdUser46 = 70;
    MavCompIdUser47 = 71;
    MavCompIdUser48 = 72;
    MavCompIdUser49 = 73;
    MavCompIdUser50 = 74;
    MavCompIdUser51 = 75;
    MavCompIdUser52 = 76;
    MavCompIdUser53 = 77;
    MavCompIdUser54 = 78;
    MavCompIdUser55 = 79;
    MavCompIdUser56 = 80;
    MavCompIdUser57 = 81;
    MavCompIdUser58 = 82;
    MavCompIdUser59 = 83;
    MavCompIdUser60 = 84;
    MavCompIdUser61 = 85;
    MavCompIdUser62 = 86;
    MavCompIdUser63 = 87;
    MavCompIdUser64 = 88;
    MavCompIdUser65 = 89;
    MavCompIdUser66 = 90;
    MavCompIdUser67 = 91;
    MavCompIdUser68 = 92;
    MavCompIdUser69 = 93;
    MavCompIdUser70 = 94;
    MavCompIdUser71 = 95;
    MavCompIdUser72 = 96;
    MavCompIdUser73 = 97;
    MavCompIdUser74 = 98;
    MavCompIdUser75 = 99;
    MavCompIdCamera = 100;
    MavCompIdCamera2 = 101;
    MavCompIdCamera3 = 102;
    MavCompIdCamera4 = 103;
    MavCompIdCamera5 = 104;
    MavCompIdCamera6 = 105;
    MavCompIdServo1 = 140;
    MavCompIdServo2 = 141;
    MavCompIdServo3 = 142;
    MavCompIdServo4 = 143;
    MavCompIdServo5 = 144;
    MavCompIdServo6 = 145;
    MavCompIdServo7 = 146;
    MavCompIdServo8 = 147;
    MavCompIdServo9 = 148;
    MavCompIdServo10 = 149;
    MavCompIdServo11 = 150;
    MavCompIdServo12 = 151;
    MavCompIdServo13 = 152;
    MavCompIdServo14 = 153;
    MavCompIdGimbal = 154;
    MavCompIdLog = 155;
    MavCompIdAdsb = 156;
    MavCompIdOsd = 157;
    MavCompIdPeripheral = 158;
    MavCompIdQx1Gimbal = 159;
    MavCompIdFlarm = 160;
    MavCompIdParachute = 161;
    MavCompIdGimbal2 = 171;
    MavCompIdGimbal3 = 172;
    MavCompIdGimbal4 = 173;
    MavCompIdGimbal5 = 174;
    MavCompIdGimbal6 = 175;
    MavCompIdBattery = 180;
    MavCompIdBattery2 = 181;
    MavCompIdMissionplanner = 190;
    MavCompIdOnboardComputer = 191;
    MavCompIdOnboardComputer2 = 192;
    MavCompIdOnboardComputer3 = 193;
    MavCompIdOnboardComputer4 = 194;
    MavCompIdPathplanner = 195;
    MavCompIdObstacleAvoidance = 196;
    MavCompIdVisualInertialOdometry = 197;
    MavCompIdPairingManager = 198;
    MavCompIdImu = 200;
    MavCompIdImu2 = 201;
    MavCompIdImu3 = 202;
    MavCompIdGps = 220;
    MavCompIdGps2 = 221;
    MavCompIdOdidTxrx1 = 236;
    MavCompIdOdidTxrx2 = 237;
    MavCompIdOdidTxrx3 = 238;
    MavCompIdUdpBridge = 240;
    MavCompIdUartBridge = 241;
    MavCompIdTunnelNode = 242;
    MavCompIdSystemControl = 250;
}

// These flags encode the MAV mode.
enum MavModeFlag uint8 {
    MavModeFlagSafetyArmed = 128;
    MavModeFlagManualInputEnabled = 64;
    MavModeFlagHilEnabled = 32;
    MavModeFlagStabilizeEnabled = 16;
    MavModeFlagGuidedEnabled = 8;
    MavModeFlagAutoEnabled = 4;
    MavModeFlagTestEnabled = 2;
    MavModeFlagCustomModeEnabled = 1;
}

// These values encode the bit positions of the decode position. These values can be used to read the value
// of a flag bit by combining the base_mode variable with AND with the flag position value. The result will
// be either 0 or 1, depending on if the flag is set or not.
enum MavModeFlagDecodePosition uint32 {
    MavModeFlagDecodePositionSafety = 128;
    MavModeFlagDecodePositionManual = 64;
    MavModeFlagDecodePositionHil = 32;
    MavModeFlagDecodePositionStabilize = 16;
    MavModeFlagDecodePositionGuided = 8;
    MavModeFlagDecodePositionAuto = 4;
    MavModeFlagDecodePositionTest = 2;
    MavModeFlagDecodePositionCustomMode = 1;
}

enum MavState uint8 {
    MavStateUninit = 0;
    MavStateBoot = 1;
    MavStateCalibrating = 2;
    MavStateStandby = 3;
    MavStateActive = 4;
    MavStateCritical = 5;
    MavStateEmergency = 6;
    MavStatePoweroff = 7;
    MavStateFlightTermination = 8;
}

// MAVLINK component type reported in HEARTBEAT message. Flight controllers must report the type of the vehicle
// on which they are mounted (e.g. MAV_TYPE_OCTOROTOR). All other components must report a value appropriate
// for their type (e.g. a camera must use MAV_TYPE_CAMERA).
enum MavType uint8 {
    MavTypeGeneric = 0;
    MavTypeFixedWing = 1;
    MavTypeQuadrotor = 2;
    MavTypeCoaxial = 3;
    MavTypeHelicopter = 4;
    MavTypeAntennaTracker = 5;
    MavTypeGcs = 6;
    MavTypeAirship = 7;
    MavTypeFreeBalloon = 8;
    MavTypeRocket = 9;
    MavTypeGroundRover = 10;
    MavTypeSurfaceBoat = 11;
    MavTypeSubmarine = 12;
    MavTypeHexarotor = 13;
    MavTypeOctorotor = 14;
    MavTypeTricopter = 15;
    MavTypeFlappingWing = 16;
    MavTypeKite = 17;
    MavTypeOnboardController = 18;
    MavTypeVtolDuorotor = 19;
    MavTypeVtolQuadrotor = 20;
    MavTypeVtolTiltrotor = 21;
    MavTypeVtolReserved2 = 22;
    MavTypeVtolReserved3 = 23;
    MavTypeVtolReserved4 = 24;
    MavTypeVtolReserved5 = 25;
    MavTypeGimbal = 26;
    MavTypeAdsb = 27;
    MavTypeParafoil = 28;
    MavTypeDodecarotor = 29;
    MavTypeCamera = 30;
    MavTypeChargingStation = 31;
    MavTypeFlarm = 32;
    MavTypeServo = 33;
    MavTypeOdid = 34;
    MavTypeDecarotor = 35;
    MavTypeBattery = 36;
    MavTypeParachute = 37;
    MavTypeLog = 38;
    MavTypeOsd = 39;
    MavTypeImu = 40;
    MavTypeGps = 41;
}

message struct Heartbeat extends MessageFrame {
    // Vehicle or component type. For a flight controller component the vehicle type (quadrotor, helicopter,
    // etc.). For other components the component type (e.g. camera, gimbal, etc.). This should be used in preference
    // to component id for identifying the component type.
    Type: MavType;
    // Autopilot type / class. Use MAV_AUTOPILOT_INVALID for components that are not flight controllers.
    Autopilot: MavAutopilot;
    // System mode bitmap.
    BaseMode: MavModeFlagBitmask;
    // A bitfield for use for autopilot-specific flags
    CustomMode: uint32;
    // System status flag.
    SystemStatus: MavState;
    // MAVLink version, not writable by user, gets added by protocol because of magic data type: uint8_t_mavlink_version
    MavlinkVersion: uint8;
}



struct MavModeFlagBitmask {
    MavModeFlagBitmaskFieldSet: MavModeFlag[];
}

struct MavModeFlagDecodePositionBitmask {
    MavModeFlagDecodePositionBitmaskFieldSet: MavModeFlagDecodePosition[];
}

