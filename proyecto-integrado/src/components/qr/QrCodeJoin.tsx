import React from "react";
import QRCodeImport from "react-qr-code";
const QRCode = QRCodeImport as unknown as React.FC<{ value: string; size?: number }>;

interface QRCodeJoinProps {
  roomCode: string;
}

export const QRCodeJoin: React.FC<QRCodeJoinProps> = ({ roomCode }) => {
  const joinUrl = `${window.location.origin}/host?roomCode=${roomCode}`;

  return (
    <div style={{ textAlign: "center", margin: "20px 0" }}>
      <QRCode value={joinUrl} size={128} />
      <p>Escanea este QR para unirte a la sala</p>
    </div>
  );
};