public class SampleOpportunityClass {

    public void createNewOpportunityMethod(){
        Account objAccount = new Account();
        objAccount.Name = 'Account Test Mock';
        Insert objAccount;
        
        Opportunity objOpportunity = new Opportunity();
        objOpportunity.Name ='Opportunity Test Mock';
        objOpportunity.AccountId = objAccount.Id;
        objOpportunity.StageName ='Closed Won';
        Insert objOpportunity;
    }
}