// MAVLink is available under the MIT-license
module MAVLink::v23.tangramcustom

import tangram::flex::helpers::v1.annotations (Length)

extensible struct MessageFrame {
    // Protocol-specific start-of-text (STX) marker used to indicate the beginning of a new packet. Any system that does not understand protocol version will skip the packet.
    magic : uint8;
    // Indicates length of the following payload section. This may be affected by payload truncation.
    len : uint8;
    // Flags that must be understood for MAVLINK compatibility (implementation discards packet if it does not understand flag).
    incompat_flags : uint8;
    // Flags that can be ignored if not understood (implementation can still handle packet even if it does not understand flag).
    compat_flags : uint8;
    // 	Used to detect packet loss. Components increment value for each message sent.
    seq : uint8;
    // ID of system (vehicle) sending the message. Used to differentiate systems on network. Note that the broadcast address 0 may not be used in this field as it is an invalid source address.
    sysid : uint8;
    // ID of component sending the message. Used to differentiate components in a system (e.g. autopilot and a camera). Use appropriate values in MAV_COMPONENT. Note that the broadcast address MAV_COMP_ID_ALL may not be used in this field as it is an invalid source address.
    compid : uint8;
    // ID of message type in payload. Used to decode data back into message object.
    msgid : uint32;
    // CRC-16/MCRF4XX for message (excluding magic byte). Includes CRC_EXTRA byte.
    checksum : uint16;
    // (Optional) Signature to ensure the link is tamper-proof.
    @Length(13)
    signature : uint8[];
}