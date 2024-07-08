/*
This script activates Price Adjustment Schedules for SDO use cases if they're not already activated
*/
    List<PriceAdjustmentSchedule> recordsToUpdate = [SELECT Id
                                             FROM PriceAdjustmentSchedule
                                             WHERE Name IN ('Standard Attribute Based Adjustment','Standard Bundle Based Adjustment') and IsActive = false];

    // Check if there are records to delete
    if (!recordsToUpdate.isEmpty()){
        for (PriceAdjustmentSchedule priceadjustments : recordsToUpdate){
            priceadjustments.IsActive = true;
        }
        try {
            update recordsToUpdate;
            System.debug('Records updated successfully.');
        } catch (Exception e) {
            System.debug('Error updating records: ' + e.getMessage());
        }
    } else {
        System.debug('No records to update.');
    }