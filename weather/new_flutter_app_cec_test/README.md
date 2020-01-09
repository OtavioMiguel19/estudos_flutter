# Teste de aplicativo C&C

Para enviar notificações via Postman, criar uma request .POST com url:
https://fcm.googleapis.com/fcm/send

Parâmetros de cabeçalho:
Content-Type: application/json
Authorization: key=AIzaSyBSZwjyPstGoccMYHkNbgBdLGdTALwOTqw



Body:
{
   "notification":{
      "title":"Sua encomenda está a caminho!",
      "body":"Olá Otavio! Sua encomenda já está com a transportadora.",
      "color":"#f96302"
   },
   "data":{
      "title":"Sua encomenda está a caminho!",
      "subtitle":"Olá Otavio! Sua encomenda já está com a transportadora.",
      "body":"Olá Otavio! Sua encomenda já está com a transportadora.",
      "priority":"high",
      "click_action":"FLUTTER_NOTIFICATION_CLICK",
      "urlDestino":"https://google.com"
   },
   "to":"TOKEN DE USUARIO"
}


Em TOKEN DE USUARIO, inserir o hash único do user.
Exemplo de hash:
fRtfZNSqLN4:APA91bHYQKrCN8Xx4QNjQVGpRxfK8hOsvtNcbpIROQpYXUTCO2JMfQ7HH7wo6L_x5FXVlXxU11RzkXCfvfxJrY8xKfN-2DpcqJlIvz4Of71voQVwARxVJh6o3azcJkDRyVVSx5ASno5U