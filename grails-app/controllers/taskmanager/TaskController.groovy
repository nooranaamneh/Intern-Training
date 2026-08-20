package taskmanager
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class TaskController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    TaskService taskService

   def index() {
    [
        statusCounts: taskService.countTasksByStatus(),
        totalTasks: Task.count(),
        doneTasks: taskService.countTasksByStatus().DONE ?: 0,
        overdueTasks: taskService.countOverdueTasks()
    ]
}

    def list(String status) {
        params.max = params.max ?: 10
        def tasks = status ? Task.findAllByStatus(Task.TaskStatus.valueOf(status), params) : taskService.listTasks(params)
        respond tasks, model: [taskCount: Task.count(), currentStatus: status]
    }

    def show(Long id) {
        respond taskService.getTask(id)
    }

    def create() {
        respond new Task(params)
    }

    def save() {
    def taskParams = params.clone() as Map
    taskParams.deadline = params.date('deadline')

    def task = taskService.createTask(taskParams)
    if (task.hasErrors()) {
        respond task.errors, view: 'create'
        return
    }
    redirect action: 'show', id: task.id
}

    def edit(Long id) {
        respond taskService.getTask(id)
    }

    def update(Long id) {
    def taskParams = params.clone() as Map
    taskParams.deadline = params.date('deadline')

    def task = taskService.updateTask(id, taskParams)
    if (!task) {
        redirect action: 'index'
        return
    }
    if (task.hasErrors()) {
        respond task.errors, view: 'edit'
        return
    }
    redirect action: 'show', id: task.id
}

    def delete(Long id) {
        taskService.deleteTask(id)
        redirect action: 'index'
    }
}