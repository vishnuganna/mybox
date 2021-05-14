public class eAccountDeck {
    @AuraEnabled
    public Static list<Account> eAccountsDeck() {
        return [select id,name,industry from account];
    }
}