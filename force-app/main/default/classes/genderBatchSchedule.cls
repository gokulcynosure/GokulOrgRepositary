public class genderBatchSchedule  implements Schedulable {

    public void execute(SchedulableContext sc){
        
        genderBatch g = new genderBatch();
        dataBase.executeBatch(g,100);
        
    }
}