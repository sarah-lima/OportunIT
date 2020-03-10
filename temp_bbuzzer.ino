int pinoSensor = A5;//Saida do sensor na A0
int valorLido = 0;//variavel auxiliar.
float temperatura = 0;//Variavel ue armazenará a temperatura
int linha=0;//variavel  que se refere as linhas do excel
const int verm= 8 ; // entrada led:8 - digital
const int azul= 9; // entrada led:9 - digital
 
void setup(){
Serial.begin(9600); // Inicia a comunicação serial
Serial.println("CLEARDATA");//reset comunicação serial
Serial.println("LABEL, temperatura");//nomeia a coluna
pinMode(verm, OUTPUT); 
pinMode(azul, OUTPUT);
}

 
void loop(){ 
  delay(500); 
  valorLido = analogRead(pinoSensor);//Leitura analógica da porta A0
  temperatura =(valorLido * 0.00488);
  temperatura = temperatura * 100;
Serial.print("Temperatura = "); //mostra valor na tela
Serial.print(temperatura); //Mostra a temperatura medida  no monitor serial
Serial.println(" *C");// adiciona o °C

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
   if(linha > 100)
{
  linha = 0;
  Serial.println("ROW,SET,2");
}
delay(100000); //Tempo de espera
}
