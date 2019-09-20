trigger GastosMayorOMenor on Reporte_de_Gastos__c (after update) {
      //helper class for single email
      GastosMayorOMenorHelper.validarMonto(trigger.new);    
}