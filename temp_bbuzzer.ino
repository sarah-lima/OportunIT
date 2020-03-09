const int LM35 = 1; // entrada sensor no Arduino: A0 - Analógica
float temperatura = 0; // variável tipo float - inícia no 0
int ADClido = 0;
const int verd=7;
const int verm= 8 ; // entrada led:8 - digital
const int azul= 9; // entrada led:9 - digital
 
void setup(){
Serial.begin(9600); // Inicia a comunicação serial
analogReference(INTERNAL);
pinMode(verm, OUTPUT); //saida
pinMode(azul, OUTPUT);
}

 
void loop(){ 
  delay(500); 
  digitalWrite(verd, HIGH); //Acende a led
ADClido = analogRead(LM35);
temperatura = ADClido * 0.1075268817204301; //no Leonardo use 0.4887585532
Serial.print("Temperatura = "); //mostra valor na tela
Serial.print(temperatura); //Mostra a temperatura medida  no monitor serial
Serial.println(" *C");// adiciona o °C
  digitalWrite(verd, LOW); //Desliga a led
   digitalWrite(verm, LOW); //Desliga a led 
   digitalWrite(azul, LOW); //Desliga a led 
if(temperatura > 25){ // se esta acima de 33ºC
      Serial.print("Temperatura Alta "); //Mostra a frase no monitor serial
    Serial.println(temperatura); //Mostra a temperatura medida  no monitor serial
 digitalWrite(verm, HIGH); //Liga led vermelho
}
else{ 
  if(temperatura<23){ //Se está com abaixo de 23°C
    Serial.print("Temperatura baixa: "); //Mostra a frase no monitor serial
    Serial.println(temperatura); //Mostra a temperatura medida  no monitor serial
digitalWrite(azul,HIGH);
  }
   else{ 
  digitalWrite(verm, LOW); //Desliga a led 
  digitalWrite(azul, LOW); //Desliga a led 
 }
}
delay(500); //Tempo de espera
}
