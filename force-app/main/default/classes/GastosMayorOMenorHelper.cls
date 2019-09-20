public class GastosMayorOMenorHelper {
    public static void validarMonto(List<Reporte_de_Gastos__c> listadoReportes){ 
        for (Reporte_de_Gastos__c reporte : listadoReportes){
            if(reporte.Monto__c > 200 & reporte.Estado__c == 'Parcialmente Aprobada'){
                List<EmailTemplate> listaTemplates  = [SELECT Id, Subject, Body 
                                                      FROM EmailTemplate
                                                      WHERE Id='00X1D0000018MsGUAU'];
                    
                List<User> listaUsuarios  = [SELECT Id, ProfileId, Name 
                                             FROM User
                                             WHERE ProfileId='00e1D000000O4ifQAC'];
                                        
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
				mail.setTemplateId(listaTemplates[0].Id);
                mail.setTargetObjectId(listaUsuarios[0].Id);
                mail.setSaveAsActivity(false);
                Messaging.SendEmailResult[] resultado = Messaging.SendEmail(new Messaging.SingleEmailMessage[] {mail});
            }            
        }
   }
}