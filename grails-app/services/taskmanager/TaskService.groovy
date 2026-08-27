package taskmanager

import grails.gorm.transactions.Transactional

@Transactional
class TaskService {

    List<Task> listTasks(Map params) {
        Task.list(params)
    }

    Task getTask(Long id) {
        Task.get(id)
    }

    Task createTask(Map taskParams) {
        def task = new Task()
        task.title = taskParams.title
        task.description = taskParams.description
        task.deadline = taskParams.deadline
        task.status = taskParams.status as Task.TaskStatus

        def assignedUserId = taskParams.assignedUser?.id ?: taskParams['assignedUser.id']
        if (assignedUserId) {
            task.assignedUser = User.get(assignedUserId as Long)
        }

        Calendar cal = Calendar.getInstance()
        cal.set(Calendar.HOUR_OF_DAY, 0)
        cal.set(Calendar.MINUTE, 0)
        cal.set(Calendar.SECOND, 0)
        cal.set(Calendar.MILLISECOND, 0)
        Date today = cal.getTime()

        if (task.deadline && task.deadline.before(today)) {
            task.errors.rejectValue('deadline', 'task.deadline.past', 'Deadline cannot be in the past')
            return task
        }

        task.save(flush: true)
        task
    }

    Task updateTask(Long id, Map taskParams) {
        def task = Task.get(id)
        if (!task) return null

        task.title = taskParams.title
        task.description = taskParams.description
        task.deadline = taskParams.deadline
        task.status = taskParams.status as Task.TaskStatus

        def assignedUserId = taskParams.assignedUser?.id ?: taskParams['assignedUser.id']
        if (assignedUserId) {
            task.assignedUser = User.get(assignedUserId as Long)
        }

        Calendar cal = Calendar.getInstance()
        cal.set(Calendar.HOUR_OF_DAY, 0)
        cal.set(Calendar.MINUTE, 0)
        cal.set(Calendar.SECOND, 0)
        cal.set(Calendar.MILLISECOND, 0)
        Date today = cal.getTime()

        if (task.deadline && task.deadline.before(today)) {
            task.errors.rejectValue('deadline', 'task.deadline.past', 'Deadline cannot be in the past')
            return task
        }

        task.save(flush: true)
        task
    }

    boolean deleteTask(Long id) {
        def task = Task.get(id)
        if (!task) return false
        task.delete(flush: true)
        true
    }

    Map<String, Long> countTasksByStatus() {
        Map<String, Long> counts = [:]
        Task.TaskStatus.values().each { status ->
            counts[status.name()] = Task.countByStatus(status)
        }
        counts
    }

    Long countOverdueTasks() {
        Calendar cal = Calendar.getInstance()
        cal.set(Calendar.HOUR_OF_DAY, 0)
        cal.set(Calendar.MINUTE, 0)
        cal.set(Calendar.SECOND, 0)
        cal.set(Calendar.MILLISECOND, 0)
        Date today = cal.getTime()

        Task.createCriteria().count {
            lt('deadline', today)
            ne('status', Task.TaskStatus.DONE)
        }
    }
}