@isTest
private class ValidarMontoTest {
    @isTest Static Void ValidarMontoMayorTest(){
        Reporte_de_Gastos__c reporte = new Reporte_de_Gastos__c(name='testGasto',
                                                                Estado__c ='En proceso'
                                                                );
        insert reporte;
        Factura__c factura = new Factura__c (name='name',
                                                      Monto_Total__c = 250,
                                                      Reporte_de_Gastos__c = reporte.id);
                
        insert factura;
        reporte.Estado__c ='Parcialmente Aprobada';

        test.startTest();
        			upsert reporte;
                    Integer emailCalls = Limits.getEmailInvocations();
        			System.assertEquals(2, emailCalls);
        test.stopTest();      
    }
    @isTest Static Void ValidarMontoMenorTest(){
        Reporte_de_Gastos__c reporte = new Reporte_de_Gastos__c(name='testGasto',
                                                                Estado__c ='En proceso'
                                                                );
        insert reporte;
        Factura__c factura = new Factura__c (name='name',
                                                      Monto_Total__c = 100,
                                                      Reporte_de_Gastos__c = reporte.id);
        
        insert factura;
        reporte.Estado__c ='Parcialmente Aprobada';

        test.startTest();
        			upsert reporte;
                    Integer emailCalls = Limits.getEmailInvocations();
        			System.assertEquals(0, emailCalls);
        test.stopTest();      
    }
}