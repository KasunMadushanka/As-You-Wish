/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AsYouWish;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class QuartzJob implements Job {
        public void execute(JobExecutionContext context)
                        throws JobExecutionException {
               DBBackup.mysqlDatabaseBackUp();
        }
}