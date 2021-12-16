global class dbc_UKGSchedular implements Schedulable {
    
    global void execute(SchedulableContext sc){
        DateTime CurrentDateTime = DateTime.now().addHours(24);
        // fetching day, month, hour, minutes, second and year.
        String day = string.valueOf(CurrentDateTime.day());
        String month = string.valueOf(CurrentDateTime.month());
        String hour = string.valueOf(CurrentDateTime.hour());
        String minute = string.valueOf(CurrentDateTime.minute());
        String second = string.valueOf(CurrentDateTime.second());
        String year = string.valueOf(CurrentDateTime.year());
        
        String strJobName = 'PeopleRollupActivity';
        String strSchedule = '0 ' + '0' + ' ' + hour + ' ' + day + ' ' + month + ' ?' + ' ' + year;
        List<CronTrigger> jobs = [SELECT Id, CronJobDetail.Id, CronJobDetail.Name, CronJobDetail.JobType FROM CronTrigger where CronJobDetail.Name = :strJobName];
        // abort current job so that new job can be scheduled again with same name.
        if(jobs.size()>0)
            System.abortJob(jobs.get(0).Id);
        // schedule for next run.
        String jobID = system.schedule('Upsert Account and Contact',strSchedule, new dbc_UKGSchedular());
    }
}