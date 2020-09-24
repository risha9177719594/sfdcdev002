/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-24-2020
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   09-24-2020   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class ChatBotLinksController {  
    @AuraEnabled(cacheable=true) 
    public static List<Wraper> getAllChatBotLinks() {
        List<Wraper> lstWrap = new List<Wraper>();
        for(Chatbot_Link__mdt mdata : [SELECT Link_Name__c, Link__c FROM Chatbot_Link__mdt]) {
            lstWrap.add(new Wraper(mdata.Link__c, mdata.Link_Name__c));
        }
        return lstWrap;
    }
    public class Wraper {
        @AuraEnabled
        public String link { get; set; }
        @AuraEnabled
        public String title { get; set; }

        public Wraper(String link, String title) {
            this.link = link;
            this.title = title;
        }
    }
}