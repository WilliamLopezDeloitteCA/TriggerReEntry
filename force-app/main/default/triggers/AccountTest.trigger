//Just for a demo ... but no code should be in a trigger
//
trigger AccountTest on Account  (before insert, before update, after insert, after update){
    
     String Modetype = (Trigger.isBefore ? 'BEFORE' : 'AFTER')  + ' ' + (Trigger.isInsert ? 'INSERT' : 'UPDATE');       
     System.debug (':::: ExecOrderTrigger :::: ' + Modetype);
    
		for (Account accountInstance: Trigger.New){ 
            System.debug ('Trigger.New = ' + accountInstance.Exec_Count__c);
            if(trigger.old != null){
               Account OldAcc = Trigger.oldMap.get(accountInstance.Id); 	
               System.debug ('Trigger.Old = ' + OldAcc.Exec_Count__c);  
            }
			if (Trigger.isBefore){ 
				accountInstance.Exec_Count__c += 1; 
				System.debug(accountInstance.Exec_Count__c); 
			} 
		} 
   
}