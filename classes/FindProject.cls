public class FindProject {
   public Id OppObj{get;set;}
    public Opportunity opp {get;set;}
    public string name {get;set;}
    public string AccountName {get;set;}
    public string Owner {get;set;}
    public Decimal Amount {get;set;}
    public FindProject(){
     List<opportunity> lstopp = [Select id,name,Account.Name,Owner.Name,Amount from opportunity where id=:OppObj];
        if(lstopp.size()>0){
           name=lstopp[0].name; 
            AccountName=lstopp[0].Account.Name;
            Owner=lstopp[0].Owner.Name;
            Amount=lstopp[0].Amount;
        }   
    }
}