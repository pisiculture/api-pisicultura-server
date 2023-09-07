#include <Arduino.h>
#include "WebSocketClient.h"
#include "ESP8266WiFi.h"
#include <ArduinoJson.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <stdio.h>
#include <string.h>

#define WATER_LOCK D6
#define WATER_PUMP D7
#define PH A0

LiquidCrystal_I2C lcd(0x27, 20, 4);
WebSocketClient ws(false);

void setup() {
  pinMode(WATER_PUMP, OUTPUT);
  pinMode(WATER_LOCK, OUTPUT);
  digitalWrite(WATER_PUMP, HIGH);
  digitalWrite(WATER_LOCK, HIGH);
  Serial.begin(921600);
  Serial.println("");
  Serial.println("Inicializando aplicação");
  connetcWifi();
}

void loop() {
  webSocket();
  delay(1000);
  Serial.println(calculatePH());
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
    ws.connect("192.168.0.121", "/", 3000);
    if (ws.isConnected()) {
      ws.send("{ \"event\":\"REGISTER\", \"key\":\"yv1uq7olt9\", \"connection\":\"SOCKET\"}");
      Serial.println("Conexão webSocket realizada com sucesso.");
    }
  } else {
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
  proxy(dto);
}

void proxy(StaticJsonDocument<200> dto) {
  if (dto["action"] == "EXECUTE")
    execute(dto);
  if (dto["action"] == "READ")
    read(dto);
}

void read(StaticJsonDocument<200> dto) {
  Serial.println("Send message");
  bool water_pump = digitalRead(WATER_PUMP) == 1;
  bool water_lock = digitalRead(WATER_LOCK) == 1;
  ws.send("{ \"event\": \"MESSAGE\", \"data\": { \"ph\": " 
  + String(calculatePH()) + ", \"temperature\": "
  + String(30.1) + ", \"water_pump\": " 
  + String(water_pump) + ", \"water_lock\": " 
  + String(water_lock) + "}}");
}

void execute(StaticJsonDocument<200> dto) {
  if (dto.containsKey("water_pump")) {
    if (dto["water_pump"] == 1)
      digitalWrite(WATER_PUMP, LOW);
    else
      digitalWrite(WATER_PUMP, HIGH);
  }
  if (dto.containsKey("water_lock")) {
    if (dto["water_lock"] == 1)
      digitalWrite(WATER_LOCK, LOW);
    else
      digitalWrite(WATER_LOCK, HIGH);
  }
}

float calculatePH() {
  float valor_calibracao = 21.34;
  float soma_tensao = 0;
  float tensao;

  for (int i = 0; i < 10; i++) {
    tensao = (analogRead(PH) * 5.0) / 1024.0;
    soma_tensao = (soma_tensao + tensao);
    delay(100);
  }

  float media = soma_tensao / 10;
  float valor_pH = -5.70 * media + valor_calibracao;
  return valor_pH;
}
