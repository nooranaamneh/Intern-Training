package university

class InactiveStudentCleanupJob {

   static triggers = {
    cron name: 'inactiveStudentCleanupTrigger',
         cronExpression: '0 0 1 * * ?'
}

    boolean dryRun = true

    def execute() {

        log.info "========================================"
        log.info "InactiveStudentCleanupJob START"
        log.info "Time: ${new Date()}"
        log.info "Dry Run: ${dryRun}"

        Calendar cal = Calendar.getInstance()
        cal.add(Calendar.DAY_OF_MONTH, -30)
        Date cutoffDate = cal.getTime()

        log.info "Cutoff date: ${cutoffDate}"

        List<Long> activeStudentIds = Enrollment.executeQuery(
            "SELECT DISTINCT e.student.id FROM Enrollment e WHERE e.enrollAt >= :cutoff",
            [cutoff: cutoffDate]
        )

        log.info "Active student IDs: ${activeStudentIds}"

        List<Student> allStudents = Student.list()

        log.info "Total students: ${allStudents.size()}"

        List<Student> inactiveStudents = allStudents.findAll { student ->
            !(student.id in activeStudentIds)
        }

        log.info "Found ${inactiveStudents.size()} inactive students"

        inactiveStudents.each { student ->

            if (dryRun) {
                log.info "[DRY RUN] Would delete student: ${student.name} (id=${student.id}, email=${student.email})"
            } else {
                log.info "Deleting student: ${student.name} (id=${student.id})"
                student.delete(flush: true)
            }
        }

        log.info "InactiveStudentCleanupJob END"
        log.info "Time: ${new Date()}"
        log.info "========================================"
        println log
    }
}