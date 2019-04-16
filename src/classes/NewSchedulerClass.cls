global class NewSchedulerClass implements Schedulable {
    global void execute(SchedulableContext sc) {
        Contact c = new Contact();
        c.LastName = 'New Contact';
        insert c;
    }
}


/*
 * NewSchedulerClass nsc = new NewSchedulerClass();
 * String t = '0 15 17 ? * 6#3';
 * String jobID = System.Schedule('New Contact', t, nsc);
 * 
 * 
 * */