#define TINY_GSM_MODEM_SIM800
#define TINY_GSM_RX_BUFFER 256

#include <TinyGsmClient.h> 
#include <ArduinoHttpClient.h> 
#include <SoftwareSerial.h>
#include <TinyGPS++.h>
//gsm
#define rxPin 27
#define txPin 26

static const int RXPin = 33, TXPin = 32;
static const uint32_t GPSBaud = 19200;
TinyGPSPlus gps;
SoftwareSerial sim800(txPin, rxPin);
// The serial connection to the GPS device
SoftwareSerial gpsSerial(RXPin, TXPin);


const char FIREBASE_HOST[]  = "";
const String FIREBASE_AUTH  = "";
const String FIREBASE_PATH  = "/";
const int SSL_PORT          = 443;

char apn[]  = "gpinternet";//airtel ->"airtelgprs.com"
char user[] = "";
char pass[] = "";

TinyGsm modem(sim800);

TinyGsmClientSecure gsm_client_secure_modem(modem, 0);
HttpClient http_client = HttpClient(gsm_client_secure_modem, FIREBASE_HOST, SSL_PORT);

unsigned long previousMillis = 0;


String busId="323565";


void setup()
{

  pinMode(13, OUTPUT);
  pinMode(23, OUTPUT);

  digitalWrite(13, HIGH);
  digitalWrite(23, HIGH);

  Serial.begin(115200);
  Serial.println("device serial initialize");

  sim800.begin(9600);
  gpsSerial.begin(9600);
  Serial.println("SIM800L serial initialize");

  Serial.println("Initializing modem...");
  modem.restart();
  String modemInfo = modem.getModemInfo();
  Serial.print("Modem: ");
  Serial.println(modemInfo);

  http_client.setHttpResponseTimeout(10 * 1000); //^0 secs timeout
}

void loop()
{

  Serial.print(F("Connecting to "));
  Serial.print(apn);
  if (!modem.gprsConnect(apn, user, pass))
  {
    Serial.println("GPRS failed");
    delay(1000);
    return;
  }
  Serial.println("GPRS OK");

  http_client.connect(FIREBASE_HOST, SSL_PORT);

  while (true) {
    if (!http_client.connected())
    {
      Serial.println();
      http_client.stop();// Shutdown
      Serial.println("HTTP  not connect");
      break;
    }
    else
    {
      //delay(2000);
      //gpsLoop();
    }

  }

}



void PostToFirebase(const char* method, const String & path , const String & data, HttpClient* http)
{
  String response;
  int statusCode = 0;
  http->connectionKeepAlive(); // Currently, this is needed for HTTPS

  String url;
  if (path[0] != '/')
  {
    url = "/";
  }
  url += path + ".json";
  url += "?auth=" + FIREBASE_AUTH;
  Serial.print("POST:");
  Serial.println(url);
  Serial.print("Data:");
  Serial.println(data);

  String contentType = "application/json; charset=utf-8";
  http->put(url, contentType, data);

  statusCode = http->responseStatusCode();
  Serial.print("Status code: ");
  Serial.println(statusCode);
  response = http->responseBody();
  Serial.print("Response: ");
  Serial.println(response);

  if (!http->connected())
  {
    Serial.println();
    http->stop();// Shutdown
    Serial.println("HTTP POST disconnected");
  }

}