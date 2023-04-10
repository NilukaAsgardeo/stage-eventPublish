import ballerinax/trigger.asgardeo;
import ballerina/log;
import ballerina/http;
import ballerinax/googleapis.gmail;

configurable asgardeo:ListenerConfig config = ?;

configurable string googleClientId = ?;
configurable string googleClientSecret = ?;
configurable string googleRefreshToken = ?;
configurable string senderEmail = ?;
configurable string receiverEmail = ?;

listener http:Listener httpListener = new(8090);
listener asgardeo:Listener webhookListener =  new(config,httpListener);

service asgardeo:RegistrationService on webhookListener {
  
    remote function onAddUser(asgardeo:AddUserEvent event ) returns error? {
      log:printInfo(event.toJsonString());
    }
    remote function onConfirmSelfSignup(asgardeo:GenericEvent event ) returns error? {
      log:printInfo(event.toJsonString());
    }
    remote function onAcceptUserInvite(asgardeo:GenericEvent event ) returns error? {
      log:printInfo(event.toJsonString());
    }
}
