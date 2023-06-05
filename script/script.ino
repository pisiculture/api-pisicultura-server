#include <Arduino.h>
#include "WebSocketClient.h"
#include "ESP8266WiFi.h"
#include <ArduinoJson.h>

WebSocketClient ws(false);

void setup() {
  Serial.begin(921600);
  Serial.println("");
  Serial.println("Inicializando aplicação");
  connetcWifi();
}

void loop() {
  webSocket();
  delay(2000);
}

void connetcWifi() {
  WiFi.begin("Isabela", "10081999");
  Serial.print("Conectando a rede wifi");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("Rede wifi conectada com sucesso...");
}

void webSocket() {
  if (!ws.isConnected()) {
    ws.connect("192.168.0.121", "/ws/message", 8080);
    if (ws.isConnected())
      Serial.println("Conexão webSocket realizada com sucesso.");
  } else {
    ws.send("{'event': 'REGISTER', 'state': 'SUCCESS', 'value': null}");
    String json;
    if (ws.getMessage(json))
      jsonParser(json);
  }
}

void jsonParser(String json) {
  StaticJsonDocument<200> dto;
  DeserializationError error = deserializeJson(dto, json);

  if (error) {
    Serial.print(F("deserializeJson() failed: "));
    Serial.println(error.f_str());
    return;
  }
}

void proxy(StaticJsonDocument<200> dto) {
  if (dto["state"] == "ERROR")
    return;

  if (dto["evento"] == "EXECUTE")
    execute(dto);
}

void execute(StaticJsonDocument<200> dto) {
}
