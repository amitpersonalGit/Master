@RestResource(urlMapping='/Account/*')
global with sharing class SampleRestApiClass {
    @HttpDelete
    global static void doDelete() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account account = [SELECT Id FROM Account WHERE Id = :accountId];
        delete account;
    }
    @HttpGet
    global static void getAgency() {
        
        List<Agency> lstAgency = new List<Agency>();
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        List<Account> result = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        for(Account objAccount : result){
            Agency objAgency = new Agency();
            objAgency.SfId = objAccount.id;
            lstAgency.add(objAgency);
        }
        //return result;
    }
    /*
    @HttpGet
    global static List<Account> getAccount() {
        
        JSON2Apex objJSON2Apex = new JSON2Apex();
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        List<Account> result = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        for(Account objAccount : result){
            Agency objAgency = new Agency();
            objAgency.SfId = objAccount.id;
            objJSON2Apex.agencies.add(objAgency);
        }
        //objJSON2Apex.agencies =[SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        return result;
    }
    */
    @HttpPost
    global static String doPost(String name,
                                String phone, String website) {
                                    Account account = new Account();
                                    account.Name = name;
                                    account.phone = phone;
                                    account.website = website;
                                    insert account;
                                    return account.Id;
                                }
    public class Agency {
        public String SfId;
        public Integer ResourceAgencyNum;
        public String RecordOwner;
        public String PublicName;
        public String AlternateName;
        public String HoursOfOperation;
        public String PhoneNumber;
        public String EmailAddress;
        public String WebsiteAddress;
        public String Description;
        public String LegalStatus;
    }
    public class JSON2Apex {
        
        public List<Agency> agencies;
        /*public static JSON2Apex parse(String json) {
            return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
        }*/
    }
    
}