<aura:application >
<ltng:require styles="{!$Resource.SLDS10 + 
         '/assets/styles/salesforce-lightning-design-system.css'}"/>   
    <div class="slds">
        <div class="slds-page-header">
          <div class="slds-grid">
            <div class="slds-col slds-has-flexi-truncate">
              <p class="slds-text-heading--label">Camping Insert</p>
            </div>
          </div>
        </div>
          <div class="slds-col--padded slds-p-top--large">
              <c:campaigninsert />
                      </div>
    </div>
</aura:application>