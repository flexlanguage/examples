// MAVLink is available under the MIT-license
module MAVLink::v23.common

import MAVLink::v23.minimal (MavAutopilot, MavState, MavType, MavModeFlagBitmask)
import MAVLink::v23.tangramcustom (MessageFrame)
import tangram::flex::helpers::v1.annotations (Length)

// Actuator configuration, used to change a setting on an actuator. Component information metadata can be
// used to know which outputs support which commands.
enum ActuatorConfiguration uint32 {
    ActuatorConfigurationNone = 0;
    ActuatorConfigurationBeep = 1;
    ActuatorConfiguration3DModeOn = 2;
    ActuatorConfiguration3DModeOff = 3;
    ActuatorConfigurationSpinDirection1 = 4;
    ActuatorConfigurationSpinDirection2 = 5;
}

// Actuator output function. Values greater or equal to 1000 are autopilot-specific.
enum ActuatorOutputFunction uint32 {
    ActuatorOutputFunctionNone = 0;
    ActuatorOutputFunctionMotor1 = 1;
    ActuatorOutputFunctionMotor2 = 2;
    ActuatorOutputFunctionMotor3 = 3;
    ActuatorOutputFunctionMotor4 = 4;
    ActuatorOutputFunctionMotor5 = 5;
    ActuatorOutputFunctionMotor6 = 6;
    ActuatorOutputFunctionMotor7 = 7;
    ActuatorOutputFunctionMotor8 = 8;
    ActuatorOutputFunctionMotor9 = 9;
    ActuatorOutputFunctionMotor10 = 10;
    ActuatorOutputFunctionMotor11 = 11;
    ActuatorOutputFunctionMotor12 = 12;
    ActuatorOutputFunctionMotor13 = 13;
    ActuatorOutputFunctionMotor14 = 14;
    ActuatorOutputFunctionMotor15 = 15;
    ActuatorOutputFunctionMotor16 = 16;
    ActuatorOutputFunctionServo1 = 33;
    ActuatorOutputFunctionServo2 = 34;
    ActuatorOutputFunctionServo3 = 35;
    ActuatorOutputFunctionServo4 = 36;
    ActuatorOutputFunctionServo5 = 37;
    ActuatorOutputFunctionServo6 = 38;
    ActuatorOutputFunctionServo7 = 39;
    ActuatorOutputFunctionServo8 = 40;
    ActuatorOutputFunctionServo9 = 41;
    ActuatorOutputFunctionServo10 = 42;
    ActuatorOutputFunctionServo11 = 43;
    ActuatorOutputFunctionServo12 = 44;
    ActuatorOutputFunctionServo13 = 45;
    ActuatorOutputFunctionServo14 = 46;
    ActuatorOutputFunctionServo15 = 47;
    ActuatorOutputFunctionServo16 = 48;
}

// Enumeration of the ADSB altimeter types
enum AdsbAltitudeType uint8 {
    AdsbAltitudeTypePressureQnh = 0;
    AdsbAltitudeTypeGeometric = 1;
}

// ADSB classification for the type of vehicle emitting the transponder signal
enum AdsbEmitterType uint8 {
    AdsbEmitterTypeNoInfo = 0;
    AdsbEmitterTypeLight = 1;
    AdsbEmitterTypeSmall = 2;
    AdsbEmitterTypeLarge = 3;
    AdsbEmitterTypeHighVortexLarge = 4;
    AdsbEmitterTypeHeavy = 5;
    AdsbEmitterTypeHighlyManuv = 6;
    AdsbEmitterTypeRotocraft = 7;
    AdsbEmitterTypeUnassigned = 8;
    AdsbEmitterTypeGlider = 9;
    AdsbEmitterTypeLighterAir = 10;
    AdsbEmitterTypeParachute = 11;
    AdsbEmitterTypeUltraLight = 12;
    AdsbEmitterTypeUnassigned2 = 13;
    AdsbEmitterTypeUav = 14;
    AdsbEmitterTypeSpace = 15;
    AdsbEmitterTypeUnassgined3 = 16;
    AdsbEmitterTypeEmergencySurface = 17;
    AdsbEmitterTypeServiceSurface = 18;
    AdsbEmitterTypePointObstacle = 19;
}

// These flags indicate status such as data validity of each data source. Set = data valid
enum AdsbFlags uint16 {
    AdsbFlagsValidCoords = 1;
    AdsbFlagsValidAltitude = 2;
    AdsbFlagsValidHeading = 4;
    AdsbFlagsValidVelocity = 8;
    AdsbFlagsValidCallsign = 16;
    AdsbFlagsValidSquawk = 32;
    AdsbFlagsSimulated = 64;
    AdsbFlagsVerticalVelocityValid = 128;
    AdsbFlagsBaroValid = 256;
    AdsbFlagsSourceUat = 32768;
}

// These flags are used in the AIS_VESSEL.fields bitmask to indicate validity of data in the other message
// fields. When set, the data is valid.
enum AisFlags uint16 {
    AisFlagsPositionAccuracy = 1;
    AisFlagsValidCog = 2;
    AisFlagsValidVelocity = 4;
    AisFlagsHighVelocity = 8;
    AisFlagsValidTurnRate = 16;
    AisFlagsTurnRateSignOnly = 32;
    AisFlagsValidDimensions = 64;
    AisFlagsLargeBowDimension = 128;
    AisFlagsLargeSternDimension = 256;
    AisFlagsLargePortDimension = 512;
    AisFlagsLargeStarboardDimension = 1024;
    AisFlagsValidCallsign = 2048;
    AisFlagsValidName = 4096;
}

// Navigational status of AIS vessel, enum duplicated from AIS standard, https://gpsd.gitlab.io/gpsd/AIVDM.html
enum AisNavStatus uint8 {
    UnderWay = 0;
    AisNavAnchored = 1;
    AisNavUnCommanded = 2;
    AisNavRestrictedManoeuverability = 3;
    AisNavDraughtConstrained = 4;
    AisNavMoored = 5;
    AisNavAground = 6;
    AisNavFishing = 7;
    AisNavSailing = 8;
    AisNavReservedHsc = 9;
    AisNavReservedWig = 10;
    AisNavReserved1 = 11;
    AisNavReserved2 = 12;
    AisNavReserved3 = 13;
    AisNavAisSart = 14;
    AisNavUnknown = 15;
}

// Type of AIS vessel, enum duplicated from AIS standard, https://gpsd.gitlab.io/gpsd/AIVDM.html
enum AisType uint8 {
    AisTypeUnknown = 0;
    AisTypeReserved1 = 1;
    AisTypeReserved2 = 2;
    AisTypeReserved3 = 3;
    AisTypeReserved4 = 4;
    AisTypeReserved5 = 5;
    AisTypeReserved6 = 6;
    AisTypeReserved7 = 7;
    AisTypeReserved8 = 8;
    AisTypeReserved9 = 9;
    AisTypeReserved10 = 10;
    AisTypeReserved11 = 11;
    AisTypeReserved12 = 12;
    AisTypeReserved13 = 13;
    AisTypeReserved14 = 14;
    AisTypeReserved15 = 15;
    AisTypeReserved16 = 16;
    AisTypeReserved17 = 17;
    AisTypeReserved18 = 18;
    AisTypeReserved19 = 19;
    AisTypeWig = 20;
    AisTypeWigHazardousA = 21;
    AisTypeWigHazardousB = 22;
    AisTypeWigHazardousC = 23;
    AisTypeWigHazardousD = 24;
    AisTypeWigReserved1 = 25;
    AisTypeWigReserved2 = 26;
    AisTypeWigReserved3 = 27;
    AisTypeWigReserved4 = 28;
    AisTypeWigReserved5 = 29;
    AisTypeFishing = 30;
    AisTypeTowing = 31;
    AisTypeTowingLarge = 32;
    AisTypeDredging = 33;
    AisTypeDiving = 34;
    AisTypeMilitary = 35;
    AisTypeSailing = 36;
    AisTypePleasure = 37;
    AisTypeReserved20 = 38;
    AisTypeReserved21 = 39;
    AisTypeHsc = 40;
    AisTypeHscHazardousA = 41;
    AisTypeHscHazardousB = 42;
    AisTypeHscHazardousC = 43;
    AisTypeHscHazardousD = 44;
    AisTypeHscReserved1 = 45;
    AisTypeHscReserved2 = 46;
    AisTypeHscReserved3 = 47;
    AisTypeHscReserved4 = 48;
    AisTypeHscUnknown = 49;
    AisTypePilot = 50;
    AisTypeSar = 51;
    AisTypeTug = 52;
    AisTypePortTender = 53;
    AisTypeAntiPollution = 54;
    AisTypeLawEnforcement = 55;
    AisTypeSpareLocal1 = 56;
    AisTypeSpareLocal2 = 57;
    AisTypeMedicalTransport = 58;
    AisTypeNonecombatant = 59;
    AisTypePassenger = 60;
    AisTypePassengerHazardousA = 61;
    AisTypePassengerHazardousB = 62;
    AisTypeAisTypePassengerHazardousC = 63;
    AisTypePassengerHazardousD = 64;
    AisTypePassengerReserved1 = 65;
    AisTypePassengerReserved2 = 66;
    AisTypePassengerReserved3 = 67;
    AisTypeAisTypePassengerReserved4 = 68;
    AisTypePassengerUnknown = 69;
    AisTypeCargo = 70;
    AisTypeCargoHazardousA = 71;
    AisTypeCargoHazardousB = 72;
    AisTypeCargoHazardousC = 73;
    AisTypeCargoHazardousD = 74;
    AisTypeCargoReserved1 = 75;
    AisTypeCargoReserved2 = 76;
    AisTypeCargoReserved3 = 77;
    AisTypeCargoReserved4 = 78;
    AisTypeCargoUnknown = 79;
    AisTypeTanker = 80;
    AisTypeTankerHazardousA = 81;
    AisTypeTankerHazardousB = 82;
    AisTypeTankerHazardousC = 83;
    AisTypeTankerHazardousD = 84;
    AisTypeTankerReserved1 = 85;
    AisTypeTankerReserved2 = 86;
    AisTypeTankerReserved3 = 87;
    AisTypeTankerReserved4 = 88;
    AisTypeTankerUnknown = 89;
    AisTypeOther = 90;
    AisTypeOtherHazardousA = 91;
    AisTypeOtherHazardousB = 92;
    AisTypeOtherHazardousC = 93;
    AisTypeOtherHazardousD = 94;
    AisTypeOtherReserved1 = 95;
    AisTypeOtherReserved2 = 96;
    AisTypeOtherReserved3 = 97;
    AisTypeOtherReserved4 = 98;
    AisTypeOtherUnknown = 99;
}

// Bitmap to indicate which dimensions should be ignored by the vehicle: a value of 0b00000000 indicates
// that none of the setpoint dimensions should be ignored.
enum AttitudeTargetTypemask uint8 {
    AttitudeTargetTypemaskBodyRollRateIgnore = 1;
    AttitudeTargetTypemaskBodyPitchRateIgnore = 2;
    AttitudeTargetTypemaskBodyYawRateIgnore = 4;
    AttitudeTargetTypemaskThrustBodySet = 32;
    AttitudeTargetTypemaskThrottleIgnore = 64;
    AttitudeTargetTypemaskAttitudeIgnore = 128;
}

// Enable axes that will be tuned via autotuning. Used in MAV_CMD_DO_AUTOTUNE_ENABLE.
enum AutotuneAxis uint32 {
    AutotuneAxisDefault = 0;
    AutotuneAxisRoll = 1;
    AutotuneAxisPitch = 2;
    AutotuneAxisYaw = 3;
}

// Camera capability flags (Bitmap)
enum CameraCapFlags uint32 {
    CameraCapFlagsCaptureVideo = 1;
    CameraCapFlagsCaptureImage = 2;
    CameraCapFlagsHasModes = 4;
    CameraCapFlagsCanCaptureImageInVideoMode = 8;
    CameraCapFlagsCanCaptureVideoInImageMode = 16;
    CameraCapFlagsHasImageSurveyMode = 32;
    CameraCapFlagsHasBasicZoom = 64;
    CameraCapFlagsHasBasicFocus = 128;
    CameraCapFlagsHasVideoStream = 256;
    CameraCapFlagsHasTrackingPoint = 512;
    CameraCapFlagsHasTrackingRectangle = 1024;
    CameraCapFlagsHasTrackingGeoStatus = 2048;
}

// Camera Modes.
enum CameraMode uint8 {
    CameraModeImage = 0;
    CameraModeVideo = 1;
    CameraModeImageSurvey = 2;
}

// Camera tracking modes
enum CameraTrackingMode uint8 {
    CameraTrackingModeNone = 0;
    CameraTrackingModePoint = 1;
    CameraTrackingModeRectangle = 2;
}

// Camera tracking status flags
enum CameraTrackingStatusFlags uint8 {
    CameraTrackingStatusFlagsIdle = 0;
    CameraTrackingStatusFlagsActive = 1;
    CameraTrackingStatusFlagsError = 2;
}

// Camera tracking target data (shows where tracked target is within image)
enum CameraTrackingTargetData uint8 {
    CameraTrackingTargetDataNone = 0;
    CameraTrackingTargetDataEmbedded = 1;
    CameraTrackingTargetDataRendered = 2;
    CameraTrackingTargetDataInStatus = 4;
}

// Zoom types for MAV_CMD_SET_CAMERA_ZOOM
enum CameraZoomType uint32 {
    ZoomTypeStep = 0;
    ZoomTypeContinuous = 1;
    ZoomTypeRange = 2;
    ZoomTypeFocalLength = 3;
}

// Possible responses from a CELLULAR_CONFIG message.
enum CellularConfigResponse uint8 {
    CellularConfigResponseAccepted = 0;
    CellularConfigResponseApnError = 1;
    CellularConfigResponsePinError = 2;
    CellularConfigResponseRejected = 3;
    CellularConfigBlockedPukRequired = 4;
}

// These flags are used to diagnose the failure state of CELLULAR_STATUS
enum CellularNetworkFailedReason uint8 {
    CellularNetworkFailedReasonNone = 0;
    CellularNetworkFailedReasonUnknown = 1;
    CellularNetworkFailedReasonSimMissing = 2;
    CellularNetworkFailedReasonSimError = 3;
}

// Cellular network radio type
enum CellularNetworkRadioType uint8 {
    CellularNetworkRadioTypeNone = 0;
    CellularNetworkRadioTypeGsm = 1;
    CellularNetworkRadioTypeCdma = 2;
    CellularNetworkRadioTypeWcdma = 3;
    CellularNetworkRadioTypeLte = 4;
}

// These flags encode the cellular network status
enum CellularStatusFlag uint8 {
    CellularStatusFlagUnknown = 0;
    CellularStatusFlagFailed = 1;
    CellularStatusFlagInitializing = 2;
    CellularStatusFlagLocked = 3;
    CellularStatusFlagDisabled = 4;
    CellularStatusFlagDisabling = 5;
    CellularStatusFlagEnabling = 6;
    CellularStatusFlagEnabled = 7;
    CellularStatusFlagSearching = 8;
    CellularStatusFlagRegistered = 9;
    CellularStatusFlagDisconnecting = 10;
    CellularStatusFlagConnecting = 11;
    CellularStatusFlagConnected = 12;
}

// Supported component metadata types. These are used in the "general" metadata file returned by COMPONENT_INFORMATION
// to provide information about supported metadata types. The types are not used directly in MAVLink messages.
enum CompMetadataType uint32 {
    CompMetadataTypeGeneral = 0;
    CompMetadataTypeParameter = 1;
    CompMetadataTypeCommands = 2;
    CompMetadataTypePeripherals = 3;
    CompMetadataTypeEvents = 4;
    CompMetadataTypeActuators = 5;
}

// Indicates the ESC connection type.
enum EscConnectionType uint8 {
    EscConnectionTypePpm = 0;
    EscConnectionTypeSerial = 1;
    EscConnectionTypeOneshot = 2;
    EscConnectionTypeI2C = 3;
    EscConnectionTypeCan = 4;
    EscConnectionTypeDshot = 5;
}

// Flags to report ESC failures.
enum EscFailureFlags uint16 {
    EscFailureNone = 0;
    EscFailureOverCurrent = 1;
    EscFailureOverVoltage = 2;
    EscFailureOverTemperature = 4;
    EscFailureOverRpm = 8;
    EscFailureInconsistentCmd = 16;
    EscFailureMotorStuck = 32;
    EscFailureGeneric = 64;
}

// Flags in ESTIMATOR_STATUS message
enum EstimatorStatusFlags uint16 {
    EstimatorAttitude = 1;
    EstimatorVelocityHoriz = 2;
    EstimatorVelocityVert = 4;
    EstimatorPosHorizRel = 8;
    EstimatorPosHorizAbs = 16;
    EstimatorPosVertAbs = 32;
    EstimatorPosVertAgl = 64;
    EstimatorConstPosMode = 128;
    EstimatorPredPosHorizRel = 256;
    EstimatorPredPosHorizAbs = 512;
    EstimatorGpsGlitch = 1024;
    EstimatorAccelError = 2048;
}

// List of possible failure type to inject.
enum FailureType uint32 {
    FailureTypeOk = 0;
    FailureTypeOff = 1;
    FailureTypeStuck = 2;
    FailureTypeGarbage = 3;
    FailureTypeWrong = 4;
    FailureTypeSlow = 5;
    FailureTypeDelayed = 6;
    FailureTypeIntermittent = 7;
}

// List of possible units where failures can be injected.
enum FailureUnit uint32 {
    FailureUnitSensorGyro = 0;
    FailureUnitSensorAccel = 1;
    FailureUnitSensorMag = 2;
    FailureUnitSensorBaro = 3;
    FailureUnitSensorGps = 4;
    FailureUnitSensorOpticalFlow = 5;
    FailureUnitSensorVio = 6;
    FailureUnitSensorDistanceSensor = 7;
    FailureUnitSensorAirspeed = 8;
    FailureUnitSystemBattery = 100;
    FailureUnitSystemMotor = 101;
    FailureUnitSystemServo = 102;
    FailureUnitSystemAvoidance = 103;
    FailureUnitSystemRcSignal = 104;
    FailureUnitSystemMavlinkSignal = 105;
}

// Actions following geofence breach.
enum FenceAction uint32 {
    FenceActionNone = 0;
    FenceActionGuided = 1;
    FenceActionReport = 2;
    FenceActionGuidedThrPass = 3;
    FenceActionRtl = 4;
    FenceActionHold = 5;
    FenceActionTerminate = 6;
    FenceActionLand = 7;
}

enum FenceBreach uint8 {
    FenceBreachNone = 0;
    FenceBreachMinalt = 1;
    FenceBreachMaxalt = 2;
    FenceBreachBoundary = 3;
}

// Actions being taken to mitigate/prevent fence breach
enum FenceMitigate uint8 {
    FenceMitigateUnknown = 0;
    FenceMitigateNone = 1;
    FenceMitigateVelLimit = 2;
}

// These values define the type of firmware release. These values indicate the first version or release of
// this type. For example the first alpha release would be 64, the second would be 65.
enum FirmwareVersionType uint32 {
    FirmwareVersionTypeDev = 0;
    FirmwareVersionTypeAlpha = 64;
    FirmwareVersionTypeBeta = 128;
    FirmwareVersionTypeRc = 192;
    FirmwareVersionTypeOfficial = 255;
}

// Gimbal device (low level) capability flags (bitmap)
enum GimbalDeviceCapFlags uint16 {
    GimbalDeviceCapFlagsHasRetract = 1;
    GimbalDeviceCapFlagsHasNeutral = 2;
    GimbalDeviceCapFlagsHasRollAxis = 4;
    GimbalDeviceCapFlagsHasRollFollow = 8;
    GimbalDeviceCapFlagsHasRollLock = 16;
    GimbalDeviceCapFlagsHasPitchAxis = 32;
    GimbalDeviceCapFlagsHasPitchFollow = 64;
    GimbalDeviceCapFlagsHasPitchLock = 128;
    GimbalDeviceCapFlagsHasYawAxis = 256;
    GimbalDeviceCapFlagsHasYawFollow = 512;
    GimbalDeviceCapFlagsHasYawLock = 1024;
    GimbalDeviceCapFlagsSupportsInfiniteYaw = 2048;
}

// Gimbal device (low level) error flags (bitmap, 0 means no error)
enum GimbalDeviceErrorFlags uint32 {
    GimbalDeviceErrorFlagsAtRollLimit = 1;
    GimbalDeviceErrorFlagsAtPitchLimit = 2;
    GimbalDeviceErrorFlagsAtYawLimit = 4;
    GimbalDeviceErrorFlagsEncoderError = 8;
    GimbalDeviceErrorFlagsPowerError = 16;
    GimbalDeviceErrorFlagsMotorError = 32;
    GimbalDeviceErrorFlagsSoftwareError = 64;
    GimbalDeviceErrorFlagsCommsError = 128;
    GimbalDeviceErrorFlagsCalibrationRunning = 256;
}

// Flags for gimbal device (lower level) operation.
enum GimbalDeviceFlags uint16 {
    GimbalDeviceFlagsRetract = 1;
    GimbalDeviceFlagsNeutral = 2;
    GimbalDeviceFlagsRollLock = 4;
    GimbalDeviceFlagsPitchLock = 8;
    GimbalDeviceFlagsYawLock = 16;
}

// Gimbal manager high level capability flags (bitmap). The first 16 bits are identical to the GIMBAL_DEVICE_CAP_FLAGS.
// However, the gimbal manager does not need to copy the flags from the gimbal but can also enhance the capabilities
// and thus add flags.
enum GimbalManagerCapFlags uint32 {
    GimbalManagerCapFlagsHasRetract = 1;
    GimbalManagerCapFlagsHasNeutral = 2;
    GimbalManagerCapFlagsHasRollAxis = 4;
    GimbalManagerCapFlagsHasRollFollow = 8;
    GimbalManagerCapFlagsHasRollLock = 16;
    GimbalManagerCapFlagsHasPitchAxis = 32;
    GimbalManagerCapFlagsHasPitchFollow = 64;
    GimbalManagerCapFlagsHasPitchLock = 128;
    GimbalManagerCapFlagsHasYawAxis = 256;
    GimbalManagerCapFlagsHasYawFollow = 512;
    GimbalManagerCapFlagsHasYawLock = 1024;
    GimbalManagerCapFlagsSupportsInfiniteYaw = 2048;
    GimbalManagerCapFlagsCanPointLocationLocal = 65536;
    GimbalManagerCapFlagsCanPointLocationGlobal = 131072;
}

// Flags for high level gimbal manager operation The first 16 bits are identical to the GIMBAL_DEVICE_FLAGS.
enum GimbalManagerFlags uint32 {
    GimbalManagerFlagsRetract = 1;
    GimbalManagerFlagsNeutral = 2;
    GimbalManagerFlagsRollLock = 4;
    GimbalManagerFlagsPitchLock = 8;
    GimbalManagerFlagsYawLock = 16;
}

// Type of GPS fix
enum GpsFixType uint8 {
    GpsFixTypeNoGps = 0;
    GpsFixTypeNoFix = 1;
    GpsFixType2DFix = 2;
    GpsFixType3DFix = 3;
    GpsFixTypeDgps = 4;
    GpsFixTypeRtkFloat = 5;
    GpsFixTypeRtkFixed = 6;
    GpsFixTypeStatic = 7;
    GpsFixTypePpp = 8;
}

enum GpsInputIgnoreFlags uint16 {
    GpsInputIgnoreFlagAlt = 1;
    GpsInputIgnoreFlagHdop = 2;
    GpsInputIgnoreFlagVdop = 4;
    GpsInputIgnoreFlagVelHoriz = 8;
    GpsInputIgnoreFlagVelVert = 16;
    GpsInputIgnoreFlagSpeedAccuracy = 32;
    GpsInputIgnoreFlagHorizontalAccuracy = 64;
    GpsInputIgnoreFlagVerticalAccuracy = 128;
}

// Gripper actions.
enum GripperActions uint32 {
    GripperActionRelease = 0;
    GripperActionGrab = 1;
}

// Flags in the HIGHRES_IMU message indicate which fields have updated since the last message
enum HighresImuUpdatedFlags uint16 {
    HighresImuUpdatedNone = 0;
    HighresImuUpdatedXacc = 1;
    HighresImuUpdatedYacc = 2;
    HighresImuUpdatedZacc = 4;
    HighresImuUpdatedXgyro = 8;
    HighresImuUpdatedYgyro = 16;
    HighresImuUpdatedZgyro = 32;
    HighresImuUpdatedXmag = 64;
    HighresImuUpdatedYmag = 128;
    HighresImuUpdatedZmag = 256;
    HighresImuUpdatedAbsPressure = 512;
    HighresImuUpdatedDiffPressure = 1024;
    HighresImuUpdatedPressureAlt = 2048;
    HighresImuUpdatedTemperature = 4096;
    HighresImuUpdatedAll = 65535;
}

// Flags in the HIL_SENSOR message indicate which fields have updated since the last message
enum HilSensorUpdatedFlags uint32 {
    HilSensorUpdatedNone = 0;
    HilSensorUpdatedXacc = 1;
    HilSensorUpdatedYacc = 2;
    HilSensorUpdatedZacc = 4;
    HilSensorUpdatedXgyro = 8;
    HilSensorUpdatedYgyro = 16;
    HilSensorUpdatedZgyro = 32;
    HilSensorUpdatedXmag = 64;
    HilSensorUpdatedYmag = 128;
    HilSensorUpdatedZmag = 256;
    HilSensorUpdatedAbsPressure = 512;
    HilSensorUpdatedDiffPressure = 1024;
    HilSensorUpdatedPressureAlt = 2048;
    HilSensorUpdatedTemperature = 4096;
}

// Flags to report failure cases over the high latency telemtry.
enum HlFailureFlag uint16 {
    HlFailureFlagGps = 1;
    HlFailureFlagDifferentialPressure = 2;
    HlFailureFlagAbsolutePressure = 4;
    HlFailureFlag3DAccel = 8;
    HlFailureFlag3DGyro = 16;
    HlFailureFlag3DMag = 32;
    HlFailureFlagTerrain = 64;
    HlFailureFlagBattery = 128;
    HlFailureFlagRcReceiver = 256;
    HlFailureFlagOffboardLink = 512;
    HlFailureFlagEngine = 1024;
    HlFailureFlagGeofence = 2048;
    HlFailureFlagEstimator = 4096;
    HlFailureFlagMission = 8192;
}

// Type of landing target
enum LandingTargetType uint8 {
    LandingTargetTypeLightBeacon = 0;
    LandingTargetTypeRadioBeacon = 1;
    LandingTargetTypeVisionFiducial = 2;
    LandingTargetTypeVisionOther = 3;
}

enum MagCalStatus uint8 {
    MagCalNotStarted = 0;
    MagCalWaitingToStart = 1;
    MagCalRunningStepOne = 2;
    MagCalRunningStepTwo = 3;
    MagCalSuccess = 4;
    MagCalFailed = 5;
    MagCalBadOrientation = 6;
    MagCalBadRadius = 7;
}

enum MavlinkDataStreamType uint8 {
    MavlinkDataStreamImgJpeg = 0;
    MavlinkDataStreamImgBmp = 1;
    MavlinkDataStreamImgRaw8U = 2;
    MavlinkDataStreamImgRaw32U = 3;
    MavlinkDataStreamImgPgm = 4;
    MavlinkDataStreamImgPng = 5;
}

enum MavArmAuthDeniedReason uint32 {
    MavArmAuthDeniedReasonGeneric = 0;
    MavArmAuthDeniedReasonNone = 1;
    MavArmAuthDeniedReasonInvalidWaypoint = 2;
    MavArmAuthDeniedReasonTimeout = 3;
    MavArmAuthDeniedReasonAirspaceInUse = 4;
    MavArmAuthDeniedReasonBadWeather = 5;
}

// Enumeration for battery charge states.
enum MavBatteryChargeState uint8 {
    MavBatteryChargeStateUndefined = 0;
    MavBatteryChargeStateOk = 1;
    MavBatteryChargeStateLow = 2;
    MavBatteryChargeStateCritical = 3;
    MavBatteryChargeStateEmergency = 4;
    MavBatteryChargeStateFailed = 5;
    MavBatteryChargeStateUnhealthy = 6;
    MavBatteryChargeStateCharging = 7;
}

// Smart battery supply status/fault flags (bitmask) for health indication. The battery must also report
// either MAV_BATTERY_CHARGE_STATE_FAILED or MAV_BATTERY_CHARGE_STATE_UNHEALTHY if any of these are set.
enum MavBatteryFault uint32 {
    MavBatteryFaultDeepDischarge = 1;
    MavBatteryFaultSpikes = 2;
    MavBatteryFaultCellFail = 4;
    MavBatteryFaultOverCurrent = 8;
    MavBatteryFaultOverTemperature = 16;
    MavBatteryFaultUnderTemperature = 32;
    MavBatteryFaultIncompatibleVoltage = 64;
    MavBatteryFaultIncompatibleFirmware = 128;
    BatteryFaultIncompatibleCellsConfiguration = 256;
}

// Enumeration of battery functions
enum MavBatteryFunction uint8 {
    MavBatteryFunctionUnknown = 0;
    MavBatteryFunctionAll = 1;
    MavBatteryFunctionPropulsion = 2;
    MavBatteryFunctionAvionics = 3;
    MavBatteryTypePayload = 4;
}

// Battery mode. Note, the normal operation mode (i.e. when flying) should be reported as MAV_BATTERY_MODE_UNKNOWN
// to allow message trimming in normal flight.
enum MavBatteryMode uint8 {
    MavBatteryModeUnknown = 0;
    MavBatteryModeAutoDischarging = 1;
    MavBatteryModeHotSwap = 2;
}

// Enumeration of battery types
enum MavBatteryType uint8 {
    MavBatteryTypeUnknown = 0;
    MavBatteryTypeLipo = 1;
    MavBatteryTypeLife = 2;
    MavBatteryTypeLion = 3;
    MavBatteryTypeNimh = 4;
}

// ACK / NACK / ERROR values as a result of MAV_CMDs and for mission item transmission.
enum MavCmdAck uint32 {
    MavCmdAckOk = 0;
    MavCmdAckErrFail = 1;
    MavCmdAckErrAccessDenied = 2;
    MavCmdAckErrNotSupported = 3;
    MavCmdAckErrCoordinateFrameNotSupported = 4;
    MavCmdAckErrCoordinatesOutOfRange = 5;
    MavCmdAckErrXLatOutOfRange = 6;
    MavCmdAckErrYLonOutOfRange = 7;
    MavCmdAckErrZAltOutOfRange = 8;
}

// Possible actions an aircraft can take to avoid a collision.
enum MavCollisionAction uint8 {
    MavCollisionActionNone = 0;
    MavCollisionActionReport = 1;
    MavCollisionActionAscendOrDescend = 2;
    MavCollisionActionMoveHorizontally = 3;
    MavCollisionActionMovePerpendicular = 4;
    MavCollisionActionRtl = 5;
    MavCollisionActionHover = 6;
}

// Source of information about this collision.
enum MavCollisionSrc uint8 {
    MavCollisionSrcAdsb = 0;
    MavCollisionSrcMavlinkGpsGlobalInt = 1;
}

// Aircraft-rated danger from this threat.
enum MavCollisionThreatLevel uint8 {
    MavCollisionThreatLevelNone = 0;
    MavCollisionThreatLevelLow = 1;
    MavCollisionThreatLevelHigh = 2;
}

// A data stream is not a fixed set of messages, but rather a recommendation to the autopilot software. Individual
// autopilots may or may not obey the recommended messages.
enum MavDataStream uint32 {
    MavDataStreamAll = 0;
    MavDataStreamRawSensors = 1;
    MavDataStreamExtendedStatus = 2;
    MavDataStreamRcChannels = 3;
    MavDataStreamRawController = 4;
    MavDataStreamPosition = 6;
    MavDataStreamExtra1 = 10;
    MavDataStreamExtra2 = 11;
    MavDataStreamExtra3 = 12;
}

// Enumeration of distance sensor types
enum MavDistanceSensor uint8 {
    MavDistanceSensorLaser = 0;
    MavDistanceSensorUltrasound = 1;
    MavDistanceSensorInfrared = 2;
    MavDistanceSensorRadar = 3;
    MavDistanceSensorUnknown = 4;
}

// Bitmap of options for the MAV_CMD_DO_REPOSITION
enum MavDoRepositionFlags uint32 {
    MavDoRepositionFlagsChangeMode = 1;
}

// Enumeration of estimator types
enum MavEstimatorType uint8 {
    MavEstimatorTypeUnknown = 0;
    MavEstimatorTypeNaive = 1;
    MavEstimatorTypeVision = 2;
    MavEstimatorTypeVio = 3;
    MavEstimatorTypeGps = 4;
    MavEstimatorTypeGpsIns = 5;
    MavEstimatorTypeMocap = 6;
    MavEstimatorTypeLidar = 7;
    MavEstimatorTypeAutopilot = 8;
}

// Flags for CURRENT_EVENT_SEQUENCE.
enum MavEventCurrentSequenceFlags uint8 {
    MavEventCurrentSequenceFlagsReset = 1;
}

// Reason for an event error response.
enum MavEventErrorReason uint8 {
    MavEventErrorReasonUnavailable = 0;
}

// Co-ordinate frames used by MAVLink. Not all frames are supported by all commands, messages, or vehicles.
// Global frames use the following naming conventions: - "GLOBAL": Global co-ordinate frame with WGS84 latitude/longitude
// and altitude positive over mean sea level (MSL) by default. The following modifiers may be used with "GLOBAL":
// - "RELATIVE_ALT": Altitude is relative to the vehicle home position rather than MSL. - "TERRAIN_ALT":
// Altitude is relative to ground level rather than MSL. - "INT": Latitude/longitude (in degrees) are scaled
// by multiplying by 1E7. Local frames use the following naming conventions: - "LOCAL": Origin of local frame
// is fixed relative to earth. Unless otherwise specified this origin is the origin of the vehicle position-estimator
// ("EKF"). - "BODY": Origin of local frame travels with the vehicle. NOTE, "BODY" does NOT indicate alignment
// of frame axis with vehicle attitude. - "OFFSET": Deprecated synonym for "BODY" (origin travels with the
// vehicle). Not to be used for new frames. Some deprecated frames do not follow these conventions (e.g.
// MAV_FRAME_BODY_NED and MAV_FRAME_BODY_OFFSET_NED).
enum MavFrame uint8 {
    MavFrameGlobal = 0;
    MavFrameLocalNed = 1;
    MavFrameMission = 2;
    MavFrameGlobalRelativeAlt = 3;
    MavFrameLocalEnu = 4;
    MavFrameGlobalInt = 5;
    MavFrameGlobalRelativeAltInt = 6;
    MavFrameLocalOffsetNed = 7;
    MavFrameBodyNed = 8;
    MavFrameBodyOffsetNed = 9;
    MavFrameGlobalTerrainAlt = 10;
    MavFrameGlobalTerrainAltInt = 11;
    MavFrameBodyFrd = 12;
    MavFrameReserved13 = 13;
    MavFrameReserved14 = 14;
    MavFrameReserved15 = 15;
    MavFrameReserved16 = 16;
    MavFrameReserved17 = 17;
    MavFrameReserved18 = 18;
    MavFrameReserved19 = 19;
    MavFrameLocalFrd = 20;
    MavFrameLocalFlu = 21;
}

// Flags to report status/failure cases for a power generator (used in GENERATOR_STATUS). Note that FAULTS
// are conditions that cause the generator to fail. Warnings are conditions that require attention before
// the next use (they indicate the system is not operating properly).
enum MavGeneratorStatusFlag uint64 {
    MavGeneratorStatusFlagOff = 1;
    MavGeneratorStatusFlagReady = 2;
    MavGeneratorStatusFlagGenerating = 4;
    MavGeneratorStatusFlagCharging = 8;
    MavGeneratorStatusFlagReducedPower = 16;
    MavGeneratorStatusFlagMaxpower = 32;
    MavGeneratorStatusFlagOvertempWarning = 64;
    MavGeneratorStatusFlagOvertempFault = 128;
    MavGeneratorStatusFlagElectronicsOvertempWarning = 256;
    MavGeneratorStatusFlagElectronicsOvertempFault = 512;
    MavGeneratorStatusFlagElectronicsFault = 1024;
    MavGeneratorStatusFlagPowersourceFault = 2048;
    MavGeneratorStatusFlagCommunicationWarning = 4096;
    MavGeneratorStatusFlagCoolingWarning = 8192;
    MavGeneratorStatusFlagPowerRailFault = 16384;
    MavGeneratorStatusFlagOvercurrentFault = 32768;
    MavGeneratorStatusFlagBatteryOverchargeCurrentFault = 65536;
    MavGeneratorStatusFlagOvervoltageFault = 131072;
    MavGeneratorStatusFlagBatteryUndervoltFault = 262144;
    MavGeneratorStatusFlagStartInhibited = 524288;
    MavGeneratorStatusFlagMaintenanceRequired = 1048576;
    MavGeneratorStatusFlagWarmingUp = 2097152;
    MavGeneratorStatusFlagIdle = 4194304;
}

// Actions that may be specified in MAV_CMD_OVERRIDE_GOTO to override mission execution.
enum MavGoto uint32 {
    MavGotoDoHold = 0;
    MavGotoDoContinue = 1;
    MavGotoHoldAtCurrentPosition = 2;
    MavGotoHoldAtSpecifiedPosition = 3;
}

// Enumeration of landed detector states
enum MavLandedState uint8 {
    MavLandedStateUndefined = 0;
    MavLandedStateOnGround = 1;
    MavLandedStateInAir = 2;
    MavLandedStateTakeoff = 3;
    MavLandedStateLanding = 4;
}

// Result of mission operation (in a MISSION_ACK message).
enum MavMissionResult uint8 {
    MavMissionAccepted = 0;
    MavMissionError = 1;
    MavMissionUnsupportedFrame = 2;
    MavMissionUnsupported = 3;
    MavMissionNoSpace = 4;
    MavMissionInvalid = 5;
    MavMissionInvalidParam1 = 6;
    MavMissionInvalidParam2 = 7;
    MavMissionInvalidParam3 = 8;
    MavMissionInvalidParam4 = 9;
    MavMissionInvalidParam5X = 10;
    MavMissionInvalidParam6Y = 11;
    MavMissionInvalidParam7 = 12;
    MavMissionInvalidSequence = 13;
    MavMissionDenied = 14;
    MavMissionOperationCancelled = 15;
}

// Type of mission items being requested/sent in mission protocol.
enum MavMissionType uint8 {
    MavMissionTypeMission = 0;
    MavMissionTypeFence = 1;
    MavMissionTypeRally = 2;
    MavMissionTypeAll = 255;
}

// These defines are predefined OR-combined mode flags. There is no need to use values from this enum, but
// it simplifies the use of the mode flags. Note that manual input is enabled in all modes as a safety override.
enum MavMode uint8 {
    MavModePreflight = 0;
    MavModeStabilizeDisarmed = 80;
    MavModeStabilizeArmed = 208;
    MavModeManualDisarmed = 64;
    MavModeManualArmed = 192;
    MavModeGuidedDisarmed = 88;
    MavModeGuidedArmed = 216;
    MavModeAutoDisarmed = 92;
    MavModeAutoArmed = 220;
    MavModeTestDisarmed = 66;
    MavModeTestArmed = 194;
}

// Enumeration of possible mount operation modes. This message is used by obsolete/deprecated gimbal messages.
enum MavMountMode uint32 {
    MavMountModeRetract = 0;
    MavMountModeNeutral = 1;
    MavMountModeMavlinkTargeting = 2;
    MavMountModeRcTargeting = 3;
    MavMountModeGpsPoint = 4;
    MavMountModeSysidTarget = 5;
    MavMountModeHomeLocation = 6;
}

enum MavOdidAuthType uint8 {
    MavOdidAuthTypeNone = 0;
    MavOdidAuthTypeUasIdSignature = 1;
    MavOdidAuthTypeOperatorIdSignature = 2;
    MavOdidAuthTypeMessageSetSignature = 3;
    MavOdidAuthTypeNetworkRemoteId = 4;
    MavOdidAuthTypeSpecificAuthentication = 5;
}

enum MavOdidCategoryEu uint8 {
    MavOdidCategoryEuUndeclared = 0;
    MavOdidCategoryEuOpen = 1;
    MavOdidCategoryEuSpecific = 2;
    MavOdidCategoryEuCertified = 3;
}

enum MavOdidClassificationType uint8 {
    MavOdidClassificationTypeUndeclared = 0;
    MavOdidClassificationTypeEu = 1;
}

enum MavOdidClassEu uint8 {
    MavOdidClassEuUndeclared = 0;
    MavOdidClassEuClass0 = 1;
    MavOdidClassEuClass1 = 2;
    MavOdidClassEuClass2 = 3;
    MavOdidClassEuClass3 = 4;
    MavOdidClassEuClass4 = 5;
    MavOdidClassEuClass5 = 6;
    MavOdidClassEuClass6 = 7;
}

enum MavOdidDescType uint8 {
    MavOdidDescTypeText = 0;
}

enum MavOdidHeightRef uint8 {
    MavOdidHeightRefOverTakeoff = 0;
    MavOdidHeightRefOverGround = 1;
}

enum MavOdidHorAcc uint8 {
    MavOdidHorAccUnknown = 0;
    MavOdidHorAcc10Nm = 1;
    MavOdidHorAcc4Nm = 2;
    MavOdidHorAcc2Nm = 3;
    MavOdidHorAcc1Nm = 4;
    MavOdidHorAcc05Nm = 5;
    MavOdidHorAcc03Nm = 6;
    MavOdidHorAcc01Nm = 7;
    MavOdidHorAcc005Nm = 8;
    MavOdidHorAcc30Meter = 9;
    MavOdidHorAcc10Meter = 10;
    MavOdidHorAcc3Meter = 11;
    MavOdidHorAcc1Meter = 12;
}

enum MavOdidIdType uint8 {
    MavOdidIdTypeNone = 0;
    MavOdidIdTypeSerialNumber = 1;
    MavOdidIdTypeCaaRegistrationId = 2;
    MavOdidIdTypeUtmAssignedUuid = 3;
    MavOdidIdTypeSpecificSessionId = 4;
}

enum MavOdidOperatorIdType uint8 {
    MavOdidOperatorIdTypeCaa = 0;
}

enum MavOdidOperatorLocationType uint8 {
    MavOdidOperatorLocationTypeTakeoff = 0;
    MavOdidOperatorLocationTypeLiveGnss = 1;
    MavOdidOperatorLocationTypeFixed = 2;
}

enum MavOdidSpeedAcc uint8 {
    MavOdidSpeedAccUnknown = 0;
    MavOdidSpeedAcc10MetersPerSecond = 1;
    MavOdidSpeedAcc3MetersPerSecond = 2;
    MavOdidSpeedAcc1MetersPerSecond = 3;
    MavOdidSpeedAcc03MetersPerSecond = 4;
}

enum MavOdidStatus uint8 {
    MavOdidStatusUndeclared = 0;
    MavOdidStatusGround = 1;
    MavOdidStatusAirborne = 2;
    MavOdidStatusEmergency = 3;
}

enum MavOdidTimeAcc uint8 {
    MavOdidTimeAccUnknown = 0;
    MavOdidTimeAcc01Second = 1;
    MavOdidTimeAcc02Second = 2;
    MavOdidTimeAcc03Second = 3;
    MavOdidTimeAcc04Second = 4;
    MavOdidTimeAcc05Second = 5;
    MavOdidTimeAcc06Second = 6;
    MavOdidTimeAcc07Second = 7;
    MavOdidTimeAcc08Second = 8;
    MavOdidTimeAcc09Second = 9;
    MavOdidTimeAcc10Second = 10;
    MavOdidTimeAcc11Second = 11;
    MavOdidTimeAcc12Second = 12;
    MavOdidTimeAcc13Second = 13;
    MavOdidTimeAcc14Second = 14;
    MavOdidTimeAcc15Second = 15;
}

enum MavOdidUaType uint8 {
    MavOdidUaTypeNone = 0;
    MavOdidUaTypeAeroplane = 1;
    MavOdidUaTypeHelicopterOrMultirotor = 2;
    MavOdidUaTypeGyroplane = 3;
    MavOdidUaTypeHybridLift = 4;
    MavOdidUaTypeOrnithopter = 5;
    MavOdidUaTypeGlider = 6;
    MavOdidUaTypeKite = 7;
    MavOdidUaTypeFreeBalloon = 8;
    MavOdidUaTypeCaptiveBalloon = 9;
    MavOdidUaTypeAirship = 10;
    MavOdidUaTypeFreeFallParachute = 11;
    MavOdidUaTypeRocket = 12;
    MavOdidUaTypeTetheredPoweredAircraft = 13;
    MavOdidUaTypeGroundObstacle = 14;
    MavOdidUaTypeOther = 15;
}

enum MavOdidVerAcc uint8 {
    MavOdidVerAccUnknown = 0;
    MavOdidVerAcc150Meter = 1;
    MavOdidVerAcc45Meter = 2;
    MavOdidVerAcc25Meter = 3;
    MavOdidVerAcc10Meter = 4;
    MavOdidVerAcc3Meter = 5;
    MavOdidVerAcc1Meter = 6;
}

// Specifies the datatype of a MAVLink extended parameter.
enum MavParamExtType uint8 {
    MavParamExtTypeUint8 = 1;
    MavParamExtTypeInt8 = 2;
    MavParamExtTypeUint16 = 3;
    MavParamExtTypeInt16 = 4;
    MavParamExtTypeUint32 = 5;
    MavParamExtTypeInt32 = 6;
    MavParamExtTypeUint64 = 7;
    MavParamExtTypeInt64 = 8;
    MavParamExtTypeReal32 = 9;
    MavParamExtTypeReal64 = 10;
    MavParamExtTypeCustom = 11;
}

// Specifies the datatype of a MAVLink parameter.
enum MavParamType uint8 {
    MavParamTypeUint8 = 1;
    MavParamTypeInt8 = 2;
    MavParamTypeUint16 = 3;
    MavParamTypeInt16 = 4;
    MavParamTypeUint32 = 5;
    MavParamTypeInt32 = 6;
    MavParamTypeUint64 = 7;
    MavParamTypeInt64 = 8;
    MavParamTypeReal32 = 9;
    MavParamTypeReal64 = 10;
}

// Power supply status flags (bitmask)
enum MavPowerStatus uint16 {
    MavPowerStatusBrickValid = 1;
    MavPowerStatusServoValid = 2;
    MavPowerStatusUsbConnected = 4;
    MavPowerStatusPeriphOvercurrent = 8;
    MavPowerStatusPeriphHipowerOvercurrent = 16;
    MavPowerStatusChanged = 32;
}

// Bitmask of (optional) autopilot capabilities (64 bit). If a bit is set, the autopilot supports this capability.
enum MavProtocolCapability uint64 {
    MavProtocolCapabilityMissionFloat = 1;
    MavProtocolCapabilityParamFloat = 2;
    MavProtocolCapabilityMissionInt = 4;
    MavProtocolCapabilityCommandInt = 8;
    MavProtocolCapabilityParamUnion = 16;
    MavProtocolCapabilityFtp = 32;
    MavProtocolCapabilitySetAttitudeTarget = 64;
    MavProtocolCapabilitySetPositionTargetLocalNed = 128;
    MavProtocolCapabilitySetPositionTargetGlobalInt = 256;
    MavProtocolCapabilityTerrain = 512;
    MavProtocolCapabilitySetActuatorTarget = 1024;
    MavProtocolCapabilityFlightTermination = 2048;
    MavProtocolCapabilityCompassCalibration = 4096;
    MavProtocolCapabilityMavlink2 = 8192;
    MavProtocolCapabilityMissionFence = 16384;
    MavProtocolCapabilityMissionRally = 32768;
    MavProtocolCapabilityFlightInformation = 65536;
}

// Result from a MAVLink command (MAV_CMD)
enum MavResult uint8 {
    MavResultAccepted = 0;
    MavResultTemporarilyRejected = 1;
    MavResultDenied = 2;
    MavResultUnsupported = 3;
    MavResultFailed = 4;
    MavResultInProgress = 5;
    MavResultCancelled = 6;
}

// The ROI (region of interest) for the vehicle. This can be be used by the vehicle for camera/vehicle attitude
// alignment (see MAV_CMD_NAV_ROI).
enum MavRoi uint32 {
    MavRoiNone = 0;
    MavRoiWpnext = 1;
    MavRoiWpindex = 2;
    MavRoiLocation = 3;
    MavRoiTarget = 4;
}

// Enumeration of sensor orientation, according to its rotations
enum MavSensorOrientation uint8 {
    MavSensorRotationNone = 0;
    MavSensorRotationYaw45 = 1;
    MavSensorRotationYaw90 = 2;
    MavSensorRotationYaw135 = 3;
    MavSensorRotationYaw180 = 4;
    MavSensorRotationYaw225 = 5;
    MavSensorRotationYaw270 = 6;
    MavSensorRotationYaw315 = 7;
    MavSensorRotationRoll180 = 8;
    MavSensorRotationRoll180Yaw45 = 9;
    MavSensorRotationRoll180Yaw90 = 10;
    MavSensorRotationRoll180Yaw135 = 11;
    MavSensorRotationPitch180 = 12;
    MavSensorRotationRoll180Yaw225 = 13;
    MavSensorRotationRoll180Yaw270 = 14;
    MavSensorRotationRoll180Yaw315 = 15;
    MavSensorRotationRoll90 = 16;
    MavSensorRotationRoll90Yaw45 = 17;
    MavSensorRotationRoll90Yaw90 = 18;
    MavSensorRotationRoll90Yaw135 = 19;
    MavSensorRotationRoll270 = 20;
    MavSensorRotationRoll270Yaw45 = 21;
    MavSensorRotationRoll270Yaw90 = 22;
    MavSensorRotationRoll270Yaw135 = 23;
    MavSensorRotationPitch90 = 24;
    MavSensorRotationPitch270 = 25;
    MavSensorRotationPitch180Yaw90 = 26;
    MavSensorRotationPitch180Yaw270 = 27;
    MavSensorRotationRoll90Pitch90 = 28;
    MavSensorRotationRoll180Pitch90 = 29;
    MavSensorRotationRoll270Pitch90 = 30;
    MavSensorRotationRoll90Pitch180 = 31;
    MavSensorRotationRoll270Pitch180 = 32;
    MavSensorRotationRoll90Pitch270 = 33;
    MavSensorRotationRoll180Pitch270 = 34;
    MavSensorRotationRoll270Pitch270 = 35;
    MavSensorRotationRoll90Pitch180Yaw90 = 36;
    MavSensorRotationRoll90Yaw270 = 37;
    MavSensorRotationRoll90Pitch68Yaw293 = 38;
    MavSensorRotationPitch315 = 39;
    MavSensorRotationRoll90Pitch315 = 40;
    MavSensorRotationCustom = 100;
}

// Indicates the severity level, generally used for status messages to indicate their relative urgency. Based
// on RFC-5424 using expanded definitions at: http://www.kiwisyslog.com/kb/info:-syslog-message-levels/.
enum MavSeverity uint8 {
    MavSeverityEmergency = 0;
    MavSeverityAlert = 1;
    MavSeverityCritical = 2;
    MavSeverityError = 3;
    MavSeverityWarning = 4;
    MavSeverityNotice = 5;
    MavSeverityInfo = 6;
    MavSeverityDebug = 7;
}

// These encode the sensors whose status is sent as part of the SYS_STATUS message.
enum MavSysStatusSensor uint32 {
    MavSysStatusSensor3DGyro = 1;
    MavSysStatusSensor3DAccel = 2;
    MavSysStatusSensor3DMag = 4;
    MavSysStatusSensorAbsolutePressure = 8;
    MavSysStatusSensorDifferentialPressure = 16;
    MavSysStatusSensorGps = 32;
    MavSysStatusSensorOpticalFlow = 64;
    MavSysStatusSensorVisionPosition = 128;
    MavSysStatusSensorLaserPosition = 256;
    MavSysStatusSensorExternalGroundTruth = 512;
    MavSysStatusSensorAngularRateControl = 1024;
    MavSysStatusSensorAttitudeStabilization = 2048;
    MavSysStatusSensorYawPosition = 4096;
    MavSysStatusSensorZAltitudeControl = 8192;
    MavSysStatusSensorXyPositionControl = 16384;
    MavSysStatusSensorMotorOutputs = 32768;
    MavSysStatusSensorRcReceiver = 65536;
    MavSysStatusSensor3DGyro2 = 131072;
    MavSysStatusSensor3DAccel2 = 262144;
    MavSysStatusSensor3DMag2 = 524288;
    MavSysStatusGeofence = 1048576;
    MavSysStatusAhrs = 2097152;
    MavSysStatusTerrain = 4194304;
    MavSysStatusReverseMotor = 8388608;
    MavSysStatusLogging = 16777216;
    MavSysStatusSensorBattery = 33554432;
    MavSysStatusSensorProximity = 67108864;
    MavSysStatusSensorSatcom = 134217728;
    MavSysStatusPrearmCheck = 268435456;
    MavSysStatusObstacleAvoidance = 536870912;
    MavSysStatusSensorPropulsion = 1073741824;
}

// These encode the sensors whose status is sent as part of the SYS_STATUS message in the extended fields.
enum MavSysStatusSensorExtended uint32 {
    MavSysStatusRecoverySystem = 1;
}

enum MavTunnelPayloadType uint16 {
    MavTunnelPayloadTypeUnknown = 0;
    MavTunnelPayloadTypeStorm32Reserved0 = 200;
    MavTunnelPayloadTypeStorm32Reserved1 = 201;
    MavTunnelPayloadTypeStorm32Reserved2 = 202;
    MavTunnelPayloadTypeStorm32Reserved3 = 203;
    MavTunnelPayloadTypeStorm32Reserved4 = 204;
    MavTunnelPayloadTypeStorm32Reserved5 = 205;
    MavTunnelPayloadTypeStorm32Reserved6 = 206;
    MavTunnelPayloadTypeStorm32Reserved7 = 207;
    MavTunnelPayloadTypeStorm32Reserved8 = 208;
    MavTunnelPayloadTypeStorm32Reserved9 = 209;
}

// Enumeration of VTOL states
enum MavVtolState uint8 {
    MavVtolStateUndefined = 0;
    MavVtolStateTransitionToFw = 1;
    MavVtolStateTransitionToMc = 2;
    MavVtolStateMc = 3;
    MavVtolStateFw = 4;
}

// Winch status flags used in WINCH_STATUS
enum MavWinchStatusFlag uint32 {
    MavWinchStatusHealthy = 1;
    MavWinchStatusFullyRetracted = 2;
    MavWinchStatusMoving = 4;
    MavWinchStatusClutchEngaged = 8;
}

// Sequence that motors are tested when using MAV_CMD_DO_MOTOR_TEST.
enum MotorTestOrder uint32 {
    MotorTestOrderDefault = 0;
    MotorTestOrderSequence = 1;
    MotorTestOrderBoard = 2;
}

// Defines how throttle value is represented in MAV_CMD_DO_MOTOR_TEST.
enum MotorTestThrottleType uint32 {
    MotorTestThrottlePercent = 0;
    MotorTestThrottlePwm = 1;
    MotorTestThrottlePilot = 2;
    MotorTestCompassCal = 3;
}

enum NavVtolLandOptions uint32 {
    NavVtolLandOptionsDefault = 0;
    NavVtolLandOptionsFwDescent = 1;
    NavVtolLandOptionsHoverDescent = 2;
}

// Yaw behaviour during orbit flight.
enum OrbitYawBehaviour uint32 {
    OrbitYawBehaviourHoldFrontToCircleCenter = 0;
    OrbitYawBehaviourHoldInitialHeading = 1;
    OrbitYawBehaviourUncontrolled = 2;
    OrbitYawBehaviourHoldFrontTangentToCircle = 3;
    OrbitYawBehaviourRcControlled = 4;
}

// Parachute actions. Trigger release and enable/disable auto-release.
enum ParachuteAction uint32 {
    ParachuteDisable = 0;
    ParachuteEnable = 1;
    ParachuteRelease = 2;
}

// Result from PARAM_EXT_SET message (or a PARAM_SET within a transaction).
enum ParamAck uint8 {
    ParamAckAccepted = 0;
    ParamAckValueUnsupported = 1;
    ParamAckFailed = 2;
    ParamAckInProgress = 3;
}

// Bitmap to indicate which dimensions should be ignored by the vehicle: a value of 0b0000000000000000 or
// 0b0000001000000000 indicates that none of the setpoint dimensions should be ignored. If bit 9 is set the
// floats afx afy afz should be interpreted as force instead of acceleration.
enum PositionTargetTypemask uint16 {
    PositionTargetTypemaskXIgnore = 1;
    PositionTargetTypemaskYIgnore = 2;
    PositionTargetTypemaskZIgnore = 4;
    PositionTargetTypemaskVxIgnore = 8;
    PositionTargetTypemaskVyIgnore = 16;
    PositionTargetTypemaskVzIgnore = 32;
    PositionTargetTypemaskAxIgnore = 64;
    PositionTargetTypemaskAyIgnore = 128;
    PositionTargetTypemaskAzIgnore = 256;
    PositionTargetTypemaskForceSet = 512;
    PositionTargetTypemaskYawIgnore = 1024;
    PositionTargetTypemaskYawRateIgnore = 2048;
}

// Precision land modes (used in MAV_CMD_NAV_LAND).
enum PrecisionLandMode uint32 {
    PrecisionLandModeDisabled = 0;
    PrecisionLandModeOpportunistic = 1;
    PrecisionLandModeRequired = 2;
}

// RC type
enum RcType uint32 {
    RcTypeSpektrumDsm2 = 0;
    RcTypeSpektrumDsmx = 1;
}

// RTK GPS baseline coordinate system, used for RTK corrections
enum RtkBaselineCoordinateSystem uint8 {
    RtkBaselineCoordinateSystemEcef = 0;
    RtkBaselineCoordinateSystemNed = 1;
}

// SERIAL_CONTROL device types
enum SerialControlDev uint8 {
    SerialControlDevTelem1 = 0;
    SerialControlDevTelem2 = 1;
    SerialControlDevGps1 = 2;
    SerialControlDevGps2 = 3;
    SerialControlDevShell = 10;
    SerialControlSerial0 = 100;
    SerialControlSerial1 = 101;
    SerialControlSerial2 = 102;
    SerialControlSerial3 = 103;
    SerialControlSerial4 = 104;
    SerialControlSerial5 = 105;
    SerialControlSerial6 = 106;
    SerialControlSerial7 = 107;
    SerialControlSerial8 = 108;
    SerialControlSerial9 = 109;
}

// SERIAL_CONTROL flags (bitmask)
enum SerialControlFlag uint8 {
    SerialControlFlagReply = 1;
    SerialControlFlagRespond = 2;
    SerialControlFlagExclusive = 4;
    SerialControlFlagBlocking = 8;
    SerialControlFlagMulti = 16;
}

// Focus types for MAV_CMD_SET_CAMERA_FOCUS
enum SetFocusType uint32 {
    FocusTypeStep = 0;
    FocusTypeContinuous = 1;
    FocusTypeRange = 2;
    FocusTypeMeters = 3;
    FocusTypeAuto = 4;
    FocusTypeAutoSingle = 5;
    FocusTypeAutoContinuous = 6;
}

// Flags to indicate the status of camera storage.
enum StorageStatus uint8 {
    StorageStatusEmpty = 0;
    StorageStatusUnformatted = 1;
    StorageStatusReady = 2;
    StorageStatusNotSupported = 3;
}

// Flags to indicate the type of storage.
enum StorageType uint8 {
    StorageTypeUnknown = 0;
    StorageTypeUsbStick = 1;
    StorageTypeSd = 2;
    StorageTypeMicrosd = 3;
    StorageTypeCf = 4;
    StorageTypeCfe = 5;
    StorageTypeXqd = 6;
    StorageTypeHd = 7;
    StorageTypeOther = 254;
}

// Flags to indicate usage for a particular storage (see STORAGE_INFORMATION.storage_usage and MAV_CMD_SET_STORAGE_USAGE).
enum StorageUsageFlag uint8 {
    StorageUsageFlagSet = 1;
    StorageUsageFlagPhoto = 2;
    StorageUsageFlagVideo = 4;
    StorageUsageFlagLogs = 8;
}

// Tune formats (used for vehicle buzzer/tone generation).
enum TuneFormat uint32 {
    TuneFormatQbasic11 = 1;
    TuneFormatMmlModern = 2;
}

// Generalized UAVCAN node health
enum UavcanNodeHealth uint8 {
    UavcanNodeHealthOk = 0;
    UavcanNodeHealthWarning = 1;
    UavcanNodeHealthError = 2;
    UavcanNodeHealthCritical = 3;
}

// Generalized UAVCAN node mode
enum UavcanNodeMode uint8 {
    UavcanNodeModeOperational = 0;
    UavcanNodeModeInitialization = 1;
    UavcanNodeModeMaintenance = 2;
    UavcanNodeModeSoftwareUpdate = 3;
    UavcanNodeModeOffline = 7;
}

// Flags for the global position report.
enum UtmDataAvailFlags uint8 {
    UtmDataAvailFlagsTimeValid = 1;
    UtmDataAvailFlagsUasIdAvailable = 2;
    UtmDataAvailFlagsPositionAvailable = 4;
    UtmDataAvailFlagsAltitudeAvailable = 8;
    UtmDataAvailFlagsRelativeAltitudeAvailable = 16;
    UtmDataAvailFlagsHorizontalVeloAvailable = 32;
    UtmDataAvailFlagsVerticalVeloAvailable = 64;
    UtmDataAvailFlagsNextWaypointAvailable = 128;
}

// Airborne status of UAS.
enum UtmFlightState uint8 {
    UtmFlightStateUnknown = 1;
    UtmFlightStateGround = 2;
    UtmFlightStateAirborne = 3;
    UtmFlightStateEmergency = 16;
    UtmFlightStateNoctrl = 32;
}

// Stream status flags (Bitmap)
enum VideoStreamStatusFlags uint16 {
    VideoStreamStatusFlagsRunning = 1;
    VideoStreamStatusFlagsThermal = 2;
}

// Video stream types
enum VideoStreamType uint8 {
    VideoStreamTypeRtsp = 0;
    VideoStreamTypeRtpudp = 1;
    VideoStreamTypeTcpMpeg = 2;
    VideoStreamTypeMpegTsH264 = 3;
}

// Direction of VTOL transition
enum VtolTransitionHeading uint32 {
    VtolTransitionHeadingVehicleDefault = 0;
    VtolTransitionHeadingNextWaypoint = 1;
    VtolTransitionHeadingTakeoff = 2;
    VtolTransitionHeadingSpecified = 3;
    VtolTransitionHeadingAny = 4;
}

// WiFi Mode.
enum WifiConfigApMode int8 {
    WifiConfigApModeUndefined = 0;
    WifiConfigApModeAp = 1;
    WifiConfigApModeStation = 2;
    WifiConfigApModeDisabled = 3;
}

// Possible responses from a WIFI_CONFIG_AP message.
enum WifiConfigApResponse int8 {
    WifiConfigApResponseUndefined = 0;
    WifiConfigApResponseAccepted = 1;
    WifiConfigApResponseRejected = 2;
    WifiConfigApResponseModeError = 3;
    WifiConfigApResponseSsidError = 4;
    WifiConfigApResponsePasswordError = 5;
}

// Winch actions.
enum WinchActions uint32 {
    WinchRelaxed = 0;
    WinchRelativeLengthControl = 1;
    WinchRateControl = 2;
}

message struct ActuatorControlTarget extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Actuator group. The "_mlx" indicates this is a multi-instance message and a MAVLink parser should use
    // this field to difference between instances.
    GroupMlx: uint8;
    // Actuator controls. Normed to -1..+1 where 0 is neutral position. Throttle for single rotation direction
    // motors is 0..1, negative range for reverse direction. Standard mapping for attitude controls (group 0):
    // (index 0-7): roll, pitch, yaw, throttle, flaps, spoilers, airbrakes, landing gear. Load a pass-through
    // mixer to repurpose them as generic outputs.
    @Length(8)
    Controls: float32[];
}

message struct ActuatorOutputStatus extends MessageFrame {
    // Timestamp (since system boot).
    TimeUsec: uint64;
    // Active outputs
    Active: uint32;
    // Servo / motor output array values. Zero values indicate unused channels.
    @Length(32)
    Actuator: float32[];
}

message struct AdsbVehicle extends MessageFrame {
    // ICAO address
    IcaoAddress: uint32;
    // Latitude
    Lat: int32;
    // Longitude
    Lon: int32;
    // ADSB altitude type.
    AltitudeType: AdsbAltitudeType;
    // Altitude(ASL)
    Altitude: int32;
    // Course over ground
    Heading: uint16;
    // The horizontal velocity
    HorVelocity: uint16;
    // The vertical velocity. Positive is up
    VerVelocity: int16;
    // The callsign, 8+null
    @Length(9)
    Callsign: string;
    // ADSB emitter type.
    EmitterType: AdsbEmitterType;
    // Time since last communication in seconds
    Tslc: uint8;
    // Bitmap to indicate various statuses including valid data fields
    Flags: AdsbFlagsBitmask;
    // Squawk code
    Squawk: uint16;
}



message struct Altitude extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // This altitude measure is initialized on system boot and monotonic (it is never reset, but represents the
    // local altitude change). The only guarantee on this field is that it will never be reset and is consistent
    // within a flight. The recommended value for this field is the uncorrected barometric altitude at boot time.
    // This altitude will also drift and vary between flights.
    AltitudeMonotonic: float32;
    // This altitude measure is strictly above mean sea level and might be non-monotonic (it might reset on events
    // like GPS lock or when a new QNH value is set). It should be the altitude to which global altitude waypoints
    // are compared to. Note that it is *not* the GPS altitude, however, most GPS modules already output MSL
    // by default and not the WGS84 altitude.
    AltitudeAmsl: float32;
    // This is the local altitude in the local coordinate frame. It is not the altitude above home, but in reference
    // to the coordinate origin (0, 0, 0). It is up-positive.
    AltitudeLocal: float32;
    // This is the altitude above the home position. It resets on each change of the current home position.
    AltitudeRelative: float32;
    // This is the altitude above terrain. It might be fed by a terrain database or an altimeter. Values smaller
    // than -1000 should be interpreted as unknown.
    AltitudeTerrain: float32;
    // This is not the altitude, but the clear space below the system according to the fused clearance estimate.
    // It generally should max out at the maximum range of e.g. the laser altimeter. It is generally a moving
    // target. A negative value indicates no measurement available.
    BottomClearance: float32;
}

message struct Attitude extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Roll angle (-pi..+pi)
    Roll: float32;
    // Pitch angle (-pi..+pi)
    Pitch: float32;
    // Yaw angle (-pi..+pi)
    Yaw: float32;
    // Roll angular speed
    Rollspeed: float32;
    // Pitch angular speed
    Pitchspeed: float32;
    // Yaw angular speed
    Yawspeed: float32;
}

message struct AttitudeQuaternion extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Quaternion component 1, w (1 in null-rotation)
    Q1: float32;
    // Quaternion component 2, x (0 in null-rotation)
    Q2: float32;
    // Quaternion component 3, y (0 in null-rotation)
    Q3: float32;
    // Quaternion component 4, z (0 in null-rotation)
    Q4: float32;
    // Roll angular speed
    Rollspeed: float32;
    // Pitch angular speed
    Pitchspeed: float32;
    // Yaw angular speed
    Yawspeed: float32;
    AttitudeQuaternion_extensions: Optional<AttitudeQuaternion_extension>;
    }

struct AttitudeQuaternion_extension {
    // Rotation offset by which the attitude quaternion and angular speed vector should be rotated for user display
    // (quaternion with [w, x, y, z] order, zero-rotation is [1, 0, 0, 0], send [0, 0, 0, 0] if field not supported).
    // This field is intended for systems in which the reference attitude may change during flight. For example,
    // tailsitters VTOLs rotate their reference attitude by 90 degrees between hover mode and fixed wing mode,
    // thus repr_offset_q is equal to [1, 0, 0, 0] in hover mode and equal to [0.7071, 0, 0.7071, 0] in fixed
    // wing mode.
    @Length(4)
    ReprOffsetQ: float32[];
}

message struct AttitudeQuaternionCov extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Quaternion components, w, x, y, z (1 0 0 0 is the null-rotation)
    @Length(4)
    Q: float32[];
    // Roll angular speed
    Rollspeed: float32;
    // Pitch angular speed
    Pitchspeed: float32;
    // Yaw angular speed
    Yawspeed: float32;
    // Row-major representation of a 3x3 attitude covariance matrix (states: roll, pitch, yaw; first three entries
    // are the first ROW, next three entries are the second row, etc.). If unknown, assign NaN value to first
    // element in the array.
    @Length(9)
    Covariance: float32[];
}

message struct AttitudeTarget extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Bitmap to indicate which dimensions should be ignored by the vehicle.
    TypeMask: AttitudeTargetTypemaskBitmask;
    // Attitude quaternion (w, x, y, z order, zero-rotation is 1, 0, 0, 0)
    @Length(4)
    Q: float32[];
    // Body roll rate
    BodyRollRate: float32;
    // Body pitch rate
    BodyPitchRate: float32;
    // Body yaw rate
    BodyYawRate: float32;
    // Collective thrust, normalized to 0 .. 1 (-1 .. 1 for vehicles capable of reverse trust)
    Thrust: float32;
}

message struct AttPosMocap extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Attitude quaternion (w, x, y, z order, zero-rotation is 1, 0, 0, 0)
    @Length(4)
    Q: float32[];
    // X position (NED)
    X: float32;
    // Y position (NED)
    Y: float32;
    // Z position (NED)
    Z: float32;
    AttPosMocap_extensions: Optional<AttPosMocap_extension>;
    }

struct AttPosMocap_extension {
    // Row-major representation of a pose 6x6 cross-covariance matrix upper right triangle (states: x, y, z,
    // roll, pitch, yaw; first six entries are the first ROW, next five entries are the second ROW, etc.). If
    // unknown, assign NaN value to first element in the array.
    @Length(21)
    Covariance: float32[];
}

message struct AuthKey extends MessageFrame {
    // key
    @Length(32)
    Key: string;
}



message struct AutopilotVersion extends MessageFrame {
    // Bitmap of capabilities
    Capabilities: MavProtocolCapabilityBitmask;
    // Firmware version number
    FlightSwVersion: uint32;
    // Middleware version number
    MiddlewareSwVersion: uint32;
    // Operating system version number
    OsSwVersion: uint32;
    // HW / board version (last 8 bits should be silicon ID, if any). The first 16 bits of this field specify
    // https://github.com/PX4/PX4-Bootloader/blob/master/board_types.txt
    BoardVersion: uint32;
    // Custom version field, commonly the first 8 bytes of the git hash. This is not an unique identifier, but
    // should allow to identify the commit using the main version number even for very large code bases.
    @Length(8)
    FlightCustomVersion: uint8[];
    // Custom version field, commonly the first 8 bytes of the git hash. This is not an unique identifier, but
    // should allow to identify the commit using the main version number even for very large code bases.
    @Length(8)
    MiddlewareCustomVersion: uint8[];
    // Custom version field, commonly the first 8 bytes of the git hash. This is not an unique identifier, but
    // should allow to identify the commit using the main version number even for very large code bases.
    @Length(8)
    OsCustomVersion: uint8[];
    // ID of the board vendor
    VendorId: uint16;
    // ID of the product
    ProductId: uint16;
    // UID if provided by hardware (see uid2)
    Uid: uint64;
    AutopilotVersion_extensions: Optional<AutopilotVersion_extension>;
    }

struct AutopilotVersion_extension {
    // UID if provided by hardware (supersedes the uid field. If this is non-zero, use this field, otherwise
    // use uid)
    @Length(18)
    Uid2: uint8[];
}

message struct BatteryStatus extends MessageFrame {
    // Battery ID
    Id: uint8;
    // Function of the battery
    BatteryFunction: MavBatteryFunction;
    // Type (chemistry) of the battery
    Type: MavBatteryType;
    // Temperature of the battery. INT16_MAX for unknown temperature.
    Temperature: int16;
    // Battery voltage of cells 1 to 10 (see voltages_ext for cells 11-14). Cells in this field above the valid
    // cell count for this battery should have the UINT16_MAX value. If individual cell voltages are unknown
    // or not measured for this battery, then the overall battery voltage should be filled in cell 0, with all
    // others set to UINT16_MAX. If the voltage of the battery is greater than (UINT16_MAX - 1), then cell 0
    // should be set to (UINT16_MAX - 1), and cell 1 to the remaining voltage. This can be extended to multiple
    // cells if the total voltage is greater than 2 * (UINT16_MAX - 1).
    @Length(10)
    Voltages: uint16[];
    // Battery current, -1: autopilot does not measure the current
    CurrentBattery: int16;
    // Consumed charge, -1: autopilot does not provide consumption estimate
    CurrentConsumed: int32;
    // Consumed energy, -1: autopilot does not provide energy consumption estimate
    EnergyConsumed: int32;
    // Remaining battery energy. Values: [0-100], -1: autopilot does not estimate the remaining battery.
    BatteryRemaining: int8;
    BatteryStatus_extensions: Optional<BatteryStatus_extension>;
    }

struct BatteryStatus_extension {
    // Remaining battery time, 0: autopilot does not provide remaining battery time estimate
    TimeRemaining: int32;
    // State for extent of discharge, provided by autopilot for warning or external reactions
    ChargeState: MavBatteryChargeState;
    // Battery voltages for cells 11 to 14. Cells above the valid cell count for this battery should have a value
    // of 0, where zero indicates not supported (note, this is different than for the voltages field and allows
    // empty byte truncation). If the measured value is 0 then 1 should be sent instead.
    @Length(4)
    VoltagesExt: uint16[];
    // Battery mode. Default (0) is that battery mode reporting is not supported or battery is in normal-use
    // mode.
    Mode: MavBatteryMode;
    // Fault/health indications. These should be set when charge_state is MAV_BATTERY_CHARGE_STATE_FAILED or
    // MAV_BATTERY_CHARGE_STATE_UNHEALTHY (if not, fault reporting is not supported).
    FaultBitmask: MavBatteryFaultBitmask;
}

message struct ButtonChange extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Time of last change of button state.
    LastChangeMs: uint32;
    // Bitmap for state of buttons.
    State: uint8;
}

message struct CameraCaptureStatus extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Current status of image capturing (0: idle, 1: capture in progress, 2: interval set but idle, 3: interval
    // set and capture in progress)
    ImageStatus: uint8;
    // Current status of video capturing (0: idle, 1: capture in progress)
    VideoStatus: uint8;
    // Image capture interval
    ImageInterval: float32;
    // Elapsed time since recording started (0: Not supported/available). A GCS should compute recording time
    // and use non-zero values of this field to correct any discrepancy.
    RecordingTimeMs: uint32;
    // Available storage capacity.
    AvailableCapacity: float32;
    CameraCaptureStatus_extensions: Optional<CameraCaptureStatus_extension>;
    }

struct CameraCaptureStatus_extension {
    // Total number of images captured ('forever', or until reset using MAV_CMD_STORAGE_FORMAT).
    ImageCount: int32;
}



message struct CameraImageCaptured extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Timestamp (time since UNIX epoch) in UTC. 0 for unknown.
    TimeUtc: uint64;
    // Deprecated/unused. Component IDs are used to differentiate multiple cameras.
    CameraId: uint8;
    // Latitude where image was taken
    Lat: int32;
    // Longitude where capture was taken
    Lon: int32;
    // Altitude (MSL) where image was taken
    Alt: int32;
    // Altitude above ground
    RelativeAlt: int32;
    // Quaternion of camera orientation (w, x, y, z order, zero-rotation is 1, 0, 0, 0)
    @Length(4)
    Q: float32[];
    // Zero based index of this image (i.e. a new image will have index CAMERA_CAPTURE_STATUS.image count -1)
    ImageIndex: int32;
    // Boolean indicating success (1) or failure (0) while capturing this image.
    CaptureResult: int8;
    // URL of image taken. Either local storage or http://foo.jpg if camera provides an HTTP interface.
    @Length(205)
    FileUrl: string;
}

message struct CameraInformation extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Name of the camera vendor
    @Length(32)
    VendorName: uint8[];
    // Name of the camera model
    @Length(32)
    ModelName: uint8[];
    // Version of the camera firmware, encoded as: (Dev & 0xff) << 24 | (Patch & 0xff) << 16 | (Minor & 0xff)
    // << 8 | (Major & 0xff)
    FirmwareVersion: uint32;
    // Focal length
    FocalLength: float32;
    // Image sensor size horizontal
    SensorSizeH: float32;
    // Image sensor size vertical
    SensorSizeV: float32;
    // Horizontal image resolution
    ResolutionH: uint16;
    // Vertical image resolution
    ResolutionV: uint16;
    // Reserved for a lens ID
    LensId: uint8;
    // Bitmap of camera capability flags.
    Flags: CameraCapFlagsBitmask;
    // Camera definition version (iteration)
    CamDefinitionVersion: uint16;
    // Camera definition URI (if any, otherwise only basic functions will be available). HTTP- (http://) and
    // MAVLink FTP- (mavlinkftp://) formatted URIs are allowed (and both must be supported by any GCS that implements
    // the Camera Protocol). The definition file may be xz compressed, which will be indicated by the file extension
    // .xml.xz (a GCS that implements the protocol must support decompressing the file).
    @Length(140)
    CamDefinitionUri: string;
}

message struct CameraSettings extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Camera mode
    ModeId: CameraMode;
    CameraSettings_extensions: Optional<CameraSettings_extension>;
    }

struct CameraSettings_extension {
    // Current zoom level (0.0 to 100.0, NaN if not known)
    Zoomlevel: float32;
    // Current focus level (0.0 to 100.0, NaN if not known)
    Focuslevel: float32;
}





message struct CameraTrigger extends MessageFrame {
    // Timestamp for image frame (UNIX Epoch time or time since system boot). The receiving end can infer timestamp
    // format (since 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Image frame sequence
    Seq: uint32;
}

message struct CellularConfig extends MessageFrame {
    // Enable/disable LTE. 0: setting unchanged, 1: disabled, 2: enabled. Current setting when sent back as a
    // response.
    EnableLte: uint8;
    // Enable/disable PIN on the SIM card. 0: setting unchanged, 1: disabled, 2: enabled. Current setting when
    // sent back as a response.
    EnablePin: uint8;
    // PIN sent to the SIM card. Blank when PIN is disabled. Empty when message is sent back as a response.
    @Length(16)
    Pin: string;
    // New PIN when changing the PIN. Blank to leave it unchanged. Empty when message is sent back as a response.
    @Length(16)
    NewPin: string;
    // Name of the cellular APN. Blank to leave it unchanged. Current APN when sent back as a response.
    @Length(32)
    Apn: string;
    // Required PUK code in case the user failed to authenticate 3 times with the PIN. Empty when message is
    // sent back as a response.
    @Length(16)
    Puk: string;
    // Enable/disable roaming. 0: setting unchanged, 1: disabled, 2: enabled. Current setting when sent back
    // as a response.
    Roaming: uint8;
    // Message acceptance response (sent back to GS).
    Response: CellularConfigResponse;
}

message struct CellularStatus extends MessageFrame {
    // Cellular modem status
    Status: CellularStatusFlag;
    // Failure reason when status in in CELLUAR_STATUS_FAILED
    FailureReason: CellularNetworkFailedReason;
    // Cellular network radio type: gsm, cdma, lte...
    Type: CellularNetworkRadioType;
    // Signal quality in percent. If unknown, set to UINT8_MAX
    Quality: uint8;
    // Mobile country code. If unknown, set to UINT16_MAX
    Mcc: uint16;
    // Mobile network code. If unknown, set to UINT16_MAX
    Mnc: uint16;
    // Location area code. If unknown, set to 0
    Lac: uint16;
}

message struct ChangeOperatorControl extends MessageFrame {
    // System the GCS requests control for
    TargetSystem: uint8;
    // 0: request control of this MAV, 1: Release control of this MAV
    ControlRequest: uint8;
    // 0: key as plaintext, 1-255: future, different hashing/encryption variants. The GCS should in general use
    // the safest mode possible initially and then gradually move down the encryption level if it gets a NACK
    // message indicating an encryption mismatch.
    Version: uint8;
    // Password / Key, depending on version plaintext or encrypted. 25 or less characters, NULL terminated. The
    // characters may involve A-Z, a-z, 0-9, and "!?,.-"
    @Length(25)
    Passkey: string;
}

message struct ChangeOperatorControlAck extends MessageFrame {
    // ID of the GCS this message
    GcsSystemId: uint8;
    // 0: request control of this MAV, 1: Release control of this MAV
    ControlRequest: uint8;
    // 0: ACK, 1: NACK: Wrong passkey, 2: NACK: Unsupported passkey encryption method, 3: NACK: Already under
    // control
    Ack: uint8;
}

message struct Collision extends MessageFrame {
    // Collision data source
    Src: MavCollisionSrc;
    // Unique identifier, domain based on src field
    Id: uint32;
    // Action that is being taken to avoid this collision
    Action: MavCollisionAction;
    // How concerned the aircraft is about this collision
    ThreatLevel: MavCollisionThreatLevel;
    // Estimated time until collision occurs
    TimeToMinimumDelta: float32;
    // Closest vertical distance between vehicle and object
    AltitudeMinimumDelta: float32;
    // Closest horizontal distance between vehicle and object
    HorizontalMinimumDelta: float32;
}

message struct CommandAck extends MessageFrame {
    // Command ID (of acknowledged command).
    Command: MavCmd_ID;
    // Result of command.
    Result: MavResult;
    CommandAck_extensions: Optional<CommandAck_extension>;
    }

struct CommandAck_extension {
    // Also used as result_param1, it can be set with an enum containing the errors reasons of why the command
    // was denied, or the progress percentage when result is MAV_RESULT_IN_PROGRESS (UINT8_MAX if the progress
    // is unknown).
    Progress: uint8;
    // Additional parameter of the result, example: which parameter of MAV_CMD_NAV_WAYPOINT caused it to be denied.
    ResultParam2: int32;
    // System ID of the target recipient. This is the ID of the system that sent the command for which this COMMAND_ACK
    // is an acknowledgement.
    TargetSystem: uint8;
    // Component ID of the target recipient. This is the ID of the system that sent the command for which this
    // COMMAND_ACK is an acknowledgement.
    TargetComponent: uint8;
}



message struct CommandInt extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // The coordinate system of the COMMAND.
    Frame: MavFrame;
    // The scheduled action for the mission item.
    Command: MavCmd;
    // Not used.
    Current: uint8;
    // Not used (set 0).
    Autocontinue: uint8;
}

message struct CommandLong extends MessageFrame {
    // System which should execute the command
    TargetSystem: uint8;
    // Component which should execute the command, 0 for all components
    TargetComponent: uint8;
    // Command ID (of command to send).
    Command: MavCmd;
    // 0: First transmission of this command. 1-255: Confirmation transmissions (e.g. for kill command)
    Confirmation: uint8;
}



message struct ControlSystemState extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // X acceleration in body frame
    XAcc: float32;
    // Y acceleration in body frame
    YAcc: float32;
    // Z acceleration in body frame
    ZAcc: float32;
    // X velocity in body frame
    XVel: float32;
    // Y velocity in body frame
    YVel: float32;
    // Z velocity in body frame
    ZVel: float32;
    // X position in local frame
    XPos: float32;
    // Y position in local frame
    YPos: float32;
    // Z position in local frame
    ZPos: float32;
    // Airspeed, set to -1 if unknown
    Airspeed: float32;
    // Variance of body velocity estimate
    @Length(3)
    VelVariance: float32[];
    // Variance in local position
    @Length(3)
    PosVariance: float32[];
    // The attitude, represented as Quaternion
    @Length(4)
    Q: float32[];
    // Angular rate in roll axis
    RollRate: float32;
    // Angular rate in pitch axis
    PitchRate: float32;
    // Angular rate in yaw axis
    YawRate: float32;
}



message struct DataStream extends MessageFrame {
    // The ID of the requested data stream
    StreamId: uint8;
    // The message rate
    MessageRate: uint16;
    // 1 stream is enabled, 0 stream is stopped.
    OnOff: uint8;
}

message struct DataTransmissionHandshake extends MessageFrame {
    // Type of requested/acknowledged data.
    Type: MavlinkDataStreamType;
    // total data size (set on ACK only).
    Size: uint32;
    // Width of a matrix or image.
    Width: uint16;
    // Height of a matrix or image.
    Height: uint16;
    // Number of packets being sent (set on ACK only).
    Packets: uint16;
    // Payload size per packet (normally 253 byte, see DATA field size in message ENCAPSULATED_DATA) (set on
    // ACK only).
    Payload: uint8;
    // JPEG quality. Values: [1-100].
    JpgQuality: uint8;
}

message struct Debug extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // index of debug variable
    Ind: uint8;
    // DEBUG value
    Value: float32;
}

message struct DebugFloatArray extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Name, for human-friendly display in a Ground Control Station
    @Length(10)
    Name: string;
    // Unique ID used to discriminate between arrays
    ArrayId: uint16;
    DebugFloatArray_extensions: Optional<DebugFloatArray_extension>;
    }

struct DebugFloatArray_extension {
    // data
    @Length(58)
    Data: float32[];
}

message struct DebugVect extends MessageFrame {
    // Name
    @Length(10)
    Name: string;
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // x
    X: float32;
    // y
    Y: float32;
    // z
    Z: float32;
}

message struct DistanceSensor extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Minimum distance the sensor can measure
    MinDistance: uint16;
    // Maximum distance the sensor can measure
    MaxDistance: uint16;
    // Current distance reading
    CurrentDistance: uint16;
    // Type of distance sensor.
    Type: MavDistanceSensor;
    // Onboard ID of the sensor
    Id: uint8;
    // Direction the sensor faces. downward-facing: ROTATION_PITCH_270, upward-facing: ROTATION_PITCH_90, backward-facing:
    // ROTATION_PITCH_180, forward-facing: ROTATION_NONE, left-facing: ROTATION_YAW_90, right-facing: ROTATION_YAW_270
    Orientation: MavSensorOrientation;
    // Measurement variance. Max standard deviation is 6cm. UINT8_MAX if unknown.
    Covariance: uint8;
    DistanceSensor_extensions: Optional<DistanceSensor_extension>;
    }

struct DistanceSensor_extension {
    // Horizontal Field of View (angle) where the distance measurement is valid and the field of view is known.
    // Otherwise this is set to 0.
    HorizontalFov: float32;
    // Vertical Field of View (angle) where the distance measurement is valid and the field of view is known.
    // Otherwise this is set to 0.
    VerticalFov: float32;
    // Quaternion of the sensor orientation in vehicle body frame (w, x, y, z order, zero-rotation is 1, 0, 0,
    // 0). Zero-rotation is along the vehicle body x-axis. This field is required if the orientation is set to
    // MAV_SENSOR_ROTATION_CUSTOM. Set it to 0 if invalid."
    @Length(4)
    Quaternion: float32[];
    // Signal quality of the sensor. Specific to each sensor type, representing the relation of the signal strength
    // with the target reflectivity, distance, size or aspect, but normalised as a percentage. 0 = unknown/unset
    // signal quality, 1 = invalid signal, 100 = perfect signal.
    SignalQuality: uint8;
}

message struct EfiStatus extends MessageFrame {
    // EFI health status
    Health: uint8;
    // ECU index
    EcuIndex: float32;
    // RPM
    Rpm: float32;
    // Fuel consumed
    FuelConsumed: float32;
    // Fuel flow rate
    FuelFlow: float32;
    // Engine load
    EngineLoad: float32;
    // Throttle position
    ThrottlePosition: float32;
    // Spark dwell time
    SparkDwellTime: float32;
    // Barometric pressure
    BarometricPressure: float32;
    // Intake manifold pressure(
    IntakeManifoldPressure: float32;
    // Intake manifold temperature
    IntakeManifoldTemperature: float32;
    // Cylinder head temperature
    CylinderHeadTemperature: float32;
    // Ignition timing (Crank angle degrees)
    IgnitionTiming: float32;
    // Injection time
    InjectionTime: float32;
    // Exhaust gas temperature
    ExhaustGasTemperature: float32;
    // Output throttle
    ThrottleOut: float32;
    // Pressure/temperature compensation
    PtCompensation: float32;
}

message struct EncapsulatedData extends MessageFrame {
    // sequence number (starting with 0 on every transmission)
    Seqnr: uint16;
    // image data bytes
    @Length(253)
    Data: uint8[];
}





message struct EstimatorStatus extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Bitmap indicating which EKF outputs are valid.
    Flags: EstimatorStatusFlagsBitmask;
    // Velocity innovation test ratio
    VelRatio: float32;
    // Horizontal position innovation test ratio
    PosHorizRatio: float32;
    // Vertical position innovation test ratio
    PosVertRatio: float32;
    // Magnetometer innovation test ratio
    MagRatio: float32;
    // Height above terrain innovation test ratio
    HaglRatio: float32;
    // True airspeed innovation test ratio
    TasRatio: float32;
    // Horizontal position 1-STD accuracy relative to the EKF local origin
    PosHorizAccuracy: float32;
    // Vertical position 1-STD accuracy relative to the EKF local origin
    PosVertAccuracy: float32;
}



message struct ExtendedSysState extends MessageFrame {
    // The VTOL state if applicable. Is set to MAV_VTOL_STATE_UNDEFINED if UAV is not in VTOL configuration.
    VtolState: MavVtolState;
    // The landed state. Is set to MAV_LANDED_STATE_UNDEFINED if landed state is unknown.
    LandedState: MavLandedState;
}

message struct FenceStatus extends MessageFrame {
    // Breach status (0 if currently inside fence, 1 if outside).
    BreachStatus: uint8;
    // Number of fence breaches.
    BreachCount: uint16;
    // Last breach type.
    BreachType: FenceBreach;
    // Time (since boot) of last breach.
    BreachTime: uint32;
    FenceStatus_extensions: Optional<FenceStatus_extension>;
    }

struct FenceStatus_extension {
    // Active action to prevent fence breach
    BreachMitigation: FenceMitigate;
}

message struct FileTransferProtocol extends MessageFrame {
    // Network ID (0 for broadcast)
    TargetNetwork: uint8;
    // System ID (0 for broadcast)
    TargetSystem: uint8;
    // Component ID (0 for broadcast)
    TargetComponent: uint8;
    // Variable length payload. The length is defined by the remaining message length when subtracting the header
    // and other fields. The entire content of this block is opaque unless you understand any the encoding message_type.
    // The particular encoding used can be extension specific and might not always be documented as part of the
    // mavlink specification.
    @Length(251)
    Payload: uint8[];
}

message struct FlightInformation extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Timestamp at arming (time since UNIX epoch) in UTC, 0 for unknown
    ArmingTimeUtc: uint64;
    // Timestamp at takeoff (time since UNIX epoch) in UTC, 0 for unknown
    TakeoffTimeUtc: uint64;
    // Universally unique identifier (UUID) of flight, should correspond to name of log files
    FlightUuid: uint64;
}

message struct FollowTarget extends MessageFrame {
    // Timestamp (time since system boot).
    Timestamp: uint64;
    // bit positions for tracker reporting capabilities (POS = 0, VEL = 1, ACCEL = 2, ATT + RATES = 3)
    EstCapabilities: uint8;
    // Latitude (WGS84)
    Lat: int32;
    // Longitude (WGS84)
    Lon: int32;
    // Altitude (MSL)
    Alt: float32;
    // target velocity (0,0,0) for unknown
    @Length(3)
    Vel: float32[];
    // linear target acceleration (0,0,0) for unknown
    @Length(3)
    Acc: float32[];
    // (0 0 0 0 for unknown)
    @Length(4)
    AttitudeQ: float32[];
    // (0 0 0 for unknown)
    @Length(3)
    Rates: float32[];
    // eph epv
    @Length(3)
    PositionCov: float32[];
    // button states or switches of a tracker device
    CustomState: uint64;
}

message struct GeneratorStatus extends MessageFrame {
    // Status flags.
    Status: MavGeneratorStatusFlagBitmask;
    // Speed of electrical generator or alternator. UINT16_MAX: field not provided.
    GeneratorSpeed: uint16;
    // Current into/out of battery. Positive for out. Negative for in. NaN: field not provided.
    BatteryCurrent: float32;
    // Current going to the UAV. If battery current not available this is the DC current from the generator.
    // Positive for out. Negative for in. NaN: field not provided
    LoadCurrent: float32;
    // The power being generated. NaN: field not provided
    PowerGenerated: float32;
    // Voltage of the bus seen at the generator, or battery bus if battery bus is controlled by generator and
    // at a different voltage to main bus.
    BusVoltage: float32;
    // The temperature of the rectifier or power converter. INT16_MAX: field not provided.
    RectifierTemperature: int16;
    // The target battery current. Positive for out. Negative for in. NaN: field not provided
    BatCurrentSetpoint: float32;
    // The temperature of the mechanical motor, fuel cell core or generator. INT16_MAX: field not provided.
    GeneratorTemperature: int16;
    // Seconds this generator has run since it was rebooted. UINT32_MAX: field not provided.
    Runtime: uint32;
    // Seconds until this generator requires maintenance. A negative value indicates maintenance is past-due.
    // INT32_MAX: field not provided.
    TimeUntilMaintenance: int32;
}

















message struct GlobalPositionInt extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Latitude, expressed
    Lat: int32;
    // Longitude, expressed
    Lon: int32;
    // Altitude (MSL). Note that virtually all GPS modules provide both WGS84 and MSL.
    Alt: int32;
    // Altitude above ground
    RelativeAlt: int32;
    // Ground X Speed (Latitude, positive north)
    Vx: int16;
    // Ground Y Speed (Longitude, positive east)
    Vy: int16;
    // Ground Z Speed (Altitude, positive down)
    Vz: int16;
    // Vehicle heading (yaw angle), 0.0..359.99 degrees. If unknown, set to: UINT16_MAX
    Hdg: uint16;
}

message struct GlobalPositionIntCov extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Class id of the estimator this estimate originated from.
    EstimatorType: MavEstimatorType;
    // Latitude
    Lat: int32;
    // Longitude
    Lon: int32;
    // Altitude in meters above MSL
    Alt: int32;
    // Altitude above ground
    RelativeAlt: int32;
    // Ground X Speed (Latitude)
    Vx: float32;
    // Ground Y Speed (Longitude)
    Vy: float32;
    // Ground Z Speed (Altitude)
    Vz: float32;
    // Row-major representation of a 6x6 position and velocity 6x6 cross-covariance matrix (states: lat, lon,
    // alt, vx, vy, vz; first six entries are the first ROW, next six entries are the second row, etc.). If unknown,
    // assign NaN value to first element in the array.
    @Length(36)
    Covariance: float32[];
}

message struct GlobalVisionPositionEstimate extends MessageFrame {
    // Timestamp (UNIX time or since system boot)
    Usec: uint64;
    // Global X position
    X: float32;
    // Global Y position
    Y: float32;
    // Global Z position
    Z: float32;
    // Roll angle
    Roll: float32;
    // Pitch angle
    Pitch: float32;
    // Yaw angle
    Yaw: float32;
    GlobalVisionPositionEstimate_extensions: Optional<GlobalVisionPositionEstimate_extension>;
    }

struct GlobalVisionPositionEstimate_extension {
    // Row-major representation of pose 6x6 cross-covariance matrix upper right triangle (states: x_global, y_global,
    // z_global, roll, pitch, yaw; first six entries are the first ROW, next five entries are the second ROW,
    // etc.). If unknown, assign NaN value to first element in the array.
    @Length(21)
    Covariance: float32[];
    // Estimate reset counter. This should be incremented when the estimate resets in any of the dimensions (position,
    // velocity, attitude, angular speed). This is designed to be used when e.g an external SLAM system detects
    // a loop-closure and the estimate jumps.
    ResetCounter: uint8;
}

message struct Gps2Raw extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // GPS fix type.
    FixType: GpsFixType;
    // Latitude (WGS84)
    Lat: int32;
    // Longitude (WGS84)
    Lon: int32;
    // Altitude (MSL). Positive for up.
    Alt: int32;
    // GPS HDOP horizontal dilution of position (unitless * 100). If unknown, set to: UINT16_MAX
    Eph: uint16;
    // GPS VDOP vertical dilution of position (unitless * 100). If unknown, set to: UINT16_MAX
    Epv: uint16;
    // GPS ground speed. If unknown, set to: UINT16_MAX
    Vel: uint16;
    // Course over ground (NOT heading, but direction of movement): 0.0..359.99 degrees. If unknown, set to:
    // UINT16_MAX
    Cog: uint16;
    // Number of satellites visible. If unknown, set to UINT8_MAX
    SatellitesVisible: uint8;
    // Number of DGPS satellites
    DgpsNumch: uint8;
    // Age of DGPS info
    DgpsAge: uint32;
    Gps2Raw_extensions: Optional<Gps2Raw_extension>;
    }

struct Gps2Raw_extension {
    // Yaw in earth frame from north. Use 0 if this GPS does not provide yaw. Use UINT16_MAX if this GPS is configured
    // to provide yaw and is currently unable to provide it. Use 36000 for north.
    Yaw: uint16;
    // Altitude (above WGS84, EGM96 ellipsoid). Positive for up.
    AltEllipsoid: int32;
    // Position uncertainty.
    HAcc: uint32;
    // Altitude uncertainty.
    VAcc: uint32;
    // Speed uncertainty.
    VelAcc: uint32;
    // Heading / track uncertainty
    HdgAcc: uint32;
}

message struct Gps2Rtk extends MessageFrame {
    // Time since boot of last baseline message received.
    TimeLastBaselineMs: uint32;
    // Identification of connected RTK receiver.
    RtkReceiverId: uint8;
    // GPS Week Number of last baseline
    Wn: uint16;
    // GPS Time of Week of last baseline
    Tow: uint32;
    // GPS-specific health report for RTK data.
    RtkHealth: uint8;
    // Rate of baseline messages being received by GPS
    RtkRate: uint8;
    // Current number of sats used for RTK calculation.
    Nsats: uint8;
    // Coordinate system of baseline
    BaselineCoordsType: RtkBaselineCoordinateSystem;
    // Current baseline in ECEF x or NED north component.
    BaselineAMm: int32;
    // Current baseline in ECEF y or NED east component.
    BaselineBMm: int32;
    // Current baseline in ECEF z or NED down component.
    BaselineCMm: int32;
    // Current estimate of baseline accuracy.
    Accuracy: uint32;
    // Current number of integer ambiguity hypotheses.
    IarNumHypotheses: int32;
}

message struct GpsGlobalOrigin extends MessageFrame {
    // Latitude (WGS84)
    Latitude: int32;
    // Longitude (WGS84)
    Longitude: int32;
    // Altitude (MSL). Positive for up.
    Altitude: int32;
    GpsGlobalOrigin_extensions: Optional<GpsGlobalOrigin_extension>;
    }

struct GpsGlobalOrigin_extension {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
}

message struct GpsInjectData extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Data length
    Len: uint8;
    // Raw data (110 is enough for 12 satellites of RTCMv2)
    @Length(110)
    Data: uint8[];
}

message struct GpsInput extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // ID of the GPS for multiple GPS inputs
    GpsId: uint8;
    // Bitmap indicating which GPS input flags fields to ignore. All other fields must be provided.
    IgnoreFlags: GpsInputIgnoreFlagsBitmask;
    // GPS time (from start of GPS week)
    TimeWeekMs: uint32;
    // GPS week number
    TimeWeek: uint16;
    // 0-1: no fix, 2: 2D fix, 3: 3D fix. 4: 3D with DGPS. 5: 3D with RTK
    FixType: uint8;
    // Latitude (WGS84)
    Lat: int32;
    // Longitude (WGS84)
    Lon: int32;
    // Altitude (MSL). Positive for up.
    Alt: float32;
    // GPS HDOP horizontal dilution of position (unitless). If unknown, set to: UINT16_MAX
    Hdop: float32;
    // GPS VDOP vertical dilution of position (unitless). If unknown, set to: UINT16_MAX
    Vdop: float32;
    // GPS velocity in north direction in earth-fixed NED frame
    Vn: float32;
    // GPS velocity in east direction in earth-fixed NED frame
    Ve: float32;
    // GPS velocity in down direction in earth-fixed NED frame
    Vd: float32;
    // GPS speed accuracy
    SpeedAccuracy: float32;
    // GPS horizontal accuracy
    HorizAccuracy: float32;
    // GPS vertical accuracy
    VertAccuracy: float32;
    // Number of satellites visible.
    SatellitesVisible: uint8;
    GpsInput_extensions: Optional<GpsInput_extension>;
    }

struct GpsInput_extension {
    // Yaw of vehicle relative to Earth's North, zero means not available, use 36000 for north
    Yaw: uint16;
}

message struct GpsRawInt extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // GPS fix type.
    FixType: GpsFixType;
    // Latitude (WGS84, EGM96 ellipsoid)
    Lat: int32;
    // Longitude (WGS84, EGM96 ellipsoid)
    Lon: int32;
    // Altitude (MSL). Positive for up. Note that virtually all GPS modules provide the MSL altitude in addition
    // to the WGS84 altitude.
    Alt: int32;
    // GPS HDOP horizontal dilution of position (unitless * 100). If unknown, set to: UINT16_MAX
    Eph: uint16;
    // GPS VDOP vertical dilution of position (unitless * 100). If unknown, set to: UINT16_MAX
    Epv: uint16;
    // GPS ground speed. If unknown, set to: UINT16_MAX
    Vel: uint16;
    // Course over ground (NOT heading, but direction of movement) in degrees * 100, 0.0..359.99 degrees. If
    // unknown, set to: UINT16_MAX
    Cog: uint16;
    // Number of satellites visible. If unknown, set to UINT8_MAX
    SatellitesVisible: uint8;
    GpsRawInt_extensions: Optional<GpsRawInt_extension>;
    }

struct GpsRawInt_extension {
    // Altitude (above WGS84, EGM96 ellipsoid). Positive for up.
    AltEllipsoid: int32;
    // Position uncertainty.
    HAcc: uint32;
    // Altitude uncertainty.
    VAcc: uint32;
    // Speed uncertainty.
    VelAcc: uint32;
    // Heading / track uncertainty
    HdgAcc: uint32;
    // Yaw in earth frame from north. Use 0 if this GPS does not provide yaw. Use UINT16_MAX if this GPS is configured
    // to provide yaw and is currently unable to provide it. Use 36000 for north.
    Yaw: uint16;
}

message struct GpsRtcmData extends MessageFrame {
    // LSB: 1 means message is fragmented, next 2 bits are the fragment ID, the remaining 5 bits are used for
    // the sequence ID. Messages are only to be flushed to the GPS when the entire message has been reconstructed
    // on the autopilot. The fragment ID specifies which order the fragments should be assembled into a buffer,
    // while the sequence ID is used to detect a mismatch between different buffers. The buffer is considered
    // fully reconstructed when either all 4 fragments are present, or all the fragments before the first fragment
    // with a non full payload is received. This management is used to ensure that normal GPS operation doesn't
    // corrupt RTCM data, and to recover from a unreliable transport delivery order.
    Flags: uint8;
    // data length
    Len: uint8;
    // RTCM message (may be fragmented)
    @Length(180)
    Data: uint8[];
}

message struct GpsRtk extends MessageFrame {
    // Time since boot of last baseline message received.
    TimeLastBaselineMs: uint32;
    // Identification of connected RTK receiver.
    RtkReceiverId: uint8;
    // GPS Week Number of last baseline
    Wn: uint16;
    // GPS Time of Week of last baseline
    Tow: uint32;
    // GPS-specific health report for RTK data.
    RtkHealth: uint8;
    // Rate of baseline messages being received by GPS
    RtkRate: uint8;
    // Current number of sats used for RTK calculation.
    Nsats: uint8;
    // Coordinate system of baseline
    BaselineCoordsType: RtkBaselineCoordinateSystem;
    // Current baseline in ECEF x or NED north component.
    BaselineAMm: int32;
    // Current baseline in ECEF y or NED east component.
    BaselineBMm: int32;
    // Current baseline in ECEF z or NED down component.
    BaselineCMm: int32;
    // Current estimate of baseline accuracy.
    Accuracy: uint32;
    // Current number of integer ambiguity hypotheses.
    IarNumHypotheses: int32;
}

message struct GpsStatus extends MessageFrame {
    // Number of satellites visible
    SatellitesVisible: uint8;
    // Global satellite ID
    @Length(20)
    SatellitePrn: uint8[];
    // 0: Satellite not used, 1: used for localization
    @Length(20)
    SatelliteUsed: uint8[];
    // Elevation (0: right on top of receiver, 90: on the horizon) of satellite
    @Length(20)
    SatelliteElevation: uint8[];
    // Direction of satellite, 0: 0 deg, 255: 360 deg.
    @Length(20)
    SatelliteAzimuth: uint8[];
    // Signal to noise ratio of satellite
    @Length(20)
    SatelliteSnr: uint8[];
}

message struct HighresImu extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // X acceleration
    Xacc: float32;
    // Y acceleration
    Yacc: float32;
    // Z acceleration
    Zacc: float32;
    // Angular speed around X axis
    Xgyro: float32;
    // Angular speed around Y axis
    Ygyro: float32;
    // Angular speed around Z axis
    Zgyro: float32;
    // X Magnetic field
    Xmag: float32;
    // Y Magnetic field
    Ymag: float32;
    // Z Magnetic field
    Zmag: float32;
    // Absolute pressure
    AbsPressure: float32;
    // Differential pressure
    DiffPressure: float32;
    // Altitude calculated from pressure
    PressureAlt: float32;
    // Temperature
    Temperature: float32;
    // Bitmap for fields that have updated since last message
    FieldsUpdated: HighresImuUpdatedFlagsBitmask;
    HighresImu_extensions: Optional<HighresImu_extension>;
    }

struct HighresImu_extension {
    // Id. Ids are numbered from 0 and map to IMUs numbered from 1 (e.g. IMU1 will have a message with id=0)
    Id: uint8;
}

message struct HighLatency extends MessageFrame {
    // Bitmap of enabled system modes.
    BaseMode: MavModeFlagBitmask;
    // A bitfield for use for autopilot-specific flags.
    CustomMode: uint32;
    // The landed state. Is set to MAV_LANDED_STATE_UNDEFINED if landed state is unknown.
    LandedState: MavLandedState;
    // roll
    Roll: int16;
    // pitch
    Pitch: int16;
    // heading
    Heading: uint16;
    // throttle (percentage)
    Throttle: int8;
    // heading setpoint
    HeadingSp: int16;
    // Latitude
    Latitude: int32;
    // Longitude
    Longitude: int32;
    // Altitude above mean sea level
    AltitudeAmsl: int16;
    // Altitude setpoint relative to the home position
    AltitudeSp: int16;
    // airspeed
    Airspeed: uint8;
    // airspeed setpoint
    AirspeedSp: uint8;
    // groundspeed
    Groundspeed: uint8;
    // climb rate
    ClimbRate: int8;
    // Number of satellites visible. If unknown, set to UINT8_MAX
    GpsNsat: uint8;
    // GPS Fix type.
    GpsFixType: GpsFixType;
    // Remaining battery (percentage)
    BatteryRemaining: uint8;
    // Autopilot temperature (degrees C)
    Temperature: int8;
    // Air temperature (degrees C) from airspeed sensor
    TemperatureAir: int8;
    // failsafe (each bit represents a failsafe where 0=ok, 1=failsafe active (bit0:RC, bit1:batt, bit2:GPS,
    // bit3:GCS, bit4:fence)
    Failsafe: uint8;
    // current waypoint number
    WpNum: uint8;
    // distance to target
    WpDistance: uint16;
}

message struct HighLatency2 extends MessageFrame {
    // Timestamp (milliseconds since boot or Unix epoch)
    Timestamp: uint32;
    // Type of the MAV (quadrotor, helicopter, etc.)
    Type: MavType;
    // Autopilot type / class. Use MAV_AUTOPILOT_INVALID for components that are not flight controllers.
    Autopilot: MavAutopilot;
    // A bitfield for use for autopilot-specific flags (2 byte version).
    CustomMode: uint16;
    // Latitude
    Latitude: int32;
    // Longitude
    Longitude: int32;
    // Altitude above mean sea level
    Altitude: int16;
    // Altitude setpoint
    TargetAltitude: int16;
    // Heading
    Heading: uint8;
    // Heading setpoint
    TargetHeading: uint8;
    // Distance to target waypoint or position
    TargetDistance: uint16;
    // Throttle
    Throttle: uint8;
    // Airspeed
    Airspeed: uint8;
    // Airspeed setpoint
    AirspeedSp: uint8;
    // Groundspeed
    Groundspeed: uint8;
    // Windspeed
    Windspeed: uint8;
    // Wind heading
    WindHeading: uint8;
    // Maximum error horizontal position since last message
    Eph: uint8;
    // Maximum error vertical position since last message
    Epv: uint8;
    // Air temperature from airspeed sensor
    TemperatureAir: int8;
    // Maximum climb rate magnitude since last message
    ClimbRate: int8;
    // Battery level (-1 if field not provided).
    Battery: int8;
    // Current waypoint number
    WpNum: uint16;
    // Bitmap of failure flags.
    FailureFlags: HlFailureFlagBitmask;
    // Field for custom payload.
    Custom0: int8;
    // Field for custom payload.
    Custom1: int8;
    // Field for custom payload.
    Custom2: int8;
}

message struct HilActuatorControls extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Control outputs -1 .. 1. Channel assignment depends on the simulated hardware.
    @Length(16)
    Controls: float32[];
    // System mode. Includes arming state.
    Mode: MavModeFlagBitmask;
    // Flags as bitfield, 1: indicate simulation using lockstep.
    Flags: uint64;
}

message struct HilControls extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Control output -1 .. 1
    RollAilerons: float32;
    // Control output -1 .. 1
    PitchElevator: float32;
    // Control output -1 .. 1
    YawRudder: float32;
    // Throttle 0 .. 1
    Throttle: float32;
    // Aux 1, -1 .. 1
    Aux1: float32;
    // Aux 2, -1 .. 1
    Aux2: float32;
    // Aux 3, -1 .. 1
    Aux3: float32;
    // Aux 4, -1 .. 1
    Aux4: float32;
    // System mode.
    Mode: MavMode;
    // Navigation mode (MAV_NAV_MODE)
    NavMode: uint8;
}

message struct HilGps extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // 0-1: no fix, 2: 2D fix, 3: 3D fix. Some applications will not use the value of this field unless it is
    // at least two, so always correctly fill in the fix.
    FixType: uint8;
    // Latitude (WGS84)
    Lat: int32;
    // Longitude (WGS84)
    Lon: int32;
    // Altitude (MSL). Positive for up.
    Alt: int32;
    // GPS HDOP horizontal dilution of position (unitless * 100). If unknown, set to: UINT16_MAX
    Eph: uint16;
    // GPS VDOP vertical dilution of position (unitless * 100). If unknown, set to: UINT16_MAX
    Epv: uint16;
    // GPS ground speed. If unknown, set to: UINT16_MAX
    Vel: uint16;
    // GPS velocity in north direction in earth-fixed NED frame
    Vn: int16;
    // GPS velocity in east direction in earth-fixed NED frame
    Ve: int16;
    // GPS velocity in down direction in earth-fixed NED frame
    Vd: int16;
    // Course over ground (NOT heading, but direction of movement), 0.0..359.99 degrees. If unknown, set to:
    // UINT16_MAX
    Cog: uint16;
    // Number of satellites visible. If unknown, set to UINT8_MAX
    SatellitesVisible: uint8;
    HilGps_extensions: Optional<HilGps_extension>;
    }

struct HilGps_extension {
    // GPS ID (zero indexed). Used for multiple GPS inputs
    Id: uint8;
    // Yaw of vehicle relative to Earth's North, zero means not available, use 36000 for north
    Yaw: uint16;
}

message struct HilOpticalFlow extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Sensor ID
    SensorId: uint8;
    // Integration time. Divide integrated_x and integrated_y by the integration time to obtain average flow.
    // The integration time also indicates the.
    IntegrationTimeUs: uint32;
    // Flow in radians around X axis (Sensor RH rotation about the X axis induces a positive flow. Sensor linear
    // motion along the positive Y axis induces a negative flow.)
    IntegratedX: float32;
    // Flow in radians around Y axis (Sensor RH rotation about the Y axis induces a positive flow. Sensor linear
    // motion along the positive X axis induces a positive flow.)
    IntegratedY: float32;
    // RH rotation around X axis
    IntegratedXgyro: float32;
    // RH rotation around Y axis
    IntegratedYgyro: float32;
    // RH rotation around Z axis
    IntegratedZgyro: float32;
    // Temperature
    Temperature: int16;
    // Optical flow quality / confidence. 0: no valid flow, 255: maximum quality
    Quality: uint8;
    // Time since the distance was sampled.
    TimeDeltaDistanceUs: uint32;
    // Distance to the center of the flow field. Positive value (including zero): distance known. Negative value:
    // Unknown distance.
    Distance: float32;
}

message struct HilRcInputsRaw extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // RC channel 1 value
    Chan1Raw: uint16;
    // RC channel 2 value
    Chan2Raw: uint16;
    // RC channel 3 value
    Chan3Raw: uint16;
    // RC channel 4 value
    Chan4Raw: uint16;
    // RC channel 5 value
    Chan5Raw: uint16;
    // RC channel 6 value
    Chan6Raw: uint16;
    // RC channel 7 value
    Chan7Raw: uint16;
    // RC channel 8 value
    Chan8Raw: uint16;
    // RC channel 9 value
    Chan9Raw: uint16;
    // RC channel 10 value
    Chan10Raw: uint16;
    // RC channel 11 value
    Chan11Raw: uint16;
    // RC channel 12 value
    Chan12Raw: uint16;
    // Receive signal strength indicator in device-dependent units/scale. Values: [0-254], UINT8_MAX: invalid/unknown.
    Rssi: uint8;
}

message struct HilSensor extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // X acceleration
    Xacc: float32;
    // Y acceleration
    Yacc: float32;
    // Z acceleration
    Zacc: float32;
    // Angular speed around X axis in body frame
    Xgyro: float32;
    // Angular speed around Y axis in body frame
    Ygyro: float32;
    // Angular speed around Z axis in body frame
    Zgyro: float32;
    // X Magnetic field
    Xmag: float32;
    // Y Magnetic field
    Ymag: float32;
    // Z Magnetic field
    Zmag: float32;
    // Absolute pressure
    AbsPressure: float32;
    // Differential pressure (airspeed)
    DiffPressure: float32;
    // Altitude calculated from pressure
    PressureAlt: float32;
    // Temperature
    Temperature: float32;
    // Bitmap for fields that have updated since last message
    FieldsUpdated: HilSensorUpdatedFlagsBitmask;
    HilSensor_extensions: Optional<HilSensor_extension>;
    }

struct HilSensor_extension {
    // Sensor ID (zero indexed). Used for multiple sensor inputs
    Id: uint8;
}

message struct HilState extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Roll angle
    Roll: float32;
    // Pitch angle
    Pitch: float32;
    // Yaw angle
    Yaw: float32;
    // Body frame roll / phi angular speed
    Rollspeed: float32;
    // Body frame pitch / theta angular speed
    Pitchspeed: float32;
    // Body frame yaw / psi angular speed
    Yawspeed: float32;
    // Latitude
    Lat: int32;
    // Longitude
    Lon: int32;
    // Altitude
    Alt: int32;
    // Ground X Speed (Latitude)
    Vx: int16;
    // Ground Y Speed (Longitude)
    Vy: int16;
    // Ground Z Speed (Altitude)
    Vz: int16;
    // X acceleration
    Xacc: int16;
    // Y acceleration
    Yacc: int16;
    // Z acceleration
    Zacc: int16;
}

message struct HilStateQuaternion extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Vehicle attitude expressed as normalized quaternion in w, x, y, z order (with 1 0 0 0 being the null-rotation)
    @Length(4)
    AttitudeQuaternion: float32[];
    // Body frame roll / phi angular speed
    Rollspeed: float32;
    // Body frame pitch / theta angular speed
    Pitchspeed: float32;
    // Body frame yaw / psi angular speed
    Yawspeed: float32;
    // Latitude
    Lat: int32;
    // Longitude
    Lon: int32;
    // Altitude
    Alt: int32;
    // Ground X Speed (Latitude)
    Vx: int16;
    // Ground Y Speed (Longitude)
    Vy: int16;
    // Ground Z Speed (Altitude)
    Vz: int16;
    // Indicated airspeed
    IndAirspeed: uint16;
    // True airspeed
    TrueAirspeed: uint16;
    // X acceleration
    Xacc: int16;
    // Y acceleration
    Yacc: int16;
    // Z acceleration
    Zacc: int16;
}

message struct HomePosition extends MessageFrame {
    // Latitude (WGS84)
    Latitude: int32;
    // Longitude (WGS84)
    Longitude: int32;
    // Altitude (MSL). Positive for up.
    Altitude: int32;
    // Local X position of this position in the local coordinate frame
    X: float32;
    // Local Y position of this position in the local coordinate frame
    Y: float32;
    // Local Z position of this position in the local coordinate frame
    Z: float32;
    // World to surface normal and heading transformation of the takeoff position. Used to indicate the heading
    // and slope of the ground
    @Length(4)
    Q: float32[];
    // Local X position of the end of the approach vector. Multicopters should set this position based on their
    // takeoff path. Grass-landing fixed wing aircraft should set it the same way as multicopters. Runway-landing
    // fixed wing aircraft should set it to the opposite direction of the takeoff, assuming the takeoff happened
    // from the threshold / touchdown zone.
    ApproachX: float32;
    // Local Y position of the end of the approach vector. Multicopters should set this position based on their
    // takeoff path. Grass-landing fixed wing aircraft should set it the same way as multicopters. Runway-landing
    // fixed wing aircraft should set it to the opposite direction of the takeoff, assuming the takeoff happened
    // from the threshold / touchdown zone.
    ApproachY: float32;
    // Local Z position of the end of the approach vector. Multicopters should set this position based on their
    // takeoff path. Grass-landing fixed wing aircraft should set it the same way as multicopters. Runway-landing
    // fixed wing aircraft should set it to the opposite direction of the takeoff, assuming the takeoff happened
    // from the threshold / touchdown zone.
    ApproachZ: float32;
    HomePosition_extensions: Optional<HomePosition_extension>;
    }

struct HomePosition_extension {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
}

message struct HygrometerSensor extends MessageFrame {
    // Hygrometer ID
    Id: uint8;
    // Temperature
    Temperature: int16;
    // Humidity
    Humidity: uint16;
}

message struct IsbdLinkStatus extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    Timestamp: uint64;
    // Timestamp of the last successful sbd session. The receiving end can infer timestamp format (since 1.1.1970
    // or since system boot) by checking for the magnitude of the number.
    LastHeartbeat: uint64;
    // Number of failed SBD sessions.
    FailedSessions: uint16;
    // Number of successful SBD sessions.
    SuccessfulSessions: uint16;
    // Signal quality equal to the number of bars displayed on the ISU signal strength indicator. Range is 0
    // to 5, where 0 indicates no signal and 5 indicates maximum signal strength.
    SignalQuality: uint8;
    // 1: Ring call pending, 0: No call pending.
    RingPending: uint8;
    // 1: Transmission session pending, 0: No transmission session pending.
    TxSessionPending: uint8;
    // 1: Receiving session pending, 0: No receiving session pending.
    RxSessionPending: uint8;
}

message struct LandingTarget extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // The ID of the target if multiple targets are present
    TargetNum: uint8;
    // Coordinate frame used for following fields.
    Frame: MavFrame;
    // X-axis angular offset of the target from the center of the image
    AngleX: float32;
    // Y-axis angular offset of the target from the center of the image
    AngleY: float32;
    // Distance to the target from the vehicle
    Distance: float32;
    // Size of target along x-axis
    SizeX: float32;
    // Size of target along y-axis
    SizeY: float32;
    LandingTarget_extensions: Optional<LandingTarget_extension>;
    }

struct LandingTarget_extension {
    // X Position of the landing target in MAV_FRAME
    X: float32;
    // Y Position of the landing target in MAV_FRAME
    Y: float32;
    // Z Position of the landing target in MAV_FRAME
    Z: float32;
    // Quaternion of landing target orientation (w, x, y, z order, zero-rotation is 1, 0, 0, 0)
    @Length(4)
    Q: float32[];
    // Type of landing target
    Type: LandingTargetType;
    // Boolean indicating whether the position fields (x, y, z, q, type) contain valid target position information
    // (valid: 1, invalid: 0). Default is 0 (invalid).
    PositionValid: uint8;
}



message struct LocalPositionNed extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // X Position
    X: float32;
    // Y Position
    Y: float32;
    // Z Position
    Z: float32;
    // X Speed
    Vx: float32;
    // Y Speed
    Vy: float32;
    // Z Speed
    Vz: float32;
}

message struct LocalPositionNedCov extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Class id of the estimator this estimate originated from.
    EstimatorType: MavEstimatorType;
    // X Position
    X: float32;
    // Y Position
    Y: float32;
    // Z Position
    Z: float32;
    // X Speed
    Vx: float32;
    // Y Speed
    Vy: float32;
    // Z Speed
    Vz: float32;
    // X Acceleration
    Ax: float32;
    // Y Acceleration
    Ay: float32;
    // Z Acceleration
    Az: float32;
    // Row-major representation of position, velocity and acceleration 9x9 cross-covariance matrix upper right
    // triangle (states: x, y, z, vx, vy, vz, ax, ay, az; first nine entries are the first ROW, next eight entries
    // are the second row, etc.). If unknown, assign NaN value to first element in the array.
    @Length(45)
    Covariance: float32[];
}

message struct LocalPositionNedSystemGlobalOffset extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // X Position
    X: float32;
    // Y Position
    Y: float32;
    // Z Position
    Z: float32;
    // Roll
    Roll: float32;
    // Pitch
    Pitch: float32;
    // Yaw
    Yaw: float32;
}

message struct LoggingAck extends MessageFrame {
    // system ID of the target
    TargetSystem: uint8;
    // component ID of the target
    TargetComponent: uint8;
    // sequence number (must match the one in LOGGING_DATA_ACKED)
    Sequence: uint16;
}

message struct LoggingData extends MessageFrame {
    // system ID of the target
    TargetSystem: uint8;
    // component ID of the target
    TargetComponent: uint8;
    // sequence number (can wrap)
    Sequence: uint16;
    // data length
    Length: uint8;
    // offset into data where first message starts. This can be used for recovery, when a previous message got
    // lost (set to UINT8_MAX if no start exists).
    FirstMessageOffset: uint8;
    // logged data
    @Length(249)
    Data: uint8[];
}

message struct LoggingDataAcked extends MessageFrame {
    // system ID of the target
    TargetSystem: uint8;
    // component ID of the target
    TargetComponent: uint8;
    // sequence number (can wrap)
    Sequence: uint16;
    // data length
    Length: uint8;
    // offset into data where first message starts. This can be used for recovery, when a previous message got
    // lost (set to UINT8_MAX if no start exists).
    FirstMessageOffset: uint8;
    // logged data
    @Length(249)
    Data: uint8[];
}

message struct LogData extends MessageFrame {
    // Log id (from LOG_ENTRY reply)
    Id: uint16;
    // Offset into the log
    Ofs: uint32;
    // Number of bytes (zero for end of log)
    Count: uint8;
    // log data
    @Length(90)
    Data: uint8[];
}

message struct LogEntry extends MessageFrame {
    // Log id
    Id: uint16;
    // Total number of logs
    NumLogs: uint16;
    // High log number
    LastLogNum: uint16;
    // UTC timestamp of log since 1970, or 0 if not available
    TimeUtc: uint32;
    // Size of the log (may be approximate)
    Size: uint32;
}

message struct LogErase extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
}

message struct LogRequestData extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Log id (from LOG_ENTRY reply)
    Id: uint16;
    // Offset into the log
    Ofs: uint32;
    // Number of bytes
    Count: uint32;
}

message struct LogRequestEnd extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
}

message struct LogRequestList extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // First log id (0 for first available)
    Start: uint16;
    // Last log id (0xffff for last available)
    End: uint16;
}

message struct MagCalReport extends MessageFrame {
    // Compass being calibrated.
    CompassId: uint8;
    // Bitmask of compasses being calibrated.
    CalMask: uint8;
    // Calibration Status.
    CalStatus: MagCalStatus;
    // 0=requires a MAV_CMD_DO_ACCEPT_MAG_CAL, 1=saved to parameters.
    Autosaved: uint8;
    // RMS milligauss residuals.
    Fitness: float32;
    // X offset.
    OfsX: float32;
    // Y offset.
    OfsY: float32;
    // Z offset.
    OfsZ: float32;
    // X diagonal (matrix 11).
    DiagX: float32;
    // Y diagonal (matrix 22).
    DiagY: float32;
    // Z diagonal (matrix 33).
    DiagZ: float32;
    // X off-diagonal (matrix 12 and 21).
    OffdiagX: float32;
    // Y off-diagonal (matrix 13 and 31).
    OffdiagY: float32;
    // Z off-diagonal (matrix 32 and 23).
    OffdiagZ: float32;
    MagCalReport_extensions: Optional<MagCalReport_extension>;
    }

struct MagCalReport_extension {
    // Confidence in orientation (higher is better).
    OrientationConfidence: float32;
    // orientation before calibration.
    OldOrientation: MavSensorOrientation;
    // orientation after calibration.
    NewOrientation: MavSensorOrientation;
    // field radius correction factor
    ScaleFactor: float32;
}

message struct ManualControl extends MessageFrame {
    // The system to be controlled.
    Target: uint8;
    // X-axis, normalized to the range [-1000,1000]. A value of INT16_MAX indicates that this axis is invalid.
    // Generally corresponds to forward(1000)-backward(-1000) movement on a joystick and the pitch of a vehicle.
    X: int16;
    // Y-axis, normalized to the range [-1000,1000]. A value of INT16_MAX indicates that this axis is invalid.
    // Generally corresponds to left(-1000)-right(1000) movement on a joystick and the roll of a vehicle.
    Y: int16;
    // Z-axis, normalized to the range [-1000,1000]. A value of INT16_MAX indicates that this axis is invalid.
    // Generally corresponds to a separate slider movement with maximum being 1000 and minimum being -1000 on
    // a joystick and the thrust of a vehicle. Positive values are positive thrust, negative values are negative
    // thrust.
    Z: int16;
    // R-axis, normalized to the range [-1000,1000]. A value of INT16_MAX indicates that this axis is invalid.
    // Generally corresponds to a twisting of the joystick, with counter-clockwise being 1000 and clockwise being
    // -1000, and the yaw of a vehicle.
    R: int16;
    // A bitfield corresponding to the joystick buttons' 0-15 current state, 1 for pressed, 0 for released. The
    // lowest bit corresponds to Button 1.
    Buttons: uint16;
    ManualControl_extensions: Optional<ManualControl_extension>;
    }

struct ManualControl_extension {
    // A bitfield corresponding to the joystick buttons' 16-31 current state, 1 for pressed, 0 for released.
    // The lowest bit corresponds to Button 16.
    Buttons2: uint16;
    // Set bits to 1 to indicate which of the following extension fields contain valid data: bit 0: pitch, bit
    // 1: roll.
    EnabledExtensions: uint8;
    // Pitch-only-axis, normalized to the range [-1000,1000]. Generally corresponds to pitch on vehicles with
    // additional degrees of freedom. Valid if bit 0 of enabled_extensions field is set. Set to 0 if invalid.
    S: int16;
    // Roll-only-axis, normalized to the range [-1000,1000]. Generally corresponds to roll on vehicles with additional
    // degrees of freedom. Valid if bit 1 of enabled_extensions field is set. Set to 0 if invalid.
    T: int16;
}

message struct ManualSetpoint extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Desired roll rate
    Roll: float32;
    // Desired pitch rate
    Pitch: float32;
    // Desired yaw rate
    Yaw: float32;
    // Collective thrust, normalized to 0 .. 1
    Thrust: float32;
    // Flight mode switch position, 0.. 255
    ModeSwitch: uint8;
    // Override mode switch position, 0.. 255
    ManualOverrideSwitch: uint8;
}

struct MavCmdActuatorTest {
    // Output value: 1 means maximum positive output, 0 to center servos or minimum motor thrust (expected to
    // spin), -1 for maximum negative (if not supported by the motors, i.e. motor is not reversible, smaller
    // than 0 maps to NaN). And NaN maps to disarmed (stop the motors).
    Value: float32;
    // Timeout after which the test command expires and the output is restored to the previous value. A timeout
    // has to be set for safety reasons. A timeout of 0 means to restore the previous value immediately.
    Timeout: float32;
    Param3: float32;
    Param4: float32;
    // Actuator Output function
    OutputFunction: ActuatorOutputFunction;
    Param6: float32;
    Param7: float32;
}

struct MavCmdAirframeConfiguration {
    // Landing gear ID (default: 0, -1 for all)
    LandingGearId: float32;
    // Landing gear position (Down: 0, Up: 1, NaN for no change)
    LandingGearPosition: float32;
    Param3: float32;
    Param4: float32;
    Param5: float32;
    Param6: float32;
    Param7: float32;
}

struct MavCmdArmAuthorizationRequest {
    // Vehicle system id, this way ground station can request arm authorization on behalf of any vehicle
    SystemId: float32;
}

abstract extensible struct MavCmdCameraStopTracking {
}

struct MavCmdCameraTrackPoint {
    // Point to track x value (normalized 0..1, 0 is left, 1 is right).
    PointX: float32;
    // Point to track y value (normalized 0..1, 0 is top, 1 is bottom).
    PointY: float32;
    // Point radius (normalized 0..1, 0 is image left, 1 is image right).
    Radius: float32;
}

struct MavCmdCameraTrackRectangle {
    // Top left corner of rectangle x value (normalized 0..1, 0 is left, 1 is right).
    TopLeftCornerX: float32;
    // Top left corner of rectangle y value (normalized 0..1, 0 is top, 1 is bottom).
    TopLeftCornerY: float32;
    // Bottom right corner of rectangle x value (normalized 0..1, 0 is left, 1 is right).
    BottomRightCornerX: float32;
    // Bottom right corner of rectangle y value (normalized 0..1, 0 is top, 1 is bottom).
    BottomRightCornerY: float32;
}

struct MavCmdComponentArmDisarm {
    // 0: disarm, 1: arm
    Arm: float32;
    // 0: arm-disarm unless prevented by safety checks (i.e. when landed), 21196: force arming/disarming (e.g.
    // allow arming to override preflight checks and disarming in flight)
    Force: float32;
}

struct MavCmdConditionChangeAlt {
    // Descent / Ascend rate.
    Rate: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Target Altitude
    Altitude: float32;
}

struct MavCmdConditionDelay {
    // Delay
    Delay: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdConditionDistance {
    // Distance.
    Distance: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdConditionGate {
    // Geometry: 0: orthogonal to path between previous and next waypoint.
    Geometry: float32;
    // Altitude: 0: ignore altitude
    Usealtitude: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Altitude
    Altitude: float32;
}

struct MavCmdConditionLast {
    // Empty
    Param1: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdConditionYaw {
    // target angle, 0 is north
    Angle: float32;
    // angular speed
    AngularSpeed: float32;
    // direction: -1: counter clockwise, 1: clockwise
    Direction: float32;
    // 0: absolute angle, 1: relative offset
    Relative: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdConfigureActuator {
    // Actuator configuration action
    Configuration: ActuatorConfiguration;
    Param2: float32;
    Param3: float32;
    Param4: float32;
    // Actuator Output function
    OutputFunction: ActuatorOutputFunction;
    Param6: float32;
    Param7: float32;
}

struct MavCmdControlHighLatency {
    // Control transmission over high latency telemetry (0: stop, 1: start)
    Enable: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoAdsbOutIdent {
    // Reserved (set to 0)
    Param1: float32;
    // Reserved (set to 0)
    Param2: float32;
    // Reserved (set to 0)
    Param3: float32;
    // Reserved (set to 0)
    Param4: float32;
    // Reserved (set to 0)
    Param5: float32;
    // Reserved (set to 0)
    Param6: float32;
    // Reserved (set to 0)
    Param7: float32;
}

struct MavCmdDoAutotuneEnable {
    // Enable (1: enable, 0:disable).
    Enable: float32;
    // Specify which axis are autotuned. 0 indicates autopilot default settings.
    Axis: AutotuneAxisBitmask;
    // Empty.
    Param3: float32;
    // Empty.
    Param4: float32;
    // Empty.
    Param5: float32;
    // Empty.
    Param6: float32;
    // Empty.
    Param7: float32;
}

struct MavCmdDoChangeAltitude {
    // Altitude.
    Altitude: float32;
    // Frame of new altitude.
    Frame: MavFrame;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoChangeSpeed {
    // Speed type (0=Airspeed, 1=Ground Speed, 2=Climb Speed, 3=Descent Speed)
    SpeedType: float32;
    // Speed (-1 indicates no change)
    Speed: float32;
    // Throttle (-1 indicates no change)
    Throttle: float32;
    // 0: absolute, 1: relative
    Relative: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoControlVideo {
    // Camera ID (-1 for all)
    Id: float32;
    // Transmission: 0: disabled, 1: enabled compressed, 2: enabled raw
    Transmission: float32;
    // Transmission mode: 0: video stream, >0: single images every n seconds
    Interval: float32;
    // Recording: 0: disabled, 1: enabled compressed, 2: enabled raw
    Recording: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoDigicamConfigure {
    // Modes: P, TV, AV, M, Etc.
    Mode: float32;
    // Shutter speed: Divisor number for one second.
    ShutterSpeed: float32;
    // Aperture: F stop number.
    Aperture: float32;
    // ISO number e.g. 80, 100, 200, Etc.
    Iso: float32;
    // Exposure type enumerator.
    Exposure: float32;
    // Command Identity.
    CommandIdentity: float32;
    // Main engine cut-off time before camera trigger. (0 means no cut-off)
    EngineCutOff: float32;
}

struct MavCmdDoDigicamControl {
    // Session control e.g. show/hide lens
    SessionControl: float32;
    // Zoom's absolute position
    ZoomAbsolute: float32;
    // Zooming step value to offset zoom from the current position
    ZoomRelative: float32;
    // Focus Locking, Unlocking or Re-locking
    Focus: float32;
    // Shooting Command
    ShootCommand: float32;
    // Command Identity
    CommandIdentity: float32;
    // Test shot identifier. If set to 1, image will only be captured, but not counted towards internal frame
    // count.
    ShotId: float32;
}

struct MavCmdDoEngineControl {
    // 0: Stop engine, 1:Start Engine
    StartEngine: float32;
    // 0: Warm start, 1:Cold start. Controls use of choke where applicable
    ColdStart: float32;
    // Height delay. This is for commanding engine start only after the vehicle has gained the specified height.
    // Used in VTOL vehicles during takeoff to start engine after the aircraft is off the ground. Zero for no
    // delay.
    HeightDelay: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoFenceEnable {
    // enable? (0=disable, 1=enable, 2=disable_floor_only)
    Enable: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoFlighttermination {
    // Flight termination activated if > 0.5
    Terminate: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoFollow {
    // System ID (of the FOLLOW_TARGET beacon). Send 0 to disable follow-me and return to the default position
    // hold mode.
    SystemId: float32;
    // Reserved
    Param2: float32;
    // Reserved
    Param3: float32;
    // Altitude mode: 0: Keep current altitude, 1: keep altitude difference to target, 2: go to a fixed altitude
    // above home.
    AltitudeMode: float32;
    // Altitude above home. (used if mode=2)
    Altitude: float32;
    // Reserved
    Param6: float32;
    // Time to land in which the MAV should go to the default position hold mode after a message RX timeout.
    TimeToLand: float32;
}

struct MavCmdDoFollowReposition {
    // Camera q1 (where 0 is on the ray from the camera to the tracking device)
    CameraQ1: float32;
    // Camera q2
    CameraQ2: float32;
    // Camera q3
    CameraQ3: float32;
    // Camera q4
    CameraQ4: float32;
    // altitude offset from target
    AltitudeOffset: float32;
    // X offset from target
    XOffset: float32;
    // Y offset from target
    YOffset: float32;
}

struct MavCmdDoGimbalManagerConfigure {
    // Sysid for primary control (0: no one in control, -1: leave unchanged, -2: set itself in control (for missions
    // where the own sysid is still unknown), -3: remove control if currently in control).
    SysidPrimaryControl: float32;
    // Compid for primary control (0: no one in control, -1: leave unchanged, -2: set itself in control (for
    // missions where the own sysid is still unknown), -3: remove control if currently in control).
    CompidPrimaryControl: float32;
    // Sysid for secondary control (0: no one in control, -1: leave unchanged, -2: set itself in control (for
    // missions where the own sysid is still unknown), -3: remove control if currently in control).
    SysidSecondaryControl: float32;
    // Compid for secondary control (0: no one in control, -1: leave unchanged, -2: set itself in control (for
    // missions where the own sysid is still unknown), -3: remove control if currently in control).
    CompidSecondaryControl: float32;
    // Component ID of gimbal device to address (or 1-6 for non-MAVLink gimbal), 0 for all gimbal device components.
    // Send command multiple times for more than one gimbal (but not all gimbals).
    GimbalDeviceId: float32;
}

struct MavCmdDoGimbalManagerPitchyaw {
    // Pitch angle (positive to pitch up, relative to vehicle for FOLLOW mode, relative to world horizon for
    // LOCK mode).
    PitchAngle: float32;
    // Yaw angle (positive to yaw to the right, relative to vehicle for FOLLOW mode, absolute to North for LOCK
    // mode).
    YawAngle: float32;
    // Pitch rate (positive to pitch up).
    PitchRate: float32;
    // Yaw rate (positive to yaw to the right).
    YawRate: float32;
    // Gimbal manager flags to use.
    GimbalManagerFlags: GimbalManagerFlagsBitmask;
    // Component ID of gimbal device to address (or 1-6 for non-MAVLink gimbal), 0 for all gimbal device components.
    // Send command multiple times for more than one gimbal (but not all gimbals).
    GimbalDeviceId: float32;
}

struct MavCmdDoGoAround {
    // Altitude
    Altitude: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoGripper {
    // Gripper instance number.
    Instance: float32;
    // Gripper action to perform.
    Action: GripperActions;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoGuidedLimits {
    // Timeout - maximum time that external controller will be allowed to control vehicle. 0 means no timeout.
    Timeout: float32;
    // Altitude (MSL) min - if vehicle moves below this alt, the command will be aborted and the mission will
    // continue. 0 means no lower altitude limit.
    MinAltitude: float32;
    // Altitude (MSL) max - if vehicle moves above this alt, the command will be aborted and the mission will
    // continue. 0 means no upper altitude limit.
    MaxAltitude: float32;
    // Horizontal move limit - if vehicle moves more than this distance from its location at the moment the command
    // was executed, the command will be aborted and the mission will continue. 0 means no horizontal move limit.
    HorizMoveLimit: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoGuidedMaster {
    // System ID
    SystemId: float32;
    // Component ID
    ComponentId: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoInvertedFlight {
    // Inverted flight. (0=normal, 1=inverted)
    Inverted: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoJump {
    // Sequence number
    Number: float32;
    // Repeat count
    Repeat: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoJumpTag {
    // Target tag to jump to.
    Tag: float32;
    // Repeat count.
    Repeat: float32;
}

struct MavCmdDoLandStart {
    // Empty
    Param1: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoLast {
    // Empty
    Param1: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoMotorTest {
    // Motor instance number (from 1 to max number of motors on the vehicle).
    Instance: float32;
    // Throttle type (whether the Throttle Value in param3 is a percentage, PWM value, etc.)
    ThrottleType: MotorTestThrottleType;
    // Throttle value.
    Throttle: float32;
    // Timeout between tests that are run in sequence.
    Timeout: float32;
    // Motor count. Number of motors to test in sequence: 0/1=one motor, 2= two motors, etc. The Timeout (param4)
    // is used between tests.
    MotorCount: float32;
    // Motor test order.
    TestOrder: MotorTestOrder;
    // Empty
    Param7: float32;
}

struct MavCmdDoMountConfigure {
    // Mount operation mode
    Mode: MavMountMode;
    // stabilize roll? (1 = yes, 0 = no)
    StabilizeRoll: float32;
    // stabilize pitch? (1 = yes, 0 = no)
    StabilizePitch: float32;
    // stabilize yaw? (1 = yes, 0 = no)
    StabilizeYaw: float32;
    // roll input (0 = angle body frame, 1 = angular rate, 2 = angle absolute frame)
    RollInputMode: float32;
    // pitch input (0 = angle body frame, 1 = angular rate, 2 = angle absolute frame)
    PitchInputMode: float32;
    // yaw input (0 = angle body frame, 1 = angular rate, 2 = angle absolute frame)
    YawInputMode: float32;
}

struct MavCmdDoMountControl {
    // pitch depending on mount mode (degrees or degrees/second depending on pitch input).
    Pitch: float32;
    // roll depending on mount mode (degrees or degrees/second depending on roll input).
    Roll: float32;
    // yaw depending on mount mode (degrees or degrees/second depending on yaw input).
    Yaw: float32;
    // altitude depending on mount mode.
    Altitude: float32;
    // latitude, set if appropriate mount mode.
    Latitude: float32;
    // longitude, set if appropriate mount mode.
    Longitude: float32;
    // Mount mode.
    Mode: MavMountMode;
}

struct MavCmdDoMountControlQuat {
    // quaternion param q1, w (1 in null-rotation)
    Q1: float32;
    // quaternion param q2, x (0 in null-rotation)
    Q2: float32;
    // quaternion param q3, y (0 in null-rotation)
    Q3: float32;
    // quaternion param q4, z (0 in null-rotation)
    Q4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoOrbit {
    // Radius of the circle. Positive: orbit clockwise. Negative: orbit counter-clockwise. NaN: Use vehicle default
    // radius, or current radius if already orbiting.
    Radius: float32;
    // Tangential Velocity. NaN: Use vehicle default velocity, or current velocity if already orbiting.
    Velocity: float32;
    // Yaw behavior of the vehicle.
    YawBehavior: OrbitYawBehaviour;
    // Orbit around the centre point for this many radians (i.e. for a three-quarter orbit set 270*Pi/180). 0:
    // Orbit forever. NaN: Use vehicle default, or current value if already orbiting.
    Orbits: float32;
    // Center point latitude (if no MAV_FRAME specified) / X coordinate according to MAV_FRAME. INT32_MAX (or
    // NaN if sent in COMMAND_LONG): Use current vehicle position, or current center if already orbiting.
    Latitude_X: float32;
    // Center point longitude (if no MAV_FRAME specified) / Y coordinate according to MAV_FRAME. INT32_MAX (or
    // NaN if sent in COMMAND_LONG): Use current vehicle position, or current center if already orbiting.
    Longitude_Y: float32;
    // Center point altitude (MSL) (if no MAV_FRAME specified) / Z coordinate according to MAV_FRAME. NaN: Use
    // current vehicle altitude.
    Altitude_Z: float32;
}

struct MavCmdDoParachute {
    // Action
    Action: ParachuteAction;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoPauseContinue {
    // 0: Pause current mission or reposition command, hold current position. 1: Continue mission. A VTOL capable
    // vehicle should enter hover mode (multicopter and VTOL planes). A plane should loiter with the default
    // loiter radius.
    Continue: float32;
    // Reserved
    Param2: float32;
    // Reserved
    Param3: float32;
    // Reserved
    Param4: float32;
    // Reserved
    Param5: float32;
    // Reserved
    Param6: float32;
    // Reserved
    Param7: float32;
}

struct MavCmdDoRallyLand {
    // Break altitude
    Altitude: float32;
    // Landing speed
    Speed: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoRepeatRelay {
    // Relay instance number.
    Instance: float32;
    // Cycle count.
    Count: float32;
    // Cycle time.
    Time: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoRepeatServo {
    // Servo instance number.
    Instance: float32;
    // Pulse Width Modulation.
    Pwm: float32;
    // Cycle count.
    Count: float32;
    // Cycle time.
    Time: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoReposition {
    // Ground speed, less than 0 (-1) for default
    Speed: float32;
    // Bitmask of option flags.
    Bitmask: MavDoRepositionFlagsBitmask;
    // Reserved
    Param3: float32;
    // Yaw heading. NaN to use the current system yaw heading mode (e.g. yaw towards next waypoint, yaw to home,
    // etc.). For planes indicates loiter direction (0: clockwise, 1: counter clockwise)
    Yaw: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Altitude
    Altitude: float32;
}

struct MavCmdDoSetActuator {
    // Actuator 1 value, scaled from [-1 to 1]. NaN to ignore.
    Actuator1: float32;
    // Actuator 2 value, scaled from [-1 to 1]. NaN to ignore.
    Actuator2: float32;
    // Actuator 3 value, scaled from [-1 to 1]. NaN to ignore.
    Actuator3: float32;
    // Actuator 4 value, scaled from [-1 to 1]. NaN to ignore.
    Actuator4: float32;
    // Actuator 5 value, scaled from [-1 to 1]. NaN to ignore.
    Actuator5: float32;
    // Actuator 6 value, scaled from [-1 to 1]. NaN to ignore.
    Actuator6: float32;
    // Index of actuator set (i.e if set to 1, Actuator 1 becomes Actuator 7)
    Index: float32;
}

struct MavCmdDoSetCamTriggDist {
    // Camera trigger distance. 0 to stop triggering.
    Distance: float32;
    // Camera shutter integration time. -1 or 0 to ignore
    Shutter: float32;
    // Trigger camera once immediately. (0 = no trigger, 1 = trigger)
    Trigger: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoSetCamTriggInterval {
    // Camera trigger cycle time. -1 or 0 to ignore.
    TriggerCycle: float32;
    // Camera shutter integration time. Should be less than trigger cycle time. -1 or 0 to ignore.
    ShutterIntegration: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoSetHome {
    // Use current (1=use current location, 0=use specified location)
    UseCurrent: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Yaw angle. NaN to use default heading
    Yaw: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Altitude
    Altitude: float32;
}

struct MavCmdDoSetMissionCurrent {
    // Mission sequence value to set
    Number: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoSetMode {
    // Mode
    Mode: MavMode;
    // Custom mode - this is system specific, please refer to the individual autopilot specifications for details.
    CustomMode: float32;
    // Custom sub mode - this is system specific, please refer to the individual autopilot specifications for
    // details.
    CustomSubmode: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoSetParameter {
    // Parameter number
    Number: float32;
    // Parameter value
    Value: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoSetRelay {
    // Relay instance number.
    Instance: float32;
    // Setting. (1=on, 0=off, others possible depending on system hardware)
    Setting: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoSetReverse {
    // Direction (0=Forward, 1=Reverse)
    Reverse: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoSetRoi {
    // Region of interest mode.
    RoiMode: MavRoi;
    // Waypoint index/ target ID (depends on param 1).
    WpIndex: float32;
    // Region of interest index. (allows a vehicle to manage multiple ROI's)
    RoiIndex: float32;
    // Empty
    Param4: float32;
    // MAV_ROI_WPNEXT: pitch offset from next waypoint, MAV_ROI_LOCATION: latitude
    Param5: float32;
    // MAV_ROI_WPNEXT: roll offset from next waypoint, MAV_ROI_LOCATION: longitude
    Param6: float32;
    // MAV_ROI_WPNEXT: yaw offset from next waypoint, MAV_ROI_LOCATION: altitude
    Param7: float32;
}

struct MavCmdDoSetRoiLocation {
    // Component ID of gimbal device to address (or 1-6 for non-MAVLink gimbal), 0 for all gimbal device components.
    // Send command multiple times for more than one gimbal (but not all gimbals).
    GimbalDeviceId: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Latitude of ROI location
    Latitude: float32;
    // Longitude of ROI location
    Longitude: float32;
    // Altitude of ROI location
    Altitude: float32;
}

struct MavCmdDoSetRoiNone {
    // Component ID of gimbal device to address (or 1-6 for non-MAVLink gimbal), 0 for all gimbal device components.
    // Send command multiple times for more than one gimbal (but not all gimbals).
    GimbalDeviceId: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoSetRoiSysid {
    // System ID
    SystemId: float32;
    // Component ID of gimbal device to address (or 1-6 for non-MAVLink gimbal), 0 for all gimbal device components.
    // Send command multiple times for more than one gimbal (but not all gimbals).
    GimbalDeviceId: float32;
}

struct MavCmdDoSetRoiWpnextOffset {
    // Component ID of gimbal device to address (or 1-6 for non-MAVLink gimbal), 0 for all gimbal device components.
    // Send command multiple times for more than one gimbal (but not all gimbals).
    GimbalDeviceId: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Pitch offset from next waypoint, positive pitching up
    PitchOffset: float32;
    // Roll offset from next waypoint, positive rolling to the right
    RollOffset: float32;
    // Yaw offset from next waypoint, positive yawing to the right
    YawOffset: float32;
}

struct MavCmdDoSetServo {
    // Servo instance number.
    Instance: float32;
    // Pulse Width Modulation.
    Pwm: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdDoTriggerControl {
    // Trigger enable/disable (0 for disable, 1 for start), -1 to ignore
    Enable: float32;
    // 1 to reset the trigger sequence, -1 or 0 to ignore
    Reset: float32;
    // 1 to pause triggering, but without switching the camera off or retracting it. -1 to ignore
    Pause: float32;
}

struct MavCmdDoVtolTransition {
    // The target VTOL state. For normal transitions, only MAV_VTOL_STATE_MC and MAV_VTOL_STATE_FW can be used.
    State: MavVtolState;
    // Force immediate transition to the specified MAV_VTOL_STATE. 1: Force immediate, 0: normal transition.
    // Can be used, for example, to trigger an emergency "Quadchute". Caution: Can be dangerous/damage vehicle,
    // depending on autopilot implementation of this command.
    Immediate: float32;
}

struct MavCmdDoWinch {
    // Winch instance number.
    Instance: float32;
    // Action to perform.
    Action: WinchActions;
    // Length of cable to release (negative to wind).
    Length: float32;
    // Release rate (negative to wind).
    Rate: float32;
    // Empty.
    Param5: float32;
    // Empty.
    Param6: float32;
    // Empty.
    Param7: float32;
}

struct MavCmdFixedMagCalYaw {
    // Yaw of vehicle in earth frame.
    Yaw: float32;
    // CompassMask, 0 for all.
    Compassmask: float32;
    // Latitude.
    Latitude: float32;
    // Longitude.
    Longitude: float32;
    // Empty.
    Param5: float32;
    // Empty.
    Param6: float32;
    // Empty.
    Param7: float32;
}

struct MavCmdGetHomePosition {
    // Reserved
    Param1: float32;
    // Reserved
    Param2: float32;
    // Reserved
    Param3: float32;
    // Reserved
    Param4: float32;
    // Reserved
    Param5: float32;
    // Reserved
    Param6: float32;
    // Reserved
    Param7: float32;
}

struct MavCmdGetMessageInterval {
    // The MAVLink message ID
    MessageId: float32;
}

struct MavCmdIlluminatorOnOff {
    // 0: Illuminators OFF, 1: Illuminators ON
    Enable: float32;
}

struct MavCmdImageStartCapture {
    // Reserved (Set to 0)
    Param1: float32;
    // Desired elapsed time between two consecutive pictures (in seconds). Minimum values depend on hardware
    // (typically greater than 2 seconds).
    Interval: float32;
    // Total number of images to capture. 0 to capture forever/until MAV_CMD_IMAGE_STOP_CAPTURE.
    TotalImages: float32;
    // Capture sequence number starting from 1. This is only valid for single-capture (param3 == 1), otherwise
    // set to 0. Increment the capture ID for each capture command to prevent double captures when a command
    // is re-transmitted.
    SequenceNumber: float32;
    Param5: float32;
    Param6: float32;
    Param7: float32;
}

struct MavCmdImageStopCapture {
    // Reserved (Set to 0)
    Param1: float32;
    Param2: float32;
    Param3: float32;
    Param4: float32;
    Param7: float32;
}

struct MavCmdInjectFailure {
    // The unit which is affected by the failure.
    FailureUnit: FailureUnit;
    // The type how the failure manifests itself.
    FailureType: FailureType;
    // Instance affected by failure (0 to signal all).
    Instance: float32;
}

struct MavCmdJumpTag {
    // Tag.
    Tag: float32;
}

struct MavCmdLoggingStart {
    // Format: 0: ULog
    Format: float32;
    // Reserved (set to 0)
    Param2: float32;
    // Reserved (set to 0)
    Param3: float32;
    // Reserved (set to 0)
    Param4: float32;
    // Reserved (set to 0)
    Param5: float32;
    // Reserved (set to 0)
    Param6: float32;
    // Reserved (set to 0)
    Param7: float32;
}

struct MavCmdLoggingStop {
    // Reserved (set to 0)
    Param1: float32;
    // Reserved (set to 0)
    Param2: float32;
    // Reserved (set to 0)
    Param3: float32;
    // Reserved (set to 0)
    Param4: float32;
    // Reserved (set to 0)
    Param5: float32;
    // Reserved (set to 0)
    Param6: float32;
    // Reserved (set to 0)
    Param7: float32;
}

struct MavCmdMissionStart {
    // first_item: the first mission item to run
    FirstItem: float32;
    // last_item: the last mission item to run (after this item is run, the mission ends)
    LastItem: float32;
}

struct MavCmdNavContinueAndChangeAlt {
    // Climb or Descend (0 = Neutral, command completes when within 5m of this command's altitude, 1 = Climbing,
    // command completes when at or above this command's altitude, 2 = Descending, command completes when at
    // or below this command's altitude.
    Action: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Desired altitude
    Altitude: float32;
}

struct MavCmdNavDelay {
    // Delay (-1 to enable time-of-day fields)
    Delay: float32;
    // hour (24h format, UTC, -1 to ignore)
    Hour: float32;
    // minute (24h format, UTC, -1 to ignore)
    Minute: float32;
    // second (24h format, UTC, -1 to ignore)
    Second: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdNavFenceCircleExclusion {
    // Radius.
    Radius: float32;
    // Reserved
    Param2: float32;
    // Reserved
    Param3: float32;
    // Reserved
    Param4: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Reserved
    Param7: float32;
}

struct MavCmdNavFenceCircleInclusion {
    // Radius.
    Radius: float32;
    // Vehicle must be inside ALL inclusion zones in a single group, vehicle must be inside at least one group
    InclusionGroup: float32;
    // Reserved
    Param3: float32;
    // Reserved
    Param4: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Reserved
    Param7: float32;
}

struct MavCmdNavFencePolygonVertexExclusion {
    // Polygon vertex count
    VertexCount: float32;
    // Reserved
    Param2: float32;
    // Reserved
    Param3: float32;
    // Reserved
    Param4: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Reserved
    Param7: float32;
}

struct MavCmdNavFencePolygonVertexInclusion {
    // Polygon vertex count
    VertexCount: float32;
    // Vehicle must be inside ALL inclusion zones in a single group, vehicle must be inside at least one group,
    // must be the same for all points in each polygon
    InclusionGroup: float32;
    // Reserved
    Param3: float32;
    // Reserved
    Param4: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Reserved
    Param7: float32;
}

struct MavCmdNavFenceReturnPoint {
    // Reserved
    Param1: float32;
    // Reserved
    Param2: float32;
    // Reserved
    Param3: float32;
    // Reserved
    Param4: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Altitude
    Altitude: float32;
}

struct MavCmdNavFollow {
    // Following logic to use (e.g. loitering or sinusoidal following) - depends on specific autopilot implementation
    Following: float32;
    // Ground speed of vehicle to be followed
    GroundSpeed: float32;
    // Radius around waypoint. If positive loiter clockwise, else counter-clockwise
    Radius: float32;
    // Desired yaw angle.
    Yaw: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Altitude
    Altitude: float32;
}

struct MavCmdNavGuidedEnable {
    // On / Off (> 0.5f on)
    Enable: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdNavLand {
    // Minimum target altitude if landing is aborted (0 = undefined/use system default).
    AbortAlt: float32;
    // Precision land mode.
    LandMode: PrecisionLandMode;
    // Empty.
    Param3: float32;
    // Desired yaw angle. NaN to use the current system yaw heading mode (e.g. yaw towards next waypoint, yaw
    // to home, etc.).
    YawAngle: float32;
    // Latitude.
    Latitude: float32;
    // Longitude.
    Longitude: float32;
    // Landing altitude (ground level in current frame).
    Altitude: float32;
}

struct MavCmdNavLandLocal {
    // Landing target number (if available)
    Target: float32;
    // Maximum accepted offset from desired landing position - computed magnitude from spherical coordinates:
    // d = sqrt(x^2 + y^2 + z^2), which gives the maximum accepted distance between the desired landing position
    // and the position where the vehicle is about to land
    Offset: float32;
    // Landing descend rate
    DescendRate: float32;
    // Desired yaw angle
    Yaw: float32;
    // Y-axis position
    YPosition: float32;
    // X-axis position
    XPosition: float32;
    // Z-axis / ground level position
    ZPosition: float32;
}

struct MavCmdNavLast {
    // Empty
    Param1: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdNavLoiterTime {
    // Loiter time (only starts once Lat, Lon and Alt is reached).
    Time: float32;
    // Leave loiter circle only once heading towards the next waypoint (0 = False)
    HeadingRequired: float32;
    // Loiter radius around waypoint for forward-only moving vehicles (not multicopters). If positive loiter
    // clockwise, else counter-clockwise.
    Radius: float32;
    // Loiter circle exit location and/or path to next waypoint ("xtrack") for forward-only moving vehicles (not
    // multicopters). 0 for the vehicle to converge towards the center xtrack when it leaves the loiter (the
    // line between the centers of the current and next waypoint), 1 to converge to the direct line between the
    // location that the vehicle exits the loiter radius and the next waypoint. Otherwise the angle (in degrees)
    // between the tangent of the loiter circle and the center xtrack at which the vehicle must leave the loiter
    // (and converge to the center xtrack). NaN to use the current system default xtrack behaviour.
    XtrackLocation: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Altitude
    Altitude: float32;
}

struct MavCmdNavLoiterToAlt {
    // Leave loiter circle only once heading towards the next waypoint (0 = False)
    HeadingRequired: float32;
    // Loiter radius around waypoint for forward-only moving vehicles (not multicopters). If positive loiter
    // clockwise, negative counter-clockwise, 0 means no change to standard loiter.
    Radius: float32;
    // Empty
    Param3: float32;
    // Loiter circle exit location and/or path to next waypoint ("xtrack") for forward-only moving vehicles (not
    // multicopters). 0 for the vehicle to converge towards the center xtrack when it leaves the loiter (the
    // line between the centers of the current and next waypoint), 1 to converge to the direct line between the
    // location that the vehicle exits the loiter radius and the next waypoint. Otherwise the angle (in degrees)
    // between the tangent of the loiter circle and the center xtrack at which the vehicle must leave the loiter
    // (and converge to the center xtrack). NaN to use the current system default xtrack behaviour.
    XtrackLocation: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Altitude
    Altitude: float32;
}

struct MavCmdNavLoiterTurns {
    // Number of turns.
    Turns: float32;
    // Leave loiter circle only once heading towards the next waypoint (0 = False)
    HeadingRequired: float32;
    // Loiter radius around waypoint for forward-only moving vehicles (not multicopters). If positive loiter
    // clockwise, else counter-clockwise
    Radius: float32;
    // Loiter circle exit location and/or path to next waypoint ("xtrack") for forward-only moving vehicles (not
    // multicopters). 0 for the vehicle to converge towards the center xtrack when it leaves the loiter (the
    // line between the centers of the current and next waypoint), 1 to converge to the direct line between the
    // location that the vehicle exits the loiter radius and the next waypoint. Otherwise the angle (in degrees)
    // between the tangent of the loiter circle and the center xtrack at which the vehicle must leave the loiter
    // (and converge to the center xtrack). NaN to use the current system default xtrack behaviour.
    XtrackLocation: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Altitude
    Altitude: float32;
}

struct MavCmdNavLoiterUnlim {
    // Empty
    Param1: float32;
    // Empty
    Param2: float32;
    // Loiter radius around waypoint for forward-only moving vehicles (not multicopters). If positive loiter
    // clockwise, else counter-clockwise
    Radius: float32;
    // Desired yaw angle. NaN to use the current system yaw heading mode (e.g. yaw towards next waypoint, yaw
    // to home, etc.).
    Yaw: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Altitude
    Altitude: float32;
}

struct MavCmdNavPathplanning {
    // 0: Disable local obstacle avoidance / local path planning (without resetting map), 1: Enable local path
    // planning, 2: Enable and reset local path planning
    LocalCtrl: float32;
    // 0: Disable full path planning (without resetting map), 1: Enable, 2: Enable and reset map/occupancy grid,
    // 3: Enable and reset planned route, but not occupancy grid
    GlobalCtrl: float32;
    // Empty
    Param3: float32;
    // Yaw angle at goal
    Yaw: float32;
    // Latitude/X of goal
    Latitude_X: float32;
    // Longitude/Y of goal
    Longitude_Y: float32;
    // Altitude/Z of goal
    Altitude_Z: float32;
}

struct MavCmdNavPayloadPlace {
    // Maximum distance to descend.
    MaxDescent: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Altitude
    Altitude: float32;
}

struct MavCmdNavRallyPoint {
    // Reserved
    Param1: float32;
    // Reserved
    Param2: float32;
    // Reserved
    Param3: float32;
    // Reserved
    Param4: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Altitude
    Altitude: float32;
}

struct MavCmdNavReturnToLaunch {
    // Empty
    Param1: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdNavRoi {
    // Region of interest mode.
    RoiMode: MavRoi;
    // Waypoint index/ target ID. (see MAV_ROI enum)
    WpIndex: float32;
    // ROI index (allows a vehicle to manage multiple ROI's)
    RoiIndex: float32;
    // Empty
    Param4: float32;
    // x the location of the fixed ROI (see MAV_FRAME)
    X: float32;
    // y
    Y: float32;
    // z
    Z: float32;
}

struct MavCmdNavSetYawSpeed {
    // Yaw angle to adjust steering by.
    Yaw: float32;
    // Speed.
    Speed: float32;
    // Final angle. (0=absolute, 1=relative)
    Angle: float32;
    // Empty
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdNavSplineWaypoint {
    // Hold time. (ignored by fixed wing, time to stay at waypoint for rotary wing)
    Hold: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Empty
    Param4: float32;
    // Latitude/X of goal
    Latitude_X: float32;
    // Longitude/Y of goal
    Longitude_Y: float32;
    // Altitude/Z of goal
    Altitude_Z: float32;
}

struct MavCmdNavTakeoff {
    // Minimum pitch (if airspeed sensor present), desired pitch without sensor
    Pitch: float32;
    // Empty
    Param2: float32;
    // Empty
    Param3: float32;
    // Yaw angle (if magnetometer present), ignored without magnetometer. NaN to use the current system yaw heading
    // mode (e.g. yaw towards next waypoint, yaw to home, etc.).
    Yaw: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Altitude
    Altitude: float32;
}

struct MavCmdNavTakeoffLocal {
    // Minimum pitch (if airspeed sensor present), desired pitch without sensor
    Pitch: float32;
    // Empty
    Param2: float32;
    // Takeoff ascend rate
    AscendRate: float32;
    // Yaw angle (if magnetometer or another yaw estimation source present), ignored without one of these
    Yaw: float32;
    // Y-axis position
    YPosition: float32;
    // X-axis position
    XPosition: float32;
    // Z-axis position
    ZPosition: float32;
}

struct MavCmdNavVtolLand {
    // Landing behaviour.
    LandOptions: NavVtolLandOptions;
    // Empty
    Param2: float32;
    // Approach altitude (with the same reference as the Altitude field). NaN if unspecified.
    ApproachAltitude: float32;
    // Yaw angle. NaN to use the current system yaw heading mode (e.g. yaw towards next waypoint, yaw to home,
    // etc.).
    Yaw: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Altitude (ground level) relative to the current coordinate frame. NaN to use system default landing altitude
    // (ignore value).
    GroundAltitude: float32;
}

struct MavCmdNavVtolTakeoff {
    // Empty
    Param1: float32;
    // Front transition heading.
    TransitionHeading: VtolTransitionHeading;
    // Empty
    Param3: float32;
    // Yaw angle. NaN to use the current system yaw heading mode (e.g. yaw towards next waypoint, yaw to home,
    // etc.).
    YawAngle: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Altitude
    Altitude: float32;
}

struct MavCmdNavWaypoint {
    // Hold time. (ignored by fixed wing, time to stay at waypoint for rotary wing)
    Hold: float32;
    // Acceptance radius (if the sphere with this radius is hit, the waypoint counts as reached)
    AcceptRadius: float32;
    // 0 to pass through the WP, if > 0 radius to pass by WP. Positive value for clockwise orbit, negative value
    // for counter-clockwise orbit. Allows trajectory control.
    PassRadius: float32;
    // Desired yaw angle at waypoint (rotary wing). NaN to use the current system yaw heading mode (e.g. yaw
    // towards next waypoint, yaw to home, etc.).
    Yaw: float32;
    // Latitude
    Latitude: float32;
    // Longitude
    Longitude: float32;
    // Altitude
    Altitude: float32;
}

struct MavCmdObliqueSurvey {
    // Camera trigger distance. 0 to stop triggering.
    Distance: float32;
    // Camera shutter integration time. 0 to ignore
    Shutter: float32;
    // The minimum interval in which the camera is capable of taking subsequent pictures repeatedly. 0 to ignore.
    MinInterval: float32;
    // Total number of roll positions at which the camera will capture photos (images captures spread evenly
    // across the limits defined by param5).
    Positions: float32;
    // Angle limits that the camera can be rolled to left and right of center.
    RollAngle: float32;
    // Fixed pitch angle that the camera will hold in oblique mode if the mount is actuated in the pitch axis.
    PitchAngle: float32;
    // Empty
    Param7: float32;
}

struct MavCmdOverrideGoto {
    // MAV_GOTO_DO_HOLD: pause mission and either hold or move to specified position (depending on param2), MAV_GOTO_DO_CONTINUE:
    // resume mission.
    Continue: MavGoto;
    // MAV_GOTO_HOLD_AT_CURRENT_POSITION: hold at current position, MAV_GOTO_HOLD_AT_SPECIFIED_POSITION: hold
    // at specified position.
    Position: MavGoto;
    // Coordinate frame of hold point.
    Frame: MavFrame;
    // Desired yaw angle.
    Yaw: float32;
    // Latitude/X position.
    Latitude_X: float32;
    // Longitude/Y position.
    Longitude_Y: float32;
    // Altitude/Z position.
    Altitude_Z: float32;
}

struct MavCmdPanoramaCreate {
    // Viewing angle horizontal of the panorama (+- 0.5 the total angle)
    HorizontalAngle: float32;
    // Viewing angle vertical of panorama.
    VerticalAngle: float32;
    // Speed of the horizontal rotation.
    HorizontalSpeed: float32;
    // Speed of the vertical rotation.
    VerticalSpeed: float32;
}

struct MavCmdPayloadControlDeploy {
    // Operation mode. 0: Abort deployment, continue normal mission. 1: switch to payload deployment mode. 100:
    // delete first payload deployment request. 101: delete all payload deployment requests.
    OperationMode: float32;
    // Reserved
    Param2: float32;
    // Reserved
    Param3: float32;
    // Reserved
    Param4: float32;
    // Reserved
    Param5: float32;
    // Reserved
    Param6: float32;
    // Reserved
    Param7: float32;
}

struct MavCmdPayloadPrepareDeploy {
    // Operation mode. 0: prepare single payload deploy (overwriting previous requests), but do not execute it.
    // 1: execute payload deploy immediately (rejecting further deploy commands during execution, but allowing
    // abort). 2: add payload deploy to existing deployment list.
    OperationMode: float32;
    // Desired approach vector in compass heading. A negative value indicates the system can define the approach
    // vector at will.
    ApproachVector: float32;
    // Desired ground speed at release time. This can be overridden by the airframe in case it needs to meet
    // minimum airspeed. A negative value indicates the system can define the ground speed at will.
    GroundSpeed: float32;
    // Minimum altitude clearance to the release position. A negative value indicates the system can define the
    // clearance at will.
    AltitudeClearance: float32;
    // Latitude. Note, if used in MISSION_ITEM (deprecated) the units are degrees (unscaled)
    Latitude: float32;
    // Longitude. Note, if used in MISSION_ITEM (deprecated) the units are degrees (unscaled)
    Longitude: float32;
    // Altitude (MSL)
    Altitude: float32;
}

struct MavCmdPreflightCalibration {
    // 1: gyro calibration, 3: gyro temperature calibration
    GyroTemperature: float32;
    // 1: magnetometer calibration
    Magnetometer: float32;
    // 1: ground pressure calibration
    GroundPressure: float32;
    // 1: radio RC calibration, 2: RC trim calibration
    RemoteControl: float32;
    // 1: accelerometer calibration, 2: board level calibration, 3: accelerometer temperature calibration, 4:
    // simple accelerometer calibration
    Accelerometer: float32;
    // 1: APM: compass/motor interference calibration (PX4: airspeed calibration, deprecated), 2: airspeed calibration
    CompmotOrAirspeed: float32;
    // 1: ESC calibration, 3: barometer temperature calibration
    EscOrBaro: float32;
}

struct MavCmdPreflightRebootShutdown {
    // 0: Do nothing for autopilot, 1: Reboot autopilot, 2: Shutdown autopilot, 3: Reboot autopilot and keep
    // it in the bootloader until upgraded.
    Autopilot: float32;
    // 0: Do nothing for onboard computer, 1: Reboot onboard computer, 2: Shutdown onboard computer, 3: Reboot
    // onboard computer and keep it in the bootloader until upgraded.
    Companion: float32;
    // 0: Do nothing for component, 1: Reboot component, 2: Shutdown component, 3: Reboot component and keep
    // it in the bootloader until upgraded
    ComponentAction: float32;
    // MAVLink Component ID targeted in param3 (0 for all components).
    ComponentId: float32;
    // Reserved (set to 0)
    Param5: float32;
    // Reserved (set to 0)
    Param6: float32;
    // WIP: ID (e.g. camera ID -1 for all IDs)
    Param7: float32;
}

struct MavCmdPreflightSetSensorOffsets {
    // Sensor to adjust the offsets for: 0: gyros, 1: accelerometer, 2: magnetometer, 3: barometer, 4: optical
    // flow, 5: second magnetometer, 6: third magnetometer
    SensorType: float32;
    // X axis offset (or generic dimension 1), in the sensor's raw units
    XOffset: float32;
    // Y axis offset (or generic dimension 2), in the sensor's raw units
    YOffset: float32;
    // Z axis offset (or generic dimension 3), in the sensor's raw units
    ZOffset: float32;
    // Generic dimension 4, in the sensor's raw units
    FourthDimension: float32;
    // Generic dimension 5, in the sensor's raw units
    FifthDimension: float32;
    // Generic dimension 6, in the sensor's raw units
    SixthDimension: float32;
}

struct MavCmdPreflightStorage {
    // Parameter storage: 0: READ FROM FLASH/EEPROM, 1: WRITE CURRENT TO FLASH/EEPROM, 2: Reset to defaults,
    // 3: Reset sensor calibration parameter data to factory default (or firmware default if not available)
    ParameterStorage: float32;
    // Mission storage: 0: READ FROM FLASH/EEPROM, 1: WRITE CURRENT TO FLASH/EEPROM, 2: Reset to defaults
    MissionStorage: float32;
    // Onboard logging: 0: Ignore, 1: Start default rate logging, -1: Stop logging, > 1: logging rate (e.g. set
    // to 1000 for 1000 Hz logging)
    LoggingRate: float32;
    // Reserved
    Param4: float32;
    // Empty
    Param5: float32;
    // Empty
    Param6: float32;
    // Empty
    Param7: float32;
}

struct MavCmdPreflightUavcan {
    // 1: Trigger actuator ID assignment and direction mapping. 0: Cancel command.
    ActuatorId: float32;
    // Reserved
    Param2: float32;
    // Reserved
    Param3: float32;
    // Reserved
    Param4: float32;
    // Reserved
    Param5: float32;
    // Reserved
    Param6: float32;
    // Reserved
    Param7: float32;
}

struct MavCmdRequestAutopilotCapabilities {
    // 1: Request autopilot version
    Version: float32;
    // Reserved (all remaining params)
    Param2: float32;
}

struct MavCmdRequestCameraCaptureStatus {
    // 0: No Action 1: Request camera capture status
    CaptureStatus: float32;
    // Reserved (all remaining params)
    Param2: float32;
}

struct MavCmdRequestCameraImageCapture {
    // Sequence number for missing CAMERA_IMAGE_CAPTURED message
    Number: float32;
    Param2: float32;
    Param3: float32;
    Param4: float32;
    Param7: float32;
}

struct MavCmdRequestCameraInformation {
    // 0: No action 1: Request camera capabilities
    Capabilities: float32;
    // Reserved (all remaining params)
    Param2: float32;
}

struct MavCmdRequestCameraSettings {
    // 0: No Action 1: Request camera settings
    Settings: float32;
    // Reserved (all remaining params)
    Param2: float32;
}

struct MavCmdRequestFlightInformation {
    // 1: Request flight information
    FlightInformation: float32;
    // Reserved (all remaining params)
    Param2: float32;
}

struct MavCmdRequestMessage {
    // The MAVLink message ID of the requested message.
    MessageId: float32;
    // Use for index ID, if required. Otherwise, the use of this parameter (if any) must be defined in the requested
    // message. By default assumed not used (0).
    ReqParam1: float32;
    // The use of this parameter (if any), must be defined in the requested message. By default assumed not used
    // (0).
    ReqParam2: float32;
    // The use of this parameter (if any), must be defined in the requested message. By default assumed not used
    // (0).
    ReqParam3: float32;
    // The use of this parameter (if any), must be defined in the requested message. By default assumed not used
    // (0).
    ReqParam4: float32;
    // The use of this parameter (if any), must be defined in the requested message. By default assumed not used
    // (0).
    ReqParam5: float32;
    // Target address for requested message (if message has target address fields). 0: Flight-stack default,
    // 1: address of requestor, 2: broadcast.
    ResponseTarget: float32;
}

struct MavCmdRequestProtocolVersion {
    // 1: Request supported protocol versions by all nodes on the network
    Protocol: float32;
    // Reserved (all remaining params)
    Param2: float32;
}

struct MavCmdRequestStorageInformation {
    // Storage ID (0 for all, 1 for first, 2 for second, etc.)
    StorageId: float32;
    // 0: No Action 1: Request storage information
    Information: float32;
    // Reserved (all remaining params)
    Param3: float32;
}

struct MavCmdRequestVideoStreamInformation {
    // Video Stream ID (0 for all streams, 1 for first, 2 for second, etc.)
    StreamId: float32;
}

struct MavCmdRequestVideoStreamStatus {
    // Video Stream ID (0 for all streams, 1 for first, 2 for second, etc.)
    StreamId: float32;
}

struct MavCmdResetCameraSettings {
    // 0: No Action 1: Reset all settings
    Reset: float32;
    // Reserved (all remaining params)
    Param2: float32;
}

abstract extensible struct MavCmdRunPrearmChecks {
}

struct MavCmdSetCameraFocus {
    // Focus type
    FocusType: SetFocusType;
    // Focus value
    FocusValue: float32;
    Param3: float32;
    Param4: float32;
    Param7: float32;
}

struct MavCmdSetCameraMode {
    // Reserved (Set to 0)
    Param1: float32;
    // Camera mode
    CameraMode: CameraMode;
    Param3: float32;
    Param4: float32;
    Param7: float32;
}

struct MavCmdSetCameraZoom {
    // Zoom type
    ZoomType: CameraZoomType;
    // Zoom value. The range of valid values depend on the zoom type.
    ZoomValue: float32;
    Param3: float32;
    Param4: float32;
    Param7: float32;
}

struct MavCmdSetGuidedSubmodeCircle {
    // Radius of desired circle in CIRCLE_MODE
    Radius: float32;
    // User defined
    Param2: float32;
    // User defined
    Param3: float32;
    // User defined
    Param4: float32;
    // Target latitude of center of circle in CIRCLE_MODE
    Latitude: float32;
    // Target longitude of center of circle in CIRCLE_MODE
    Longitude: float32;
}

abstract extensible struct MavCmdSetGuidedSubmodeStandard {
}

struct MavCmdSetMessageInterval {
    // The MAVLink message ID
    MessageId: float32;
    // The interval between two messages. Set to -1 to disable and 0 to request default rate.
    Interval: float32;
    // Target address of message stream (if message has target address fields). 0: Flight-stack default (recommended),
    // 1: address of requestor, 2: broadcast.
    ResponseTarget: float32;
}

struct MavCmdSetStorageUsage {
    // Storage ID (1 for first, 2 for second, etc.)
    StorageId: float32;
    // Usage flags
    Usage: StorageUsageFlag;
}

struct MavCmdSpatialUser1 {
    // User defined
    Param1: float32;
    // User defined
    Param2: float32;
    // User defined
    Param3: float32;
    // User defined
    Param4: float32;
    // Latitude unscaled
    Latitude: float32;
    // Longitude unscaled
    Longitude: float32;
    // Altitude (MSL)
    Altitude: float32;
}

struct MavCmdSpatialUser2 {
    // User defined
    Param1: float32;
    // User defined
    Param2: float32;
    // User defined
    Param3: float32;
    // User defined
    Param4: float32;
    // Latitude unscaled
    Latitude: float32;
    // Longitude unscaled
    Longitude: float32;
    // Altitude (MSL)
    Altitude: float32;
}

struct MavCmdSpatialUser3 {
    // User defined
    Param1: float32;
    // User defined
    Param2: float32;
    // User defined
    Param3: float32;
    // User defined
    Param4: float32;
    // Latitude unscaled
    Latitude: float32;
    // Longitude unscaled
    Longitude: float32;
    // Altitude (MSL)
    Altitude: float32;
}

struct MavCmdSpatialUser4 {
    // User defined
    Param1: float32;
    // User defined
    Param2: float32;
    // User defined
    Param3: float32;
    // User defined
    Param4: float32;
    // Latitude unscaled
    Latitude: float32;
    // Longitude unscaled
    Longitude: float32;
    // Altitude (MSL)
    Altitude: float32;
}

struct MavCmdSpatialUser5 {
    // User defined
    Param1: float32;
    // User defined
    Param2: float32;
    // User defined
    Param3: float32;
    // User defined
    Param4: float32;
    // Latitude unscaled
    Latitude: float32;
    // Longitude unscaled
    Longitude: float32;
    // Altitude (MSL)
    Altitude: float32;
}

struct MavCmdStartRxPair {
    // 0:Spektrum.
    Spektrum: float32;
    // RC type.
    RcType: RcType;
}

struct MavCmdStorageFormat {
    // Storage ID (1 for first, 2 for second, etc.)
    StorageId: float32;
    // Format storage (and reset image log). 0: No action 1: Format storage
    Format: float32;
    // Reset Image Log (without formatting storage medium). This will reset CAMERA_CAPTURE_STATUS.image_count
    // and CAMERA_IMAGE_CAPTURED.image_index. 0: No action 1: Reset Image Log
    ResetImageLog: float32;
    // Reserved (all remaining params)
    Param4: float32;
}

struct MavCmdUavcanGetNodeInfo {
    // Reserved (set to 0)
    Param1: float32;
    // Reserved (set to 0)
    Param2: float32;
    // Reserved (set to 0)
    Param3: float32;
    // Reserved (set to 0)
    Param4: float32;
    // Reserved (set to 0)
    Param5: float32;
    // Reserved (set to 0)
    Param6: float32;
    // Reserved (set to 0)
    Param7: float32;
}

struct MavCmdUser1 {
    // User defined
    Param1: float32;
    // User defined
    Param2: float32;
    // User defined
    Param3: float32;
    // User defined
    Param4: float32;
    // User defined
    Param5: float32;
    // User defined
    Param6: float32;
    // User defined
    Param7: float32;
}

struct MavCmdUser2 {
    // User defined
    Param1: float32;
    // User defined
    Param2: float32;
    // User defined
    Param3: float32;
    // User defined
    Param4: float32;
    // User defined
    Param5: float32;
    // User defined
    Param6: float32;
    // User defined
    Param7: float32;
}

struct MavCmdUser3 {
    // User defined
    Param1: float32;
    // User defined
    Param2: float32;
    // User defined
    Param3: float32;
    // User defined
    Param4: float32;
    // User defined
    Param5: float32;
    // User defined
    Param6: float32;
    // User defined
    Param7: float32;
}

struct MavCmdUser4 {
    // User defined
    Param1: float32;
    // User defined
    Param2: float32;
    // User defined
    Param3: float32;
    // User defined
    Param4: float32;
    // User defined
    Param5: float32;
    // User defined
    Param6: float32;
    // User defined
    Param7: float32;
}

struct MavCmdUser5 {
    // User defined
    Param1: float32;
    // User defined
    Param2: float32;
    // User defined
    Param3: float32;
    // User defined
    Param4: float32;
    // User defined
    Param5: float32;
    // User defined
    Param6: float32;
    // User defined
    Param7: float32;
}

struct MavCmdVideoStartCapture {
    // Video Stream ID (0 for all streams)
    StreamId: float32;
    // Frequency CAMERA_CAPTURE_STATUS messages should be sent while recording (0 for no messages, otherwise
    // frequency)
    StatusFrequency: float32;
    Param3: float32;
    Param4: float32;
    Param5: float32;
    Param6: float32;
    Param7: float32;
}

struct MavCmdVideoStartStreaming {
    // Video Stream ID (0 for all streams, 1 for first, 2 for second, etc.)
    StreamId: float32;
}

struct MavCmdVideoStopCapture {
    // Video Stream ID (0 for all streams)
    StreamId: float32;
    Param2: float32;
    Param3: float32;
    Param4: float32;
    Param5: float32;
    Param6: float32;
    Param7: float32;
}

struct MavCmdVideoStopStreaming {
    // Video Stream ID (0 for all streams, 1 for first, 2 for second, etc.)
    StreamId: float32;
}

struct MavCmdWaypointUser1 {
    // User defined
    Param1: float32;
    // User defined
    Param2: float32;
    // User defined
    Param3: float32;
    // User defined
    Param4: float32;
    // Latitude unscaled
    Latitude: float32;
    // Longitude unscaled
    Longitude: float32;
    // Altitude (MSL)
    Altitude: float32;
}

struct MavCmdWaypointUser2 {
    // User defined
    Param1: float32;
    // User defined
    Param2: float32;
    // User defined
    Param3: float32;
    // User defined
    Param4: float32;
    // Latitude unscaled
    Latitude: float32;
    // Longitude unscaled
    Longitude: float32;
    // Altitude (MSL)
    Altitude: float32;
}

struct MavCmdWaypointUser3 {
    // User defined
    Param1: float32;
    // User defined
    Param2: float32;
    // User defined
    Param3: float32;
    // User defined
    Param4: float32;
    // Latitude unscaled
    Latitude: float32;
    // Longitude unscaled
    Longitude: float32;
    // Altitude (MSL)
    Altitude: float32;
}

struct MavCmdWaypointUser4 {
    // User defined
    Param1: float32;
    // User defined
    Param2: float32;
    // User defined
    Param3: float32;
    // User defined
    Param4: float32;
    // Latitude unscaled
    Latitude: float32;
    // Longitude unscaled
    Longitude: float32;
    // Altitude (MSL)
    Altitude: float32;
}

struct MavCmdWaypointUser5 {
    // User defined
    Param1: float32;
    // User defined
    Param2: float32;
    // User defined
    Param3: float32;
    // User defined
    Param4: float32;
    // Latitude unscaled
    Latitude: float32;
    // Longitude unscaled
    Longitude: float32;
    // Altitude (MSL)
    Altitude: float32;
}

message struct MemoryVect extends MessageFrame {
    // Starting address of the debug variables
    Address: uint16;
    // Version code of the type variable. 0=unknown, type ignored and assumed int16_t. 1=as below
    Ver: uint8;
    // Type code of the memory variables. for ver = 1: 0=16 x int16_t, 1=16 x uint16_t, 2=16 x Q15, 3=16 x 1Q14
    Type: uint8;
    // Memory contents at specified address
    @Length(32)
    Value: int8[];
}

message struct MessageInterval extends MessageFrame {
    // The ID of the requested MAVLink message. v1.0 is limited to 254 messages.
    MessageId: uint16;
    // The interval between two messages. A value of -1 indicates this stream is disabled, 0 indicates it is
    // not available, > 0 indicates the interval at which it is sent.
    IntervalUs: int32;
}

message struct MissionAck extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Mission result.
    Type: MavMissionResult;
    MissionAck_extensions: Optional<MissionAck_extension>;
    }

struct MissionAck_extension {
    // Mission type.
    MissionType: MavMissionType;
}

message struct MissionClearAll extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    MissionClearAll_extensions: Optional<MissionClearAll_extension>;
    }

struct MissionClearAll_extension {
    // Mission type.
    MissionType: MavMissionType;
}

message struct MissionCount extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Number of mission items in the sequence
    Count: uint16;
    MissionCount_extensions: Optional<MissionCount_extension>;
    }

struct MissionCount_extension {
    // Mission type.
    MissionType: MavMissionType;
}

message struct MissionCurrent extends MessageFrame {
    // Sequence
    Seq: uint16;
}

message struct MissionItem extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Sequence
    Seq: uint16;
    // The coordinate system of the waypoint.
    Frame: MavFrame;
    // The scheduled action for the waypoint.
    Command: MavCmd;
    // false:0, true:1
    Current: uint8;
    // Autocontinue to next waypoint
    Autocontinue: uint8;
    MissionItem_extensions: Optional<MissionItem_extension>;
    }

struct MissionItem_extension {
    // Mission type.
    MissionType: MavMissionType;
}

message struct MissionItemInt extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Waypoint ID (sequence number). Starts at zero. Increases monotonically for each waypoint, no gaps in the
    // sequence (0,1,2,3,4).
    Seq: uint16;
    // The coordinate system of the waypoint.
    Frame: MavFrame;
    // The scheduled action for the waypoint.
    Command: MavCmd;
    // false:0, true:1
    Current: uint8;
    // Autocontinue to next waypoint
    Autocontinue: uint8;
    MissionItemInt_extensions: Optional<MissionItemInt_extension>;
    }

struct MissionItemInt_extension {
    // Mission type.
    MissionType: MavMissionType;
}

message struct MissionItemReached extends MessageFrame {
    // Sequence
    Seq: uint16;
}

message struct MissionRequest extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Sequence
    Seq: uint16;
    MissionRequest_extensions: Optional<MissionRequest_extension>;
    }

struct MissionRequest_extension {
    // Mission type.
    MissionType: MavMissionType;
}

message struct MissionRequestInt extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Sequence
    Seq: uint16;
    MissionRequestInt_extensions: Optional<MissionRequestInt_extension>;
    }

struct MissionRequestInt_extension {
    // Mission type.
    MissionType: MavMissionType;
}

message struct MissionRequestList extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    MissionRequestList_extensions: Optional<MissionRequestList_extension>;
    }

struct MissionRequestList_extension {
    // Mission type.
    MissionType: MavMissionType;
}

message struct MissionRequestPartialList extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Start index
    StartIndex: int16;
    // End index, -1 by default (-1: send list to end). Else a valid index of the list
    EndIndex: int16;
    MissionRequestPartialList_extensions: Optional<MissionRequestPartialList_extension>;
    }

struct MissionRequestPartialList_extension {
    // Mission type.
    MissionType: MavMissionType;
}

message struct MissionSetCurrent extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Sequence
    Seq: uint16;
}

message struct MissionWritePartialList extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Start index. Must be smaller / equal to the largest index of the current onboard list.
    StartIndex: int16;
    // End index, equal or greater than start index.
    EndIndex: int16;
    MissionWritePartialList_extensions: Optional<MissionWritePartialList_extension>;
    }

struct MissionWritePartialList_extension {
    // Mission type.
    MissionType: MavMissionType;
}

message struct MountOrientation extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Roll in global frame (set to NaN for invalid).
    Roll: float32;
    // Pitch in global frame (set to NaN for invalid).
    Pitch: float32;
    // Yaw relative to vehicle (set to NaN for invalid).
    Yaw: float32;
    MountOrientation_extensions: Optional<MountOrientation_extension>;
    }

struct MountOrientation_extension {
    // Yaw in absolute frame relative to Earth's North, north is 0 (set to NaN for invalid).
    YawAbsolute: float32;
}

message struct NamedValueFloat extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Name of the debug variable
    @Length(10)
    Name: string;
    // Floating point value
    Value: float32;
}

message struct NamedValueInt extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Name of the debug variable
    @Length(10)
    Name: string;
    // Signed integer value
    Value: int32;
}

message struct NavControllerOutput extends MessageFrame {
    // Current desired roll
    NavRoll: float32;
    // Current desired pitch
    NavPitch: float32;
    // Current desired heading
    NavBearing: int16;
    // Bearing to current waypoint/target
    TargetBearing: int16;
    // Distance to active waypoint
    WpDist: uint16;
    // Current altitude error
    AltError: float32;
    // Current airspeed error
    AspdError: float32;
    // Current crosstrack error on x-y plane
    XtrackError: float32;
}

message struct ObstacleDistance extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Class id of the distance sensor type.
    SensorType: MavDistanceSensor;
    // Distance of obstacles around the vehicle with index 0 corresponding to north + angle_offset, unless otherwise
    // specified in the frame. A value of 0 is valid and means that the obstacle is practically touching the
    // sensor. A value of max_distance +1 means no obstacle is present. A value of UINT16_MAX for unknown/not
    // used. In a array element, one unit corresponds to 1cm.
    @Length(72)
    Distances: uint16[];
    // Angular width in degrees of each array element. Increment direction is clockwise. This field is ignored
    // if increment_f is non-zero.
    Increment: uint8;
    // Minimum distance the sensor can measure.
    MinDistance: uint16;
    // Maximum distance the sensor can measure.
    MaxDistance: uint16;
    ObstacleDistance_extensions: Optional<ObstacleDistance_extension>;
    }

struct ObstacleDistance_extension {
    // Angular width in degrees of each array element as a float. If non-zero then this value is used instead
    // of the uint8_t increment field. Positive is clockwise direction, negative is counter-clockwise.
    IncrementF: float32;
    // Relative angle offset of the 0-index element in the distances array. Value of 0 corresponds to forward.
    // Positive is clockwise direction, negative is counter-clockwise.
    AngleOffset: float32;
    // Coordinate frame of reference for the yaw rotation and offset of the sensor data. Defaults to MAV_FRAME_GLOBAL,
    // which is north aligned. For body-mounted sensors use MAV_FRAME_BODY_FRD, which is vehicle front aligned.
    Frame: MavFrame;
}

message struct Odometry extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Coordinate frame of reference for the pose data.
    FrameId: MavFrame;
    // Coordinate frame of reference for the velocity in free space (twist) data.
    ChildFrameId: MavFrame;
    // X Position
    X: float32;
    // Y Position
    Y: float32;
    // Z Position
    Z: float32;
    // Quaternion components, w, x, y, z (1 0 0 0 is the null-rotation)
    @Length(4)
    Q: float32[];
    // X linear speed
    Vx: float32;
    // Y linear speed
    Vy: float32;
    // Z linear speed
    Vz: float32;
    // Roll angular speed
    Rollspeed: float32;
    // Pitch angular speed
    Pitchspeed: float32;
    // Yaw angular speed
    Yawspeed: float32;
    // Row-major representation of a 6x6 pose cross-covariance matrix upper right triangle (states: x, y, z,
    // roll, pitch, yaw; first six entries are the first ROW, next five entries are the second ROW, etc.). If
    // unknown, assign NaN value to first element in the array.
    @Length(21)
    PoseCovariance: float32[];
    // Row-major representation of a 6x6 velocity cross-covariance matrix upper right triangle (states: vx, vy,
    // vz, rollspeed, pitchspeed, yawspeed; first six entries are the first ROW, next five entries are the second
    // ROW, etc.). If unknown, assign NaN value to first element in the array.
    @Length(21)
    VelocityCovariance: float32[];
    Odometry_extensions: Optional<Odometry_extension>;
    }

struct Odometry_extension {
    // Estimate reset counter. This should be incremented when the estimate resets in any of the dimensions (position,
    // velocity, attitude, angular speed). This is designed to be used when e.g an external SLAM system detects
    // a loop-closure and the estimate jumps.
    ResetCounter: uint8;
    // Type of estimator that is providing the odometry.
    EstimatorType: MavEstimatorType;
}

















message struct OpticalFlow extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Sensor ID
    SensorId: uint8;
    // Flow in x-sensor direction
    FlowX: int16;
    // Flow in y-sensor direction
    FlowY: int16;
    // Flow in x-sensor direction, angular-speed compensated
    FlowCompMX: float32;
    // Flow in y-sensor direction, angular-speed compensated
    FlowCompMY: float32;
    // Optical flow quality / confidence. 0: bad, 255: maximum quality
    Quality: uint8;
    // Ground distance. Positive value: distance known. Negative value: Unknown distance
    GroundDistance: float32;
    OpticalFlow_extensions: Optional<OpticalFlow_extension>;
    }

struct OpticalFlow_extension {
    // Flow rate about X axis
    FlowRateX: float32;
    // Flow rate about Y axis
    FlowRateY: float32;
}

message struct OpticalFlowRad extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Sensor ID
    SensorId: uint8;
    // Integration time. Divide integrated_x and integrated_y by the integration time to obtain average flow.
    // The integration time also indicates the.
    IntegrationTimeUs: uint32;
    // Flow around X axis (Sensor RH rotation about the X axis induces a positive flow. Sensor linear motion
    // along the positive Y axis induces a negative flow.)
    IntegratedX: float32;
    // Flow around Y axis (Sensor RH rotation about the Y axis induces a positive flow. Sensor linear motion
    // along the positive X axis induces a positive flow.)
    IntegratedY: float32;
    // RH rotation around X axis
    IntegratedXgyro: float32;
    // RH rotation around Y axis
    IntegratedYgyro: float32;
    // RH rotation around Z axis
    IntegratedZgyro: float32;
    // Temperature
    Temperature: int16;
    // Optical flow quality / confidence. 0: no valid flow, 255: maximum quality
    Quality: uint8;
    // Time since the distance was sampled.
    TimeDeltaDistanceUs: uint32;
    // Distance to the center of the flow field. Positive value (including zero): distance known. Negative value:
    // Unknown distance.
    Distance: float32;
}



message struct ParamExtAck extends MessageFrame {
    // Parameter id, terminated by NULL if the length is less than 16 human-readable chars and WITHOUT null termination
    // (NULL) byte if the length is exactly 16 chars - applications have to provide 16+1 bytes storage if the
    // ID is stored as string
    @Length(16)
    ParamId: string;
    // Parameter value (new value if PARAM_ACK_ACCEPTED, current value otherwise)
    @Length(128)
    ParamValue: string;
    // Parameter type.
    ParamType: MavParamExtType;
    // Result code.
    ParamResult: ParamAck;
}

message struct ParamExtRequestList extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
}

message struct ParamExtRequestRead extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Parameter id, terminated by NULL if the length is less than 16 human-readable chars and WITHOUT null termination
    // (NULL) byte if the length is exactly 16 chars - applications have to provide 16+1 bytes storage if the
    // ID is stored as string
    @Length(16)
    ParamId: string;
    // Parameter index. Set to -1 to use the Parameter ID field as identifier (else param_id will be ignored)
    ParamIndex: int16;
}

message struct ParamExtSet extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Parameter id, terminated by NULL if the length is less than 16 human-readable chars and WITHOUT null termination
    // (NULL) byte if the length is exactly 16 chars - applications have to provide 16+1 bytes storage if the
    // ID is stored as string
    @Length(16)
    ParamId: string;
    // Parameter value
    @Length(128)
    ParamValue: string;
    // Parameter type.
    ParamType: MavParamExtType;
}

message struct ParamExtValue extends MessageFrame {
    // Parameter id, terminated by NULL if the length is less than 16 human-readable chars and WITHOUT null termination
    // (NULL) byte if the length is exactly 16 chars - applications have to provide 16+1 bytes storage if the
    // ID is stored as string
    @Length(16)
    ParamId: string;
    // Parameter value
    @Length(128)
    ParamValue: string;
    // Parameter type.
    ParamType: MavParamExtType;
    // Total number of parameters
    ParamCount: uint16;
    // Index of this parameter
    ParamIndex: uint16;
}

message struct ParamMapRc extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Onboard parameter id, terminated by NULL if the length is less than 16 human-readable chars and WITHOUT
    // null termination (NULL) byte if the length is exactly 16 chars - applications have to provide 16+1 bytes
    // storage if the ID is stored as string
    @Length(16)
    ParamId: string;
    // Parameter index. Send -1 to use the param ID field as identifier (else the param id will be ignored),
    // send -2 to disable any existing map for this rc_channel_index.
    ParamIndex: int16;
    // Index of parameter RC channel. Not equal to the RC channel id. Typically corresponds to a potentiometer-knob
    // on the RC.
    ParameterRcChannelIndex: uint8;
    // Initial parameter value
    ParamValue0: float32;
    // Scale, maps the RC range [-1, 1] to a parameter value
    Scale: float32;
    // Minimum param value. The protocol does not define if this overwrites an onboard minimum value. (Depends
    // on implementation)
    ParamValueMin: float32;
    // Maximum param value. The protocol does not define if this overwrites an onboard maximum value. (Depends
    // on implementation)
    ParamValueMax: float32;
}

message struct ParamRequestList extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
}

message struct ParamRequestRead extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Onboard parameter id, terminated by NULL if the length is less than 16 human-readable chars and WITHOUT
    // null termination (NULL) byte if the length is exactly 16 chars - applications have to provide 16+1 bytes
    // storage if the ID is stored as string
    @Length(16)
    ParamId: string;
    // Parameter index. Send -1 to use the param ID field as identifier (else the param id will be ignored)
    ParamIndex: int16;
}

message struct ParamSet extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Onboard parameter id, terminated by NULL if the length is less than 16 human-readable chars and WITHOUT
    // null termination (NULL) byte if the length is exactly 16 chars - applications have to provide 16+1 bytes
    // storage if the ID is stored as string
    @Length(16)
    ParamId: string;
    // Onboard parameter value
    ParamValue: float32;
    // Onboard parameter type.
    ParamType: MavParamType;
}

message struct ParamValue extends MessageFrame {
    // Onboard parameter id, terminated by NULL if the length is less than 16 human-readable chars and WITHOUT
    // null termination (NULL) byte if the length is exactly 16 chars - applications have to provide 16+1 bytes
    // storage if the ID is stored as string
    @Length(16)
    ParamId: string;
    // Onboard parameter value
    ParamValue: float32;
    // Onboard parameter type.
    ParamType: MavParamType;
    // Total number of onboard parameters
    ParamCount: uint16;
    // Index of this onboard parameter
    ParamIndex: uint16;
}

message struct Ping extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // PING sequence
    Seq: uint32;
    // 0: request ping from all receiving systems. If greater than 0: message is a ping response and number is
    // the system id of the requesting system
    TargetSystem: uint8;
    // 0: request ping from all receiving components. If greater than 0: message is a ping response and number
    // is the component id of the requesting component.
    TargetComponent: uint8;
}

message struct PlayTune extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // tune in board specific format
    @Length(30)
    Tune: string;
    PlayTune_extensions: Optional<PlayTune_extension>;
    }

struct PlayTune_extension {
    // tune extension (appended to tune)
    @Length(200)
    Tune2: string;
}

message struct PlayTuneV2 extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Tune format
    Format: TuneFormatBitmask;
    // Tune definition as a NULL-terminated string.
    @Length(248)
    Tune: string;
}

message struct PositionTargetGlobalInt extends MessageFrame {
    // Timestamp (time since system boot). The rationale for the timestamp in the setpoint is to allow the system
    // to compensate for the transport delay of the setpoint. This allows the system to compensate processing
    // latency.
    TimeBootMs: uint32;
    // Valid options are: MAV_FRAME_GLOBAL_INT = 5, MAV_FRAME_GLOBAL_RELATIVE_ALT_INT = 6, MAV_FRAME_GLOBAL_TERRAIN_ALT_INT
    // = 11
    CoordinateFrame: MavFrame;
    // Bitmap to indicate which dimensions should be ignored by the vehicle.
    TypeMask: PositionTargetTypemaskBitmask;
    // X Position in WGS84 frame
    LatInt: int32;
    // Y Position in WGS84 frame
    LonInt: int32;
    // Altitude (MSL, AGL or relative to home altitude, depending on frame)
    Alt: float32;
    // X velocity in NED frame
    Vx: float32;
    // Y velocity in NED frame
    Vy: float32;
    // Z velocity in NED frame
    Vz: float32;
    // X acceleration or force (if bit 10 of type_mask is set) in NED frame in meter / s^2 or N
    Afx: float32;
    // Y acceleration or force (if bit 10 of type_mask is set) in NED frame in meter / s^2 or N
    Afy: float32;
    // Z acceleration or force (if bit 10 of type_mask is set) in NED frame in meter / s^2 or N
    Afz: float32;
    // yaw setpoint
    Yaw: float32;
    // yaw rate setpoint
    YawRate: float32;
}

message struct PositionTargetLocalNed extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Valid options are: MAV_FRAME_LOCAL_NED = 1, MAV_FRAME_LOCAL_OFFSET_NED = 7, MAV_FRAME_BODY_NED = 8, MAV_FRAME_BODY_OFFSET_NED
    // = 9
    CoordinateFrame: MavFrame;
    // Bitmap to indicate which dimensions should be ignored by the vehicle.
    TypeMask: PositionTargetTypemaskBitmask;
    // X Position in NED frame
    X: float32;
    // Y Position in NED frame
    Y: float32;
    // Z Position in NED frame (note, altitude is negative in NED)
    Z: float32;
    // X velocity in NED frame
    Vx: float32;
    // Y velocity in NED frame
    Vy: float32;
    // Z velocity in NED frame
    Vz: float32;
    // X acceleration or force (if bit 10 of type_mask is set) in NED frame in meter / s^2 or N
    Afx: float32;
    // Y acceleration or force (if bit 10 of type_mask is set) in NED frame in meter / s^2 or N
    Afy: float32;
    // Z acceleration or force (if bit 10 of type_mask is set) in NED frame in meter / s^2 or N
    Afz: float32;
    // yaw setpoint
    Yaw: float32;
    // yaw rate setpoint
    YawRate: float32;
}

message struct PowerStatus extends MessageFrame {
    // 5V rail voltage.
    Vcc: uint16;
    // Servo rail voltage.
    Vservo: uint16;
    // Bitmap of power supply status flags.
    Flags: MavPowerStatusBitmask;
}

message struct RadioStatus extends MessageFrame {
    // Local (message sender) recieved signal strength indication in device-dependent units/scale. Values: [0-254],
    // UINT8_MAX: invalid/unknown.
    Rssi: uint8;
    // Remote (message receiver) signal strength indication in device-dependent units/scale. Values: [0-254],
    // UINT8_MAX: invalid/unknown.
    Remrssi: uint8;
    // Remaining free transmitter buffer space.
    Txbuf: uint8;
    // Local background noise level. These are device dependent RSSI values (scale as approx 2x dB on SiK radios).
    // Values: [0-254], UINT8_MAX: invalid/unknown.
    Noise: uint8;
    // Remote background noise level. These are device dependent RSSI values (scale as approx 2x dB on SiK radios).
    // Values: [0-254], UINT8_MAX: invalid/unknown.
    Remnoise: uint8;
    // Count of radio packet receive errors (since boot).
    Rxerrors: uint16;
    // Count of error corrected radio packets (since boot).
    Fixed: uint16;
}

message struct RawImu extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // X acceleration (raw)
    Xacc: int16;
    // Y acceleration (raw)
    Yacc: int16;
    // Z acceleration (raw)
    Zacc: int16;
    // Angular speed around X axis (raw)
    Xgyro: int16;
    // Angular speed around Y axis (raw)
    Ygyro: int16;
    // Angular speed around Z axis (raw)
    Zgyro: int16;
    // X Magnetic field (raw)
    Xmag: int16;
    // Y Magnetic field (raw)
    Ymag: int16;
    // Z Magnetic field (raw)
    Zmag: int16;
    RawImu_extensions: Optional<RawImu_extension>;
    }

struct RawImu_extension {
    // Id. Ids are numbered from 0 and map to IMUs numbered from 1 (e.g. IMU1 will have a message with id=0)
    Id: uint8;
    // Temperature, 0: IMU does not provide temperature values. If the IMU is at 0C it must send 1 (0.01C).
    Temperature: int16;
}

message struct RawPressure extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Absolute pressure (raw)
    PressAbs: int16;
    // Differential pressure 1 (raw, 0 if nonexistent)
    PressDiff1: int16;
    // Differential pressure 2 (raw, 0 if nonexistent)
    PressDiff2: int16;
    // Raw Temperature measurement (raw)
    Temperature: int16;
}

message struct RawRpm extends MessageFrame {
    // Index of this RPM sensor (0-indexed)
    Index: uint8;
    // Indicated rate
    Frequency: float32;
}

message struct RcChannels extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Total number of RC channels being received. This can be larger than 18, indicating that more channels
    // are available but not given in this message. This value should be 0 when no RC channels are available.
    Chancount: uint8;
    // RC channel 1 value.
    Chan1Raw: uint16;
    // RC channel 2 value.
    Chan2Raw: uint16;
    // RC channel 3 value.
    Chan3Raw: uint16;
    // RC channel 4 value.
    Chan4Raw: uint16;
    // RC channel 5 value.
    Chan5Raw: uint16;
    // RC channel 6 value.
    Chan6Raw: uint16;
    // RC channel 7 value.
    Chan7Raw: uint16;
    // RC channel 8 value.
    Chan8Raw: uint16;
    // RC channel 9 value.
    Chan9Raw: uint16;
    // RC channel 10 value.
    Chan10Raw: uint16;
    // RC channel 11 value.
    Chan11Raw: uint16;
    // RC channel 12 value.
    Chan12Raw: uint16;
    // RC channel 13 value.
    Chan13Raw: uint16;
    // RC channel 14 value.
    Chan14Raw: uint16;
    // RC channel 15 value.
    Chan15Raw: uint16;
    // RC channel 16 value.
    Chan16Raw: uint16;
    // RC channel 17 value.
    Chan17Raw: uint16;
    // RC channel 18 value.
    Chan18Raw: uint16;
    // Receive signal strength indicator in device-dependent units/scale. Values: [0-254], UINT8_MAX: invalid/unknown.
    Rssi: uint8;
}

message struct RcChannelsOverride extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // RC channel 1 value. A value of UINT16_MAX means to ignore this field. A value of 0 means to release this
    // channel back to the RC radio.
    Chan1Raw: uint16;
    // RC channel 2 value. A value of UINT16_MAX means to ignore this field. A value of 0 means to release this
    // channel back to the RC radio.
    Chan2Raw: uint16;
    // RC channel 3 value. A value of UINT16_MAX means to ignore this field. A value of 0 means to release this
    // channel back to the RC radio.
    Chan3Raw: uint16;
    // RC channel 4 value. A value of UINT16_MAX means to ignore this field. A value of 0 means to release this
    // channel back to the RC radio.
    Chan4Raw: uint16;
    // RC channel 5 value. A value of UINT16_MAX means to ignore this field. A value of 0 means to release this
    // channel back to the RC radio.
    Chan5Raw: uint16;
    // RC channel 6 value. A value of UINT16_MAX means to ignore this field. A value of 0 means to release this
    // channel back to the RC radio.
    Chan6Raw: uint16;
    // RC channel 7 value. A value of UINT16_MAX means to ignore this field. A value of 0 means to release this
    // channel back to the RC radio.
    Chan7Raw: uint16;
    // RC channel 8 value. A value of UINT16_MAX means to ignore this field. A value of 0 means to release this
    // channel back to the RC radio.
    Chan8Raw: uint16;
    RcChannelsOverride_extensions: Optional<RcChannelsOverride_extension>;
    }

struct RcChannelsOverride_extension {
    // RC channel 9 value. A value of 0 or UINT16_MAX means to ignore this field. A value of UINT16_MAX-1 means
    // to release this channel back to the RC radio.
    Chan9Raw: uint16;
    // RC channel 10 value. A value of 0 or UINT16_MAX means to ignore this field. A value of UINT16_MAX-1 means
    // to release this channel back to the RC radio.
    Chan10Raw: uint16;
    // RC channel 11 value. A value of 0 or UINT16_MAX means to ignore this field. A value of UINT16_MAX-1 means
    // to release this channel back to the RC radio.
    Chan11Raw: uint16;
    // RC channel 12 value. A value of 0 or UINT16_MAX means to ignore this field. A value of UINT16_MAX-1 means
    // to release this channel back to the RC radio.
    Chan12Raw: uint16;
    // RC channel 13 value. A value of 0 or UINT16_MAX means to ignore this field. A value of UINT16_MAX-1 means
    // to release this channel back to the RC radio.
    Chan13Raw: uint16;
    // RC channel 14 value. A value of 0 or UINT16_MAX means to ignore this field. A value of UINT16_MAX-1 means
    // to release this channel back to the RC radio.
    Chan14Raw: uint16;
    // RC channel 15 value. A value of 0 or UINT16_MAX means to ignore this field. A value of UINT16_MAX-1 means
    // to release this channel back to the RC radio.
    Chan15Raw: uint16;
    // RC channel 16 value. A value of 0 or UINT16_MAX means to ignore this field. A value of UINT16_MAX-1 means
    // to release this channel back to the RC radio.
    Chan16Raw: uint16;
    // RC channel 17 value. A value of 0 or UINT16_MAX means to ignore this field. A value of UINT16_MAX-1 means
    // to release this channel back to the RC radio.
    Chan17Raw: uint16;
    // RC channel 18 value. A value of 0 or UINT16_MAX means to ignore this field. A value of UINT16_MAX-1 means
    // to release this channel back to the RC radio.
    Chan18Raw: uint16;
}

message struct RcChannelsRaw extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Servo output port (set of 8 outputs = 1 port). Flight stacks running on Pixhawk should use: 0 = MAIN,
    // 1 = AUX.
    Port: uint8;
    // RC channel 1 value.
    Chan1Raw: uint16;
    // RC channel 2 value.
    Chan2Raw: uint16;
    // RC channel 3 value.
    Chan3Raw: uint16;
    // RC channel 4 value.
    Chan4Raw: uint16;
    // RC channel 5 value.
    Chan5Raw: uint16;
    // RC channel 6 value.
    Chan6Raw: uint16;
    // RC channel 7 value.
    Chan7Raw: uint16;
    // RC channel 8 value.
    Chan8Raw: uint16;
    // Receive signal strength indicator in device-dependent units/scale. Values: [0-254], UINT8_MAX: invalid/unknown.
    Rssi: uint8;
}

message struct RcChannelsScaled extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Servo output port (set of 8 outputs = 1 port). Flight stacks running on Pixhawk should use: 0 = MAIN,
    // 1 = AUX.
    Port: uint8;
    // RC channel 1 value scaled.
    Chan1Scaled: int16;
    // RC channel 2 value scaled.
    Chan2Scaled: int16;
    // RC channel 3 value scaled.
    Chan3Scaled: int16;
    // RC channel 4 value scaled.
    Chan4Scaled: int16;
    // RC channel 5 value scaled.
    Chan5Scaled: int16;
    // RC channel 6 value scaled.
    Chan6Scaled: int16;
    // RC channel 7 value scaled.
    Chan7Scaled: int16;
    // RC channel 8 value scaled.
    Chan8Scaled: int16;
    // Receive signal strength indicator in device-dependent units/scale. Values: [0-254], UINT8_MAX: invalid/unknown.
    Rssi: uint8;
}

message struct RequestDataStream extends MessageFrame {
    // The target requested to send the message stream.
    TargetSystem: uint8;
    // The target requested to send the message stream.
    TargetComponent: uint8;
    // The ID of the requested data stream
    ReqStreamId: uint8;
    // The requested message rate
    ReqMessageRate: uint16;
    // 1 to start sending, 0 to stop sending.
    StartStop: uint8;
}



message struct ResourceRequest extends MessageFrame {
    // Request ID. This ID should be re-used when sending back URI contents
    RequestId: uint8;
    // The type of requested URI. 0 = a file via URL. 1 = a UAVCAN binary
    UriType: uint8;
    // The requested unique resource identifier (URI). It is not necessarily a straight domain name (depends
    // on the URI type enum)
    @Length(120)
    Uri: uint8[];
    // The way the autopilot wants to receive the URI. 0 = MAVLink FTP. 1 = binary stream.
    TransferType: uint8;
    // The storage path the autopilot wants the URI to be stored in. Will only be valid if the transfer_type
    // has a storage associated (e.g. MAVLink FTP).
    @Length(120)
    Storage: uint8[];
}



message struct SafetyAllowedArea extends MessageFrame {
    // Coordinate frame. Can be either global, GPS, right-handed with Z axis up or local, right handed, Z axis
    // down.
    Frame: MavFrame;
    // x position 1 / Latitude 1
    P1X: float32;
    // y position 1 / Longitude 1
    P1Y: float32;
    // z position 1 / Altitude 1
    P1Z: float32;
    // x position 2 / Latitude 2
    P2X: float32;
    // y position 2 / Longitude 2
    P2Y: float32;
    // z position 2 / Altitude 2
    P2Z: float32;
}

message struct SafetySetAllowedArea extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Coordinate frame. Can be either global, GPS, right-handed with Z axis up or local, right handed, Z axis
    // down.
    Frame: MavFrame;
    // x position 1 / Latitude 1
    P1X: float32;
    // y position 1 / Longitude 1
    P1Y: float32;
    // z position 1 / Altitude 1
    P1Z: float32;
    // x position 2 / Latitude 2
    P2X: float32;
    // y position 2 / Longitude 2
    P2Y: float32;
    // z position 2 / Altitude 2
    P2Z: float32;
}

message struct ScaledImu extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // X acceleration
    Xacc: int16;
    // Y acceleration
    Yacc: int16;
    // Z acceleration
    Zacc: int16;
    // Angular speed around X axis
    Xgyro: int16;
    // Angular speed around Y axis
    Ygyro: int16;
    // Angular speed around Z axis
    Zgyro: int16;
    // X Magnetic field
    Xmag: int16;
    // Y Magnetic field
    Ymag: int16;
    // Z Magnetic field
    Zmag: int16;
    ScaledImu_extensions: Optional<ScaledImu_extension>;
    }

struct ScaledImu_extension {
    // Temperature, 0: IMU does not provide temperature values. If the IMU is at 0C it must send 1 (0.01C).
    Temperature: int16;
}

message struct ScaledImu2 extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // X acceleration
    Xacc: int16;
    // Y acceleration
    Yacc: int16;
    // Z acceleration
    Zacc: int16;
    // Angular speed around X axis
    Xgyro: int16;
    // Angular speed around Y axis
    Ygyro: int16;
    // Angular speed around Z axis
    Zgyro: int16;
    // X Magnetic field
    Xmag: int16;
    // Y Magnetic field
    Ymag: int16;
    // Z Magnetic field
    Zmag: int16;
    ScaledImu2_extensions: Optional<ScaledImu2_extension>;
    }

struct ScaledImu2_extension {
    // Temperature, 0: IMU does not provide temperature values. If the IMU is at 0C it must send 1 (0.01C).
    Temperature: int16;
}

message struct ScaledImu3 extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // X acceleration
    Xacc: int16;
    // Y acceleration
    Yacc: int16;
    // Z acceleration
    Zacc: int16;
    // Angular speed around X axis
    Xgyro: int16;
    // Angular speed around Y axis
    Ygyro: int16;
    // Angular speed around Z axis
    Zgyro: int16;
    // X Magnetic field
    Xmag: int16;
    // Y Magnetic field
    Ymag: int16;
    // Z Magnetic field
    Zmag: int16;
    ScaledImu3_extensions: Optional<ScaledImu3_extension>;
    }

struct ScaledImu3_extension {
    // Temperature, 0: IMU does not provide temperature values. If the IMU is at 0C it must send 1 (0.01C).
    Temperature: int16;
}

message struct ScaledPressure extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Absolute pressure
    PressAbs: float32;
    // Differential pressure 1
    PressDiff: float32;
    // Absolute pressure temperature
    Temperature: int16;
    ScaledPressure_extensions: Optional<ScaledPressure_extension>;
    }

struct ScaledPressure_extension {
    // Differential pressure temperature (0, if not available). Report values of 0 (or 1) as 1 cdegC.
    TemperaturePressDiff: int16;
}

message struct ScaledPressure2 extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Absolute pressure
    PressAbs: float32;
    // Differential pressure
    PressDiff: float32;
    // Absolute pressure temperature
    Temperature: int16;
    ScaledPressure2_extensions: Optional<ScaledPressure2_extension>;
    }

struct ScaledPressure2_extension {
    // Differential pressure temperature (0, if not available). Report values of 0 (or 1) as 1 cdegC.
    TemperaturePressDiff: int16;
}

message struct ScaledPressure3 extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Absolute pressure
    PressAbs: float32;
    // Differential pressure
    PressDiff: float32;
    // Absolute pressure temperature
    Temperature: int16;
    ScaledPressure3_extensions: Optional<ScaledPressure3_extension>;
    }

struct ScaledPressure3_extension {
    // Differential pressure temperature (0, if not available). Report values of 0 (or 1) as 1 cdegC.
    TemperaturePressDiff: int16;
}

message struct SerialControl extends MessageFrame {
    // Serial control device type.
    Device: SerialControlDev;
    // Bitmap of serial control flags.
    Flags: SerialControlFlagBitmask;
    // Timeout for reply data
    Timeout: uint16;
    // Baudrate of transfer. Zero means no change.
    Baudrate: uint32;
    // how many bytes in this transfer
    Count: uint8;
    // serial data
    @Length(70)
    Data: uint8[];
    SerialControl_extensions: Optional<SerialControl_extension>;
    }

struct SerialControl_extension {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
}

message struct ServoOutputRaw extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint32;
    // Servo output port (set of 8 outputs = 1 port). Flight stacks running on Pixhawk should use: 0 = MAIN,
    // 1 = AUX.
    Port: uint8;
    // Servo output 1 value
    Servo1Raw: uint16;
    // Servo output 2 value
    Servo2Raw: uint16;
    // Servo output 3 value
    Servo3Raw: uint16;
    // Servo output 4 value
    Servo4Raw: uint16;
    // Servo output 5 value
    Servo5Raw: uint16;
    // Servo output 6 value
    Servo6Raw: uint16;
    // Servo output 7 value
    Servo7Raw: uint16;
    // Servo output 8 value
    Servo8Raw: uint16;
    ServoOutputRaw_extensions: Optional<ServoOutputRaw_extension>;
    }

struct ServoOutputRaw_extension {
    // Servo output 9 value
    Servo9Raw: uint16;
    // Servo output 10 value
    Servo10Raw: uint16;
    // Servo output 11 value
    Servo11Raw: uint16;
    // Servo output 12 value
    Servo12Raw: uint16;
    // Servo output 13 value
    Servo13Raw: uint16;
    // Servo output 14 value
    Servo14Raw: uint16;
    // Servo output 15 value
    Servo15Raw: uint16;
    // Servo output 16 value
    Servo16Raw: uint16;
}

message struct SetupSigning extends MessageFrame {
    // system id of the target
    TargetSystem: uint8;
    // component ID of the target
    TargetComponent: uint8;
    // signing key
    @Length(32)
    SecretKey: uint8[];
    // initial timestamp
    InitialTimestamp: uint64;
}

message struct SetActuatorControlTarget extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Actuator group. The "_mlx" indicates this is a multi-instance message and a MAVLink parser should use
    // this field to difference between instances.
    GroupMlx: uint8;
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Actuator controls. Normed to -1..+1 where 0 is neutral position. Throttle for single rotation direction
    // motors is 0..1, negative range for reverse direction. Standard mapping for attitude controls (group 0):
    // (index 0-7): roll, pitch, yaw, throttle, flaps, spoilers, airbrakes, landing gear. Load a pass-through
    // mixer to repurpose them as generic outputs.
    @Length(8)
    Controls: float32[];
}

message struct SetAttitudeTarget extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Bitmap to indicate which dimensions should be ignored by the vehicle.
    TypeMask: AttitudeTargetTypemaskBitmask;
    // Attitude quaternion (w, x, y, z order, zero-rotation is 1, 0, 0, 0)
    @Length(4)
    Q: float32[];
    // Body roll rate
    BodyRollRate: float32;
    // Body pitch rate
    BodyPitchRate: float32;
    // Body yaw rate
    BodyYawRate: float32;
    // Collective thrust, normalized to 0 .. 1 (-1 .. 1 for vehicles capable of reverse trust)
    Thrust: float32;
    SetAttitudeTarget_extensions: Optional<SetAttitudeTarget_extension>;
    }

struct SetAttitudeTarget_extension {
    // 3D thrust setpoint in the body NED frame, normalized to -1 .. 1
    @Length(3)
    ThrustBody: float32[];
}

message struct SetGpsGlobalOrigin extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Latitude (WGS84)
    Latitude: int32;
    // Longitude (WGS84)
    Longitude: int32;
    // Altitude (MSL). Positive for up.
    Altitude: int32;
    SetGpsGlobalOrigin_extensions: Optional<SetGpsGlobalOrigin_extension>;
    }

struct SetGpsGlobalOrigin_extension {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
}

message struct SetHomePosition extends MessageFrame {
    // System ID.
    TargetSystem: uint8;
    // Latitude (WGS84)
    Latitude: int32;
    // Longitude (WGS84)
    Longitude: int32;
    // Altitude (MSL). Positive for up.
    Altitude: int32;
    // Local X position of this position in the local coordinate frame
    X: float32;
    // Local Y position of this position in the local coordinate frame
    Y: float32;
    // Local Z position of this position in the local coordinate frame
    Z: float32;
    // World to surface normal and heading transformation of the takeoff position. Used to indicate the heading
    // and slope of the ground
    @Length(4)
    Q: float32[];
    // Local X position of the end of the approach vector. Multicopters should set this position based on their
    // takeoff path. Grass-landing fixed wing aircraft should set it the same way as multicopters. Runway-landing
    // fixed wing aircraft should set it to the opposite direction of the takeoff, assuming the takeoff happened
    // from the threshold / touchdown zone.
    ApproachX: float32;
    // Local Y position of the end of the approach vector. Multicopters should set this position based on their
    // takeoff path. Grass-landing fixed wing aircraft should set it the same way as multicopters. Runway-landing
    // fixed wing aircraft should set it to the opposite direction of the takeoff, assuming the takeoff happened
    // from the threshold / touchdown zone.
    ApproachY: float32;
    // Local Z position of the end of the approach vector. Multicopters should set this position based on their
    // takeoff path. Grass-landing fixed wing aircraft should set it the same way as multicopters. Runway-landing
    // fixed wing aircraft should set it to the opposite direction of the takeoff, assuming the takeoff happened
    // from the threshold / touchdown zone.
    ApproachZ: float32;
    SetHomePosition_extensions: Optional<SetHomePosition_extension>;
    }

struct SetHomePosition_extension {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
}

message struct SetMode extends MessageFrame {
    // The system setting the mode
    TargetSystem: uint8;
    // The new base mode.
    BaseMode: MavMode;
    // The new autopilot-specific mode. This field can be ignored by an autopilot.
    CustomMode: uint32;
}

message struct SetPositionTargetGlobalInt extends MessageFrame {
    // Timestamp (time since system boot). The rationale for the timestamp in the setpoint is to allow the system
    // to compensate for the transport delay of the setpoint. This allows the system to compensate processing
    // latency.
    TimeBootMs: uint32;
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Valid options are: MAV_FRAME_GLOBAL_INT = 5, MAV_FRAME_GLOBAL_RELATIVE_ALT_INT = 6, MAV_FRAME_GLOBAL_TERRAIN_ALT_INT
    // = 11
    CoordinateFrame: MavFrame;
    // Bitmap to indicate which dimensions should be ignored by the vehicle.
    TypeMask: PositionTargetTypemaskBitmask;
    // X Position in WGS84 frame
    LatInt: int32;
    // Y Position in WGS84 frame
    LonInt: int32;
    // Altitude (MSL, Relative to home, or AGL - depending on frame)
    Alt: float32;
    // X velocity in NED frame
    Vx: float32;
    // Y velocity in NED frame
    Vy: float32;
    // Z velocity in NED frame
    Vz: float32;
    // X acceleration or force (if bit 10 of type_mask is set) in NED frame in meter / s^2 or N
    Afx: float32;
    // Y acceleration or force (if bit 10 of type_mask is set) in NED frame in meter / s^2 or N
    Afy: float32;
    // Z acceleration or force (if bit 10 of type_mask is set) in NED frame in meter / s^2 or N
    Afz: float32;
    // yaw setpoint
    Yaw: float32;
    // yaw rate setpoint
    YawRate: float32;
}

message struct SetPositionTargetLocalNed extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Valid options are: MAV_FRAME_LOCAL_NED = 1, MAV_FRAME_LOCAL_OFFSET_NED = 7, MAV_FRAME_BODY_NED = 8, MAV_FRAME_BODY_OFFSET_NED
    // = 9
    CoordinateFrame: MavFrame;
    // Bitmap to indicate which dimensions should be ignored by the vehicle.
    TypeMask: PositionTargetTypemaskBitmask;
    // X Position in NED frame
    X: float32;
    // Y Position in NED frame
    Y: float32;
    // Z Position in NED frame (note, altitude is negative in NED)
    Z: float32;
    // X velocity in NED frame
    Vx: float32;
    // Y velocity in NED frame
    Vy: float32;
    // Z velocity in NED frame
    Vz: float32;
    // X acceleration or force (if bit 10 of type_mask is set) in NED frame in meter / s^2 or N
    Afx: float32;
    // Y acceleration or force (if bit 10 of type_mask is set) in NED frame in meter / s^2 or N
    Afy: float32;
    // Z acceleration or force (if bit 10 of type_mask is set) in NED frame in meter / s^2 or N
    Afz: float32;
    // yaw setpoint
    Yaw: float32;
    // yaw rate setpoint
    YawRate: float32;
}

message struct SimState extends MessageFrame {
    // True attitude quaternion component 1, w (1 in null-rotation)
    Q1: float32;
    // True attitude quaternion component 2, x (0 in null-rotation)
    Q2: float32;
    // True attitude quaternion component 3, y (0 in null-rotation)
    Q3: float32;
    // True attitude quaternion component 4, z (0 in null-rotation)
    Q4: float32;
    // Attitude roll expressed as Euler angles, not recommended except for human-readable outputs
    Roll: float32;
    // Attitude pitch expressed as Euler angles, not recommended except for human-readable outputs
    Pitch: float32;
    // Attitude yaw expressed as Euler angles, not recommended except for human-readable outputs
    Yaw: float32;
    // X acceleration
    Xacc: float32;
    // Y acceleration
    Yacc: float32;
    // Z acceleration
    Zacc: float32;
    // Angular speed around X axis
    Xgyro: float32;
    // Angular speed around Y axis
    Ygyro: float32;
    // Angular speed around Z axis
    Zgyro: float32;
    // Latitude
    Lat: float32;
    // Longitude
    Lon: float32;
    // Altitude
    Alt: float32;
    // Horizontal position standard deviation
    StdDevHorz: float32;
    // Vertical position standard deviation
    StdDevVert: float32;
    // True velocity in north direction in earth-fixed NED frame
    Vn: float32;
    // True velocity in east direction in earth-fixed NED frame
    Ve: float32;
    // True velocity in down direction in earth-fixed NED frame
    Vd: float32;
}

message struct SmartBatteryInfo extends MessageFrame {
    // Battery ID
    Id: uint8;
    // Function of the battery
    BatteryFunction: MavBatteryFunction;
    // Type (chemistry) of the battery
    Type: MavBatteryType;
    // Capacity when full according to manufacturer, -1: field not provided.
    CapacityFullSpecification: int32;
    // Capacity when full (accounting for battery degradation), -1: field not provided.
    CapacityFull: int32;
    // Charge/discharge cycle count. UINT16_MAX: field not provided.
    CycleCount: uint16;
    // Serial number in ASCII characters, 0 terminated. All 0: field not provided.
    @Length(16)
    SerialNumber: string;
    // Static device name in ASCII characters, 0 terminated. All 0: field not provided. Encode as manufacturer
    // name then product name separated using an underscore.
    @Length(50)
    DeviceName: string;
    // Battery weight. 0: field not provided.
    Weight: uint16;
    // Minimum per-cell voltage when discharging. If not supplied set to UINT16_MAX value.
    DischargeMinimumVoltage: uint16;
    // Minimum per-cell voltage when charging. If not supplied set to UINT16_MAX value.
    ChargingMinimumVoltage: uint16;
    // Minimum per-cell voltage when resting. If not supplied set to UINT16_MAX value.
    RestingMinimumVoltage: uint16;
    SmartBatteryInfo_extensions: Optional<SmartBatteryInfo_extension>;
    }

struct SmartBatteryInfo_extension {
    // Maximum per-cell voltage when charged. 0: field not provided.
    ChargingMaximumVoltage: uint16;
    // Number of battery cells in series. 0: field not provided.
    CellsInSeries: uint8;
    // Maximum pack discharge current. 0: field not provided.
    DischargeMaximumCurrent: uint32;
    // Maximum pack discharge burst current. 0: field not provided.
    DischargeMaximumBurstCurrent: uint32;
    // Manufacture date (DD/MM/YYYY) in ASCII characters, 0 terminated. All 0: field not provided.
    @Length(11)
    ManufactureDate: string;
}

message struct Statustext extends MessageFrame {
    // Severity of status. Relies on the definitions within RFC-5424.
    Severity: MavSeverity;
    // Status text message, without null termination character
    @Length(50)
    Text: string;
    Statustext_extensions: Optional<Statustext_extension>;
    }

struct Statustext_extension {
    // Unique (opaque) identifier for this statustext message. May be used to reassemble a logical long-statustext
    // message from a sequence of chunks. A value of zero indicates this is the only chunk in the sequence and
    // the message can be emitted immediately.
    Id: uint16;
    // This chunk's sequence number; indexing is from zero. Any null character in the text field is taken to
    // mean this was the last chunk.
    ChunkSeq: uint8;
}

message struct StorageInformation extends MessageFrame {
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
    // Storage ID (1 for first, 2 for second, etc.)
    StorageId: uint8;
    // Number of storage devices
    StorageCount: uint8;
    // Status of storage
    Status: StorageStatus;
    // Total capacity. If storage is not ready (STORAGE_STATUS_READY) value will be ignored.
    TotalCapacity: float32;
    // Used capacity. If storage is not ready (STORAGE_STATUS_READY) value will be ignored.
    UsedCapacity: float32;
    // Available storage capacity. If storage is not ready (STORAGE_STATUS_READY) value will be ignored.
    AvailableCapacity: float32;
    // Read speed.
    ReadSpeed: float32;
    // Write speed.
    WriteSpeed: float32;
    StorageInformation_extensions: Optional<StorageInformation_extension>;
    }

struct StorageInformation_extension {
    // Type of storage
    Type: StorageType;
    // Textual storage name to be used in UI (microSD 1, Internal Memory, etc.) This is a NULL terminated string.
    // If it is exactly 32 characters long, add a terminating NULL. If this string is empty, the generic type
    // is shown to the user.
    @Length(32)
    Name: string;
    // Flags indicating whether this instance is preferred storage for photos, videos, etc. Note: Implementations
    // should initially set the flags on the system-default storage id used for saving media (if possible/supported).
    // This setting can then be overridden using MAV_CMD_SET_STORAGE_USAGE. If the media usage flags are not
    // set, a GCS may assume storage ID 1 is the default storage for all media types.
    StorageUsage: StorageUsageFlag;
}

message struct SupportedTunes extends MessageFrame {
    // System ID
    TargetSystem: uint8;
    // Component ID
    TargetComponent: uint8;
    // Bitfield of supported tune formats.
    Format: TuneFormatBitmask;
}

message struct SystemTime extends MessageFrame {
    // Timestamp (UNIX epoch time).
    TimeUnixUsec: uint64;
    // Timestamp (time since system boot).
    TimeBootMs: uint32;
}

message struct SysStatus extends MessageFrame {
    // Bitmap showing which onboard controllers and sensors are present. Value of 0: not present. Value of 1:
    // present.
    OnboardControlSensorsPresent: MavSysStatusSensorBitmask;
    // Bitmap showing which onboard controllers and sensors are enabled: Value of 0: not enabled. Value of 1:
    // enabled.
    OnboardControlSensorsEnabled: MavSysStatusSensorBitmask;
    // Bitmap showing which onboard controllers and sensors have an error (or are operational). Value of 0: error.
    // Value of 1: healthy.
    OnboardControlSensorsHealth: MavSysStatusSensorBitmask;
    // Maximum usage in percent of the mainloop time. Values: [0-1000] - should always be below 1000
    Load: uint16;
    // Battery voltage, UINT16_MAX: Voltage not sent by autopilot
    VoltageBattery: uint16;
    // Battery current, -1: Current not sent by autopilot
    CurrentBattery: int16;
    // Battery energy remaining, -1: Battery remaining energy not sent by autopilot
    BatteryRemaining: int8;
    // Communication drop rate, (UART, I2C, SPI, CAN), dropped packets on all links (packets that were corrupted
    // on reception on the MAV)
    DropRateComm: uint16;
    // Communication errors (UART, I2C, SPI, CAN), dropped packets on all links (packets that were corrupted
    // on reception on the MAV)
    ErrorsComm: uint16;
    // Autopilot-specific errors
    ErrorsCount1: uint16;
    // Autopilot-specific errors
    ErrorsCount2: uint16;
    // Autopilot-specific errors
    ErrorsCount3: uint16;
    // Autopilot-specific errors
    ErrorsCount4: uint16;
    SysStatus_extensions: Optional<SysStatus_extension>;
    }

struct SysStatus_extension {
    // Bitmap showing which onboard controllers and sensors are present. Value of 0: not present. Value of 1:
    // present.
    OnboardControlSensorsPresentExtended: MavSysStatusSensorExtendedBitmask;
    // Bitmap showing which onboard controllers and sensors are enabled: Value of 0: not enabled. Value of 1:
    // enabled.
    OnboardControlSensorsEnabledExtended: MavSysStatusSensorExtendedBitmask;
    // Bitmap showing which onboard controllers and sensors have an error (or are operational). Value of 0: error.
    // Value of 1: healthy.
    OnboardControlSensorsHealthExtended: MavSysStatusSensorExtendedBitmask;
}

message struct TerrainCheck extends MessageFrame {
    // Latitude
    Lat: int32;
    // Longitude
    Lon: int32;
}

message struct TerrainData extends MessageFrame {
    // Latitude of SW corner of first grid
    Lat: int32;
    // Longitude of SW corner of first grid
    Lon: int32;
    // Grid spacing
    GridSpacing: uint16;
    // bit within the terrain request mask
    Gridbit: uint8;
    // Terrain data MSL
    @Length(16)
    Data: int16[];
}

message struct TerrainReport extends MessageFrame {
    // Latitude
    Lat: int32;
    // Longitude
    Lon: int32;
    // grid spacing (zero if terrain at this location unavailable)
    Spacing: uint16;
    // Terrain height MSL
    TerrainHeight: float32;
    // Current vehicle height above lat/lon terrain height
    CurrentHeight: float32;
    // Number of 4x4 terrain blocks waiting to be received or read from disk
    Pending: uint16;
    // Number of 4x4 terrain blocks in memory
    Loaded: uint16;
}

message struct TerrainRequest extends MessageFrame {
    // Latitude of SW corner of first grid
    Lat: int32;
    // Longitude of SW corner of first grid
    Lon: int32;
    // Grid spacing
    GridSpacing: uint16;
    // Bitmask of requested 4x4 grids (row major 8x7 array of grids, 56 bits)
    Mask: uint64;
}

message struct Timesync extends MessageFrame {
    // Time sync timestamp 1
    Tc1: int64;
    // Time sync timestamp 2
    Ts1: int64;
}



message struct TrajectoryRepresentationBezier extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Number of valid control points (up-to 5 points are possible)
    ValidPoints: uint8;
    // X-coordinate of bezier control points. Set to NaN if not being used
    @Length(5)
    PosX: float32[];
    // Y-coordinate of bezier control points. Set to NaN if not being used
    @Length(5)
    PosY: float32[];
    // Z-coordinate of bezier control points. Set to NaN if not being used
    @Length(5)
    PosZ: float32[];
    // Bezier time horizon. Set to NaN if velocity/acceleration should not be incorporated
    @Length(5)
    Delta: float32[];
    // Yaw. Set to NaN for unchanged
    @Length(5)
    PosYaw: float32[];
}

message struct TrajectoryRepresentationWaypoints extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Number of valid points (up-to 5 waypoints are possible)
    ValidPoints: uint8;
    // X-coordinate of waypoint, set to NaN if not being used
    @Length(5)
    PosX: float32[];
    // Y-coordinate of waypoint, set to NaN if not being used
    @Length(5)
    PosY: float32[];
    // Z-coordinate of waypoint, set to NaN if not being used
    @Length(5)
    PosZ: float32[];
    // X-velocity of waypoint, set to NaN if not being used
    @Length(5)
    VelX: float32[];
    // Y-velocity of waypoint, set to NaN if not being used
    @Length(5)
    VelY: float32[];
    // Z-velocity of waypoint, set to NaN if not being used
    @Length(5)
    VelZ: float32[];
    // X-acceleration of waypoint, set to NaN if not being used
    @Length(5)
    AccX: float32[];
    // Y-acceleration of waypoint, set to NaN if not being used
    @Length(5)
    AccY: float32[];
    // Z-acceleration of waypoint, set to NaN if not being used
    @Length(5)
    AccZ: float32[];
    // Yaw angle, set to NaN if not being used
    @Length(5)
    PosYaw: float32[];
    // Yaw rate, set to NaN if not being used
    @Length(5)
    VelYaw: float32[];
    // MAV_CMD command id of waypoint, set to UINT16_MAX if not being used.
    Command: MavCmd_ID;
}

message struct Tunnel extends MessageFrame {
    // System ID (can be 0 for broadcast, but this is discouraged)
    TargetSystem: uint8;
    // Component ID (can be 0 for broadcast, but this is discouraged)
    TargetComponent: uint8;
    // A code that identifies the content of the payload (0 for unknown, which is the default). If this code
    // is less than 32768, it is a 'registered' payload type and the corresponding code should be added to the
    // MAV_TUNNEL_PAYLOAD_TYPE enum. Software creators can register blocks of types as needed. Codes greater
    // than 32767 are considered local experiments and should not be checked in to any widely distributed codebase.
    PayloadType: MavTunnelPayloadType;
    // Length of the data transported in payload
    PayloadLength: uint8;
    // Variable length payload. The payload length is defined by payload_length. The entire content of this block
    // is opaque unless you understand the encoding specified by payload_type.
    @Length(128)
    Payload: uint8[];
}

message struct UavcanNodeInfo extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Time since the start-up of the node.
    UptimeSec: uint32;
    // Node name string. For example, "sapog.px4.io".
    @Length(80)
    Name: string;
    // Hardware major version number.
    HwVersionMajor: uint8;
    // Hardware minor version number.
    HwVersionMinor: uint8;
    // Hardware unique 128-bit ID.
    @Length(16)
    HwUniqueId: uint8[];
    // Software major version number.
    SwVersionMajor: uint8;
    // Software minor version number.
    SwVersionMinor: uint8;
    // Version control system (VCS) revision identifier (e.g. git short commit hash). 0 if unknown.
    SwVcsCommit: uint32;
}

message struct UavcanNodeStatus extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Time since the start-up of the node.
    UptimeSec: uint32;
    // Generalized node health status.
    Health: UavcanNodeHealth;
    // Generalized operating mode.
    Mode: UavcanNodeMode;
    // Not used currently.
    SubMode: uint8;
    // Vendor-specific status information.
    VendorSpecificStatusCode: uint16;
}

message struct UtmGlobalPosition extends MessageFrame {
    // Time of applicability of position (microseconds since UNIX epoch).
    Time: uint64;
    // Unique UAS ID.
    @Length(18)
    UasId: uint8[];
    // Latitude (WGS84)
    Lat: int32;
    // Longitude (WGS84)
    Lon: int32;
    // Altitude (WGS84)
    Alt: int32;
    // Altitude above ground
    RelativeAlt: int32;
    // Ground X speed (latitude, positive north)
    Vx: int16;
    // Ground Y speed (longitude, positive east)
    Vy: int16;
    // Ground Z speed (altitude, positive down)
    Vz: int16;
    // Horizontal position uncertainty (standard deviation)
    HAcc: uint16;
    // Altitude uncertainty (standard deviation)
    VAcc: uint16;
    // Speed uncertainty (standard deviation)
    VelAcc: uint16;
    // Next waypoint, latitude (WGS84)
    NextLat: int32;
    // Next waypoint, longitude (WGS84)
    NextLon: int32;
    // Next waypoint, altitude (WGS84)
    NextAlt: int32;
    // Time until next update. Set to 0 if unknown or in data driven mode.
    UpdateRate: uint16;
    // Flight state
    FlightState: UtmFlightState;
    // Bitwise OR combination of the data available flags.
    Flags: UtmDataAvailFlagsBitmask;
}

message struct V2Extension extends MessageFrame {
    // Network ID (0 for broadcast)
    TargetNetwork: uint8;
    // System ID (0 for broadcast)
    TargetSystem: uint8;
    // Component ID (0 for broadcast)
    TargetComponent: uint8;
    // A code that identifies the software component that understands this message (analogous to USB device classes
    // or mime type strings). If this code is less than 32768, it is considered a 'registered' protocol extension
    // and the corresponding entry should be added to https://github.com/mavlink/mavlink/definition_files/extension_message_ids.xml.
    // Software creators can register blocks of message IDs as needed (useful for GCS specific metadata, etc...).
    // Message_types greater than 32767 are considered local experiments and should not be checked in to any
    // widely distributed codebase.
    MessageType: uint16;
    // Variable length payload. The length must be encoded in the payload as part of the message_type protocol,
    // e.g. by including the length as payload data, or by terminating the payload data with a non-zero marker.
    // This is required in order to reconstruct zero-terminated payloads that are (or otherwise would be) trimmed
    // by MAVLink 2 empty-byte truncation. The entire content of the payload block is opaque unless you understand
    // the encoding message_type. The particular encoding used can be extension specific and might not always
    // be documented as part of the MAVLink specification.
    @Length(249)
    Payload: uint8[];
}

message struct VfrHud extends MessageFrame {
    // Vehicle speed in form appropriate for vehicle type. For standard aircraft this is typically calibrated
    // airspeed (CAS) or indicated airspeed (IAS) - either of which can be used by a pilot to estimate stall
    // speed.
    Airspeed: float32;
    // Current ground speed.
    Groundspeed: float32;
    // Current heading in compass units (0-360, 0=north).
    Heading: int16;
    // Current throttle setting (0 to 100).
    Throttle: uint16;
    // Current altitude (MSL).
    Alt: float32;
    // Current climb rate.
    Climb: float32;
}

message struct Vibration extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Vibration levels on X-axis
    VibrationX: float32;
    // Vibration levels on Y-axis
    VibrationY: float32;
    // Vibration levels on Z-axis
    VibrationZ: float32;
    // first accelerometer clipping count
    Clipping0: uint32;
    // second accelerometer clipping count
    Clipping1: uint32;
    // third accelerometer clipping count
    Clipping2: uint32;
}

message struct ViconPositionEstimate extends MessageFrame {
    // Timestamp (UNIX time or time since system boot)
    Usec: uint64;
    // Global X position
    X: float32;
    // Global Y position
    Y: float32;
    // Global Z position
    Z: float32;
    // Roll angle
    Roll: float32;
    // Pitch angle
    Pitch: float32;
    // Yaw angle
    Yaw: float32;
    ViconPositionEstimate_extensions: Optional<ViconPositionEstimate_extension>;
    }

struct ViconPositionEstimate_extension {
    // Row-major representation of 6x6 pose cross-covariance matrix upper right triangle (states: x, y, z, roll,
    // pitch, yaw; first six entries are the first ROW, next five entries are the second ROW, etc.). If unknown,
    // assign NaN value to first element in the array.
    @Length(21)
    Covariance: float32[];
}

message struct VideoStreamInformation extends MessageFrame {
    // Video Stream ID (1 for first, 2 for second, etc.)
    StreamId: uint8;
    // Number of streams available.
    Count: uint8;
    // Type of stream.
    Type: VideoStreamType;
    // Bitmap of stream status flags.
    Flags: VideoStreamStatusFlagsBitmask;
    // Frame rate.
    Framerate: float32;
    // Horizontal resolution.
    ResolutionH: uint16;
    // Vertical resolution.
    ResolutionV: uint16;
    // Bit rate.
    RateBit: uint32;
    // Video image rotation clockwise.
    Rotation: uint16;
    // Horizontal Field of view.
    Hfov: uint16;
    // Stream name.
    @Length(32)
    Name: string;
    // Video stream URI (TCP or RTSP URI ground station should connect to) or port number (UDP port ground station
    // should listen to).
    @Length(160)
    Uri: string;
}

message struct VideoStreamStatus extends MessageFrame {
    // Video Stream ID (1 for first, 2 for second, etc.)
    StreamId: uint8;
    // Bitmap of stream status flags
    Flags: VideoStreamStatusFlagsBitmask;
    // Frame rate
    Framerate: float32;
    // Horizontal resolution
    ResolutionH: uint16;
    // Vertical resolution
    ResolutionV: uint16;
    // Bit rate
    RateBit: uint32;
    // Video image rotation clockwise
    Rotation: uint16;
    // Horizontal Field of view
    Hfov: uint16;
}

message struct VisionPositionEstimate extends MessageFrame {
    // Timestamp (UNIX time or time since system boot)
    Usec: uint64;
    // Local X position
    X: float32;
    // Local Y position
    Y: float32;
    // Local Z position
    Z: float32;
    // Roll angle
    Roll: float32;
    // Pitch angle
    Pitch: float32;
    // Yaw angle
    Yaw: float32;
    VisionPositionEstimate_extensions: Optional<VisionPositionEstimate_extension>;
    }

struct VisionPositionEstimate_extension {
    // Row-major representation of pose 6x6 cross-covariance matrix upper right triangle (states: x, y, z, roll,
    // pitch, yaw; first six entries are the first ROW, next five entries are the second ROW, etc.). If unknown,
    // assign NaN value to first element in the array.
    @Length(21)
    Covariance: float32[];
    // Estimate reset counter. This should be incremented when the estimate resets in any of the dimensions (position,
    // velocity, attitude, angular speed). This is designed to be used when e.g an external SLAM system detects
    // a loop-closure and the estimate jumps.
    ResetCounter: uint8;
}

message struct VisionSpeedEstimate extends MessageFrame {
    // Timestamp (UNIX time or time since system boot)
    Usec: uint64;
    // Global X speed
    X: float32;
    // Global Y speed
    Y: float32;
    // Global Z speed
    Z: float32;
    VisionSpeedEstimate_extensions: Optional<VisionSpeedEstimate_extension>;
    }

struct VisionSpeedEstimate_extension {
    // Row-major representation of 3x3 linear velocity covariance matrix (states: vx, vy, vz; 1st three entries
    // - 1st row, etc.). If unknown, assign NaN value to first element in the array.
    @Length(9)
    Covariance: float32[];
    // Estimate reset counter. This should be incremented when the estimate resets in any of the dimensions (position,
    // velocity, attitude, angular speed). This is designed to be used when e.g an external SLAM system detects
    // a loop-closure and the estimate jumps.
    ResetCounter: uint8;
}

message struct WheelDistance extends MessageFrame {
    // Timestamp (synced to UNIX time or since system boot).
    TimeUsec: uint64;
    // Number of wheels reported.
    Count: uint8;
    // Distance reported by individual wheel encoders. Forward rotations increase values, reverse rotations decrease
    // them. Not all wheels will necessarily have wheel encoders; the mapping of encoders to wheel positions
    // must be agreed/understood by the endpoints.
    @Length(16)
    Distance: float64[];
}

message struct WifiConfigAp extends MessageFrame {
    // Name of Wi-Fi network (SSID). Blank to leave it unchanged when setting. Current SSID when sent back as
    // a response.
    @Length(32)
    Ssid: string;
    // Password. Blank for an open AP. MD5 hash when message is sent back as a response.
    @Length(64)
    Password: string;
    WifiConfigAp_extensions: Optional<WifiConfigAp_extension>;
    }

struct WifiConfigAp_extension {
    // WiFi Mode.
    Mode: WifiConfigApMode;
    // Message acceptance response (sent back to GS).
    Response: WifiConfigApResponse;
}

message struct WinchStatus extends MessageFrame {
    // Timestamp (synced to UNIX time or since system boot).
    TimeUsec: uint64;
    // Length of line released. NaN if unknown
    LineLength: float32;
    // Speed line is being released or retracted. Positive values if being released, negative values if being
    // retracted, NaN if unknown
    Speed: float32;
    // Tension on the line. NaN if unknown
    Tension: float32;
    // Voltage of the battery supplying the winch. NaN if unknown
    Voltage: float32;
    // Current draw from the winch. NaN if unknown
    Current: float32;
    // Temperature of the motor. INT16_MAX if unknown
    Temperature: int16;
    // Status flags
    Status: MavWinchStatusFlagBitmask;
}

message struct WindCov extends MessageFrame {
    // Timestamp (UNIX Epoch time or time since system boot). The receiving end can infer timestamp format (since
    // 1.1.1970 or since system boot) by checking for the magnitude of the number.
    TimeUsec: uint64;
    // Wind in X (NED) direction
    WindX: float32;
    // Wind in Y (NED) direction
    WindY: float32;
    // Wind in Z (NED) direction
    WindZ: float32;
    // Variability of the wind in XY. RMS of a 1 Hz lowpassed wind estimate.
    VarHoriz: float32;
    // Variability of the wind in Z. RMS of a 1 Hz lowpassed wind estimate.
    VarVert: float32;
    // Altitude (MSL) that this measurement was taken at
    WindAlt: float32;
    // Horizontal speed 1-STD accuracy
    HorizAccuracy: float32;
    // Vertical speed 1-STD accuracy
    VertAccuracy: float32;
}

message variant MavCmd {
    MavCmdNavWaypoint(MavCmdNavWaypoint);
    MavCmdNavLoiterUnlim(MavCmdNavLoiterUnlim);
    MavCmdNavLoiterTurns(MavCmdNavLoiterTurns);
    MavCmdNavLoiterTime(MavCmdNavLoiterTime);
    MavCmdNavReturnToLaunch(MavCmdNavReturnToLaunch);
    MavCmdNavLand(MavCmdNavLand);
    MavCmdNavTakeoff(MavCmdNavTakeoff);
    MavCmdNavLandLocal(MavCmdNavLandLocal);
    MavCmdNavTakeoffLocal(MavCmdNavTakeoffLocal);
    MavCmdNavFollow(MavCmdNavFollow);
    MavCmdNavContinueAndChangeAlt(MavCmdNavContinueAndChangeAlt);
    MavCmdNavLoiterToAlt(MavCmdNavLoiterToAlt);
    MavCmdDoFollow(MavCmdDoFollow);
    MavCmdDoFollowReposition(MavCmdDoFollowReposition);
    MavCmdDoOrbit(MavCmdDoOrbit);
    MavCmdNavRoi(MavCmdNavRoi);
    MavCmdNavPathplanning(MavCmdNavPathplanning);
    MavCmdNavSplineWaypoint(MavCmdNavSplineWaypoint);
    MavCmdNavVtolTakeoff(MavCmdNavVtolTakeoff);
    MavCmdNavVtolLand(MavCmdNavVtolLand);
    MavCmdNavGuidedEnable(MavCmdNavGuidedEnable);
    MavCmdNavDelay(MavCmdNavDelay);
    MavCmdNavPayloadPlace(MavCmdNavPayloadPlace);
    MavCmdNavLast(MavCmdNavLast);
    MavCmdConditionDelay(MavCmdConditionDelay);
    MavCmdConditionChangeAlt(MavCmdConditionChangeAlt);
    MavCmdConditionDistance(MavCmdConditionDistance);
    MavCmdConditionYaw(MavCmdConditionYaw);
    MavCmdConditionLast(MavCmdConditionLast);
    MavCmdDoSetMode(MavCmdDoSetMode);
    MavCmdDoJump(MavCmdDoJump);
    MavCmdDoChangeSpeed(MavCmdDoChangeSpeed);
    MavCmdDoSetHome(MavCmdDoSetHome);
    MavCmdDoSetParameter(MavCmdDoSetParameter);
    MavCmdDoSetRelay(MavCmdDoSetRelay);
    MavCmdDoRepeatRelay(MavCmdDoRepeatRelay);
    MavCmdDoSetServo(MavCmdDoSetServo);
    MavCmdDoRepeatServo(MavCmdDoRepeatServo);
    MavCmdDoFlighttermination(MavCmdDoFlighttermination);
    MavCmdDoChangeAltitude(MavCmdDoChangeAltitude);
    MavCmdDoSetActuator(MavCmdDoSetActuator);
    MavCmdDoLandStart(MavCmdDoLandStart);
    MavCmdDoRallyLand(MavCmdDoRallyLand);
    MavCmdDoGoAround(MavCmdDoGoAround);
    MavCmdDoReposition(MavCmdDoReposition);
    MavCmdDoPauseContinue(MavCmdDoPauseContinue);
    MavCmdDoSetReverse(MavCmdDoSetReverse);
    MavCmdDoSetRoiLocation(MavCmdDoSetRoiLocation);
    MavCmdDoSetRoiWpnextOffset(MavCmdDoSetRoiWpnextOffset);
    MavCmdDoSetRoiNone(MavCmdDoSetRoiNone);
    MavCmdDoSetRoiSysid(MavCmdDoSetRoiSysid);
    MavCmdDoControlVideo(MavCmdDoControlVideo);
    MavCmdDoSetRoi(MavCmdDoSetRoi);
    MavCmdDoDigicamConfigure(MavCmdDoDigicamConfigure);
    MavCmdDoDigicamControl(MavCmdDoDigicamControl);
    MavCmdDoMountConfigure(MavCmdDoMountConfigure);
    MavCmdDoMountControl(MavCmdDoMountControl);
    MavCmdDoSetCamTriggDist(MavCmdDoSetCamTriggDist);
    MavCmdDoFenceEnable(MavCmdDoFenceEnable);
    MavCmdDoParachute(MavCmdDoParachute);
    MavCmdDoMotorTest(MavCmdDoMotorTest);
    MavCmdDoInvertedFlight(MavCmdDoInvertedFlight);
    MavCmdDoGripper(MavCmdDoGripper);
    MavCmdDoAutotuneEnable(MavCmdDoAutotuneEnable);
    MavCmdNavSetYawSpeed(MavCmdNavSetYawSpeed);
    MavCmdDoSetCamTriggInterval(MavCmdDoSetCamTriggInterval);
    MavCmdDoMountControlQuat(MavCmdDoMountControlQuat);
    MavCmdDoGuidedMaster(MavCmdDoGuidedMaster);
    MavCmdDoGuidedLimits(MavCmdDoGuidedLimits);
    MavCmdDoEngineControl(MavCmdDoEngineControl);
    MavCmdDoSetMissionCurrent(MavCmdDoSetMissionCurrent);
    MavCmdDoLast(MavCmdDoLast);
    MavCmdPreflightCalibration(MavCmdPreflightCalibration);
    MavCmdPreflightSetSensorOffsets(MavCmdPreflightSetSensorOffsets);
    MavCmdPreflightUavcan(MavCmdPreflightUavcan);
    MavCmdPreflightStorage(MavCmdPreflightStorage);
    MavCmdPreflightRebootShutdown(MavCmdPreflightRebootShutdown);
    MavCmdOverrideGoto(MavCmdOverrideGoto);
    MavCmdObliqueSurvey(MavCmdObliqueSurvey);
    MavCmdMissionStart(MavCmdMissionStart);
    MavCmdActuatorTest(MavCmdActuatorTest);
    MavCmdConfigureActuator(MavCmdConfigureActuator);
    MavCmdComponentArmDisarm(MavCmdComponentArmDisarm);
    MavCmdRunPrearmChecks(MavCmdRunPrearmChecks);
    MavCmdIlluminatorOnOff(MavCmdIlluminatorOnOff);
    MavCmdGetHomePosition(MavCmdGetHomePosition);
    MavCmdInjectFailure(MavCmdInjectFailure);
    MavCmdStartRxPair(MavCmdStartRxPair);
    MavCmdGetMessageInterval(MavCmdGetMessageInterval);
    MavCmdSetMessageInterval(MavCmdSetMessageInterval);
    MavCmdRequestMessage(MavCmdRequestMessage);
    MavCmdRequestProtocolVersion(MavCmdRequestProtocolVersion);
    MavCmdRequestAutopilotCapabilities(MavCmdRequestAutopilotCapabilities);
    MavCmdRequestCameraInformation(MavCmdRequestCameraInformation);
    MavCmdRequestCameraSettings(MavCmdRequestCameraSettings);
    MavCmdRequestStorageInformation(MavCmdRequestStorageInformation);
    MavCmdStorageFormat(MavCmdStorageFormat);
    MavCmdRequestCameraCaptureStatus(MavCmdRequestCameraCaptureStatus);
    MavCmdRequestFlightInformation(MavCmdRequestFlightInformation);
    MavCmdResetCameraSettings(MavCmdResetCameraSettings);
    MavCmdSetCameraMode(MavCmdSetCameraMode);
    MavCmdSetCameraZoom(MavCmdSetCameraZoom);
    MavCmdSetCameraFocus(MavCmdSetCameraFocus);
    MavCmdSetStorageUsage(MavCmdSetStorageUsage);
    MavCmdJumpTag(MavCmdJumpTag);
    MavCmdDoJumpTag(MavCmdDoJumpTag);
    MavCmdDoGimbalManagerPitchyaw(MavCmdDoGimbalManagerPitchyaw);
    MavCmdDoGimbalManagerConfigure(MavCmdDoGimbalManagerConfigure);
    MavCmdImageStartCapture(MavCmdImageStartCapture);
    MavCmdImageStopCapture(MavCmdImageStopCapture);
    MavCmdRequestCameraImageCapture(MavCmdRequestCameraImageCapture);
    MavCmdDoTriggerControl(MavCmdDoTriggerControl);
    MavCmdCameraTrackPoint(MavCmdCameraTrackPoint);
    MavCmdCameraTrackRectangle(MavCmdCameraTrackRectangle);
    MavCmdCameraStopTracking(MavCmdCameraStopTracking);
    MavCmdVideoStartCapture(MavCmdVideoStartCapture);
    MavCmdVideoStopCapture(MavCmdVideoStopCapture);
    MavCmdVideoStartStreaming(MavCmdVideoStartStreaming);
    MavCmdVideoStopStreaming(MavCmdVideoStopStreaming);
    MavCmdRequestVideoStreamInformation(MavCmdRequestVideoStreamInformation);
    MavCmdRequestVideoStreamStatus(MavCmdRequestVideoStreamStatus);
    MavCmdLoggingStart(MavCmdLoggingStart);
    MavCmdLoggingStop(MavCmdLoggingStop);
    MavCmdAirframeConfiguration(MavCmdAirframeConfiguration);
    MavCmdControlHighLatency(MavCmdControlHighLatency);
    MavCmdPanoramaCreate(MavCmdPanoramaCreate);
    MavCmdDoVtolTransition(MavCmdDoVtolTransition);
    MavCmdArmAuthorizationRequest(MavCmdArmAuthorizationRequest);
    MavCmdSetGuidedSubmodeStandard(MavCmdSetGuidedSubmodeStandard);
    MavCmdSetGuidedSubmodeCircle(MavCmdSetGuidedSubmodeCircle);
    MavCmdConditionGate(MavCmdConditionGate);
    MavCmdNavFenceReturnPoint(MavCmdNavFenceReturnPoint);
    MavCmdNavFencePolygonVertexInclusion(MavCmdNavFencePolygonVertexInclusion);
    MavCmdNavFencePolygonVertexExclusion(MavCmdNavFencePolygonVertexExclusion);
    MavCmdNavFenceCircleInclusion(MavCmdNavFenceCircleInclusion);
    MavCmdNavFenceCircleExclusion(MavCmdNavFenceCircleExclusion);
    MavCmdNavRallyPoint(MavCmdNavRallyPoint);
    MavCmdUavcanGetNodeInfo(MavCmdUavcanGetNodeInfo);
    MavCmdDoAdsbOutIdent(MavCmdDoAdsbOutIdent);
    MavCmdPayloadPrepareDeploy(MavCmdPayloadPrepareDeploy);
    MavCmdPayloadControlDeploy(MavCmdPayloadControlDeploy);
    MavCmdFixedMagCalYaw(MavCmdFixedMagCalYaw);
    MavCmdDoWinch(MavCmdDoWinch);
    MavCmdWaypointUser1(MavCmdWaypointUser1);
    MavCmdWaypointUser2(MavCmdWaypointUser2);
    MavCmdWaypointUser3(MavCmdWaypointUser3);
    MavCmdWaypointUser4(MavCmdWaypointUser4);
    MavCmdWaypointUser5(MavCmdWaypointUser5);
    MavCmdSpatialUser1(MavCmdSpatialUser1);
    MavCmdSpatialUser2(MavCmdSpatialUser2);
    MavCmdSpatialUser3(MavCmdSpatialUser3);
    MavCmdSpatialUser4(MavCmdSpatialUser4);
    MavCmdSpatialUser5(MavCmdSpatialUser5);
    MavCmdUser1(MavCmdUser1);
    MavCmdUser2(MavCmdUser2);
    MavCmdUser3(MavCmdUser3);
    MavCmdUser4(MavCmdUser4);
    MavCmdUser5(MavCmdUser5);
}

enum MavCmd_ID uint16 {
    MavCmdNavWaypoint = 16;
    MavCmdNavLoiterUnlim = 17;
    MavCmdNavLoiterTurns = 18;
    MavCmdNavLoiterTime = 19;
    MavCmdNavReturnToLaunch = 20;
    MavCmdNavLand = 21;
    MavCmdNavTakeoff = 22;
    MavCmdNavLandLocal = 23;
    MavCmdNavTakeoffLocal = 24;
    MavCmdNavFollow = 25;
    MavCmdNavContinueAndChangeAlt = 30;
    MavCmdNavLoiterToAlt = 31;
    MavCmdDoFollow = 32;
    MavCmdDoFollowReposition = 33;
    MavCmdDoOrbit = 34;
    MavCmdNavRoi = 80;
    MavCmdNavPathplanning = 81;
    MavCmdNavSplineWaypoint = 82;
    MavCmdNavVtolTakeoff = 84;
    MavCmdNavVtolLand = 85;
    MavCmdNavGuidedEnable = 92;
    MavCmdNavDelay = 93;
    MavCmdNavPayloadPlace = 94;
    MavCmdNavLast = 95;
    MavCmdConditionDelay = 112;
    MavCmdConditionChangeAlt = 113;
    MavCmdConditionDistance = 114;
    MavCmdConditionYaw = 115;
    MavCmdConditionLast = 159;
    MavCmdDoSetMode = 176;
    MavCmdDoJump = 177;
    MavCmdDoChangeSpeed = 178;
    MavCmdDoSetHome = 179;
    MavCmdDoSetParameter = 180;
    MavCmdDoSetRelay = 181;
    MavCmdDoRepeatRelay = 182;
    MavCmdDoSetServo = 183;
    MavCmdDoRepeatServo = 184;
    MavCmdDoFlighttermination = 185;
    MavCmdDoChangeAltitude = 186;
    MavCmdDoSetActuator = 187;
    MavCmdDoLandStart = 189;
    MavCmdDoRallyLand = 190;
    MavCmdDoGoAround = 191;
    MavCmdDoReposition = 192;
    MavCmdDoPauseContinue = 193;
    MavCmdDoSetReverse = 194;
    MavCmdDoSetRoiLocation = 195;
    MavCmdDoSetRoiWpnextOffset = 196;
    MavCmdDoSetRoiNone = 197;
    MavCmdDoSetRoiSysid = 198;
    MavCmdDoControlVideo = 200;
    MavCmdDoSetRoi = 201;
    MavCmdDoDigicamConfigure = 202;
    MavCmdDoDigicamControl = 203;
    MavCmdDoMountConfigure = 204;
    MavCmdDoMountControl = 205;
    MavCmdDoSetCamTriggDist = 206;
    MavCmdDoFenceEnable = 207;
    MavCmdDoParachute = 208;
    MavCmdDoMotorTest = 209;
    MavCmdDoInvertedFlight = 210;
    MavCmdDoGripper = 211;
    MavCmdDoAutotuneEnable = 212;
    MavCmdNavSetYawSpeed = 213;
    MavCmdDoSetCamTriggInterval = 214;
    MavCmdDoMountControlQuat = 220;
    MavCmdDoGuidedMaster = 221;
    MavCmdDoGuidedLimits = 222;
    MavCmdDoEngineControl = 223;
    MavCmdDoSetMissionCurrent = 224;
    MavCmdDoLast = 240;
    MavCmdPreflightCalibration = 241;
    MavCmdPreflightSetSensorOffsets = 242;
    MavCmdPreflightUavcan = 243;
    MavCmdPreflightStorage = 245;
    MavCmdPreflightRebootShutdown = 246;
    MavCmdOverrideGoto = 252;
    MavCmdObliqueSurvey = 260;
    MavCmdMissionStart = 300;
    MavCmdActuatorTest = 310;
    MavCmdConfigureActuator = 311;
    MavCmdComponentArmDisarm = 400;
    MavCmdRunPrearmChecks = 401;
    MavCmdIlluminatorOnOff = 405;
    MavCmdGetHomePosition = 410;
    MavCmdInjectFailure = 420;
    MavCmdStartRxPair = 500;
    MavCmdGetMessageInterval = 510;
    MavCmdSetMessageInterval = 511;
    MavCmdRequestMessage = 512;
    MavCmdRequestProtocolVersion = 519;
    MavCmdRequestAutopilotCapabilities = 520;
    MavCmdRequestCameraInformation = 521;
    MavCmdRequestCameraSettings = 522;
    MavCmdRequestStorageInformation = 525;
    MavCmdStorageFormat = 526;
    MavCmdRequestCameraCaptureStatus = 527;
    MavCmdRequestFlightInformation = 528;
    MavCmdResetCameraSettings = 529;
    MavCmdSetCameraMode = 530;
    MavCmdSetCameraZoom = 531;
    MavCmdSetCameraFocus = 532;
    MavCmdSetStorageUsage = 533;
    MavCmdJumpTag = 600;
    MavCmdDoJumpTag = 601;
    MavCmdDoGimbalManagerPitchyaw = 1000;
    MavCmdDoGimbalManagerConfigure = 1001;
    MavCmdImageStartCapture = 2000;
    MavCmdImageStopCapture = 2001;
    MavCmdRequestCameraImageCapture = 2002;
    MavCmdDoTriggerControl = 2003;
    MavCmdCameraTrackPoint = 2004;
    MavCmdCameraTrackRectangle = 2005;
    MavCmdCameraStopTracking = 2010;
    MavCmdVideoStartCapture = 2500;
    MavCmdVideoStopCapture = 2501;
    MavCmdVideoStartStreaming = 2502;
    MavCmdVideoStopStreaming = 2503;
    MavCmdRequestVideoStreamInformation = 2504;
    MavCmdRequestVideoStreamStatus = 2505;
    MavCmdLoggingStart = 2510;
    MavCmdLoggingStop = 2511;
    MavCmdAirframeConfiguration = 2520;
    MavCmdControlHighLatency = 2600;
    MavCmdPanoramaCreate = 2800;
    MavCmdDoVtolTransition = 3000;
    MavCmdArmAuthorizationRequest = 3001;
    MavCmdSetGuidedSubmodeStandard = 4000;
    MavCmdSetGuidedSubmodeCircle = 4001;
    MavCmdConditionGate = 4501;
    MavCmdNavFenceReturnPoint = 5000;
    MavCmdNavFencePolygonVertexInclusion = 5001;
    MavCmdNavFencePolygonVertexExclusion = 5002;
    MavCmdNavFenceCircleInclusion = 5003;
    MavCmdNavFenceCircleExclusion = 5004;
    MavCmdNavRallyPoint = 5100;
    MavCmdUavcanGetNodeInfo = 5200;
    MavCmdDoAdsbOutIdent = 10001;
    MavCmdPayloadPrepareDeploy = 30001;
    MavCmdPayloadControlDeploy = 30002;
    MavCmdFixedMagCalYaw = 42006;
    MavCmdDoWinch = 42600;
    MavCmdWaypointUser1 = 31000;
    MavCmdWaypointUser2 = 31001;
    MavCmdWaypointUser3 = 31002;
    MavCmdWaypointUser4 = 31003;
    MavCmdWaypointUser5 = 31004;
    MavCmdSpatialUser1 = 31005;
    MavCmdSpatialUser2 = 31006;
    MavCmdSpatialUser3 = 31007;
    MavCmdSpatialUser4 = 31008;
    MavCmdSpatialUser5 = 31009;
    MavCmdUser1 = 31010;
    MavCmdUser2 = 31011;
    MavCmdUser3 = 31012;
    MavCmdUser4 = 31013;
    MavCmdUser5 = 31014;
}

struct AdsbFlagsBitmask {
    AdsbFlagsBitmaskFieldSet: AdsbFlags[];
}

struct AisFlagsBitmask {
    AisFlagsBitmaskFieldSet: AisFlags[];
}

struct AttitudeTargetTypemaskBitmask {
    AttitudeTargetTypemaskBitmaskFieldSet: AttitudeTargetTypemask[];
}

struct AutotuneAxisBitmask {
    AutotuneAxisBitmaskFieldSet: AutotuneAxis[];
}

struct CameraCapFlagsBitmask {
    CameraCapFlagsBitmaskFieldSet: CameraCapFlags[];
}

struct CameraTrackingTargetDataBitmask {
    CameraTrackingTargetDataBitmaskFieldSet: CameraTrackingTargetData[];
}

struct EscFailureFlagsBitmask {
    EscFailureFlagsBitmaskFieldSet: EscFailureFlags[];
}

struct EstimatorStatusFlagsBitmask {
    EstimatorStatusFlagsBitmaskFieldSet: EstimatorStatusFlags[];
}

struct GimbalDeviceCapFlagsBitmask {
    GimbalDeviceCapFlagsBitmaskFieldSet: GimbalDeviceCapFlags[];
}

struct GimbalDeviceErrorFlagsBitmask {
    GimbalDeviceErrorFlagsBitmaskFieldSet: GimbalDeviceErrorFlags[];
}

struct GimbalDeviceFlagsBitmask {
    GimbalDeviceFlagsBitmaskFieldSet: GimbalDeviceFlags[];
}

struct GimbalManagerCapFlagsBitmask {
    GimbalManagerCapFlagsBitmaskFieldSet: GimbalManagerCapFlags[];
}

struct GimbalManagerFlagsBitmask {
    GimbalManagerFlagsBitmaskFieldSet: GimbalManagerFlags[];
}

struct GpsInputIgnoreFlagsBitmask {
    GpsInputIgnoreFlagsBitmaskFieldSet: GpsInputIgnoreFlags[];
}

struct HighresImuUpdatedFlagsBitmask {
    HighresImuUpdatedFlagsBitmaskFieldSet: HighresImuUpdatedFlags[];
}

struct HilSensorUpdatedFlagsBitmask {
    HilSensorUpdatedFlagsBitmaskFieldSet: HilSensorUpdatedFlags[];
}

struct HlFailureFlagBitmask {
    HlFailureFlagBitmaskFieldSet: HlFailureFlag[];
}

struct MavBatteryFaultBitmask {
    MavBatteryFaultBitmaskFieldSet: MavBatteryFault[];
}

struct MavDoRepositionFlagsBitmask {
    MavDoRepositionFlagsBitmaskFieldSet: MavDoRepositionFlags[];
}

struct MavEventCurrentSequenceFlagsBitmask {
    MavEventCurrentSequenceFlagsBitmaskFieldSet: MavEventCurrentSequenceFlags[];
}

struct MavGeneratorStatusFlagBitmask {
    MavGeneratorStatusFlagBitmaskFieldSet: MavGeneratorStatusFlag[];
}

struct MavPowerStatusBitmask {
    MavPowerStatusBitmaskFieldSet: MavPowerStatus[];
}

struct MavProtocolCapabilityBitmask {
    MavProtocolCapabilityBitmaskFieldSet: MavProtocolCapability[];
}

struct MavSysStatusSensorBitmask {
    MavSysStatusSensorBitmaskFieldSet: MavSysStatusSensor[];
}

struct MavSysStatusSensorExtendedBitmask {
    MavSysStatusSensorExtendedBitmaskFieldSet: MavSysStatusSensorExtended[];
}

struct MavWinchStatusFlagBitmask {
    MavWinchStatusFlagBitmaskFieldSet: MavWinchStatusFlag[];
}

struct PositionTargetTypemaskBitmask {
    PositionTargetTypemaskBitmaskFieldSet: PositionTargetTypemask[];
}

struct SerialControlFlagBitmask {
    SerialControlFlagBitmaskFieldSet: SerialControlFlag[];
}

struct TuneFormatBitmask {
    TuneFormatBitmaskFieldSet: TuneFormat[];
}

struct UtmDataAvailFlagsBitmask {
    UtmDataAvailFlagsBitmaskFieldSet: UtmDataAvailFlags[];
}

struct VideoStreamStatusFlagsBitmask {
    VideoStreamStatusFlagsBitmaskFieldSet: VideoStreamStatusFlags[];
}

