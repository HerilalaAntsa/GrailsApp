package mg.grailsapp.model

import com.agileorbit.schwartz.SchwartzJob
import grails.transaction.Transactional
import groovy.transform.CompileStatic
import groovy.util.logging.Slf4j
import org.quartz.JobExecutionContext
import org.quartz.JobExecutionException

import java.text.SimpleDateFormat

@CompileStatic
@Slf4j
class MessageJobService implements SchwartzJob {

	MessageService messageService

	@Transactional
	void execute(JobExecutionContext context) throws JobExecutionException {
		// messageService.messageCure()
		println("CRON CRON CRON")
	}

	void buildTriggers() {

		triggers << factory('Simple Job every 10 seconds')
						.intervalInSeconds(10)
						.build()

		/*triggers << factory('Message cure')
				.cronSchedule("0 0 4 1/1 * ? *")
				.build()*/
	}
}
