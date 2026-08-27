package taskmanager

import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class TaskController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static responseFormats = ['html', 'json']

    TaskService taskService
    def springSecurityService

    def index() {
        [
            statusCounts: taskService.countTasksByStatus(),
            totalTasks: Task.count(),
            doneTasks: taskService.countTasksByStatus().DONE ?: 0,
            overdueTasks: taskService.countOverdueTasks()
        ]
    }

    def list(String status) {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    def tasks = status ? Task.findAllByStatus(Task.TaskStatus.valueOf(status), params) : taskService.listTasks(params)
    respond tasks, model: [
        taskCount: Task.count(),
        currentStatus: status,
        currentUserId: springSecurityService.currentUser?.id
    ]
}

    def show(Long id) {
    def task = taskService.getTask(id)
    if (!task) {
        render status: NOT_FOUND
        return
    }
    respond task
}

    def create() {
        respond new Task(params)
    }

    def save() {
    def taskParams = params.clone() as Map

    if (params.deadline instanceof String && params.deadline ==~ /\d{4}-\d{2}-\d{2}/) {
        taskParams.deadline = new java.text.SimpleDateFormat('yyyy-MM-dd').parse(params.deadline as String)
    } else {
        taskParams.deadline = params.date('deadline')
     }

    def task = taskService.createTask(taskParams)
    if (task.hasErrors()) {
        respond task.errors, view: 'create', status: UNPROCESSABLE_ENTITY
        return
    }

    if (response.format == 'json') {
        respond task, status: CREATED
    } else {
        flash.message = "Task '${task.title}' created successfully."
        redirect action: 'show', id: task.id
    }
}

    def edit(Long id) {
    def task = taskService.getTask(id)

    if (!task) {
        flash.message = "Task not found."
        redirect(action: 'index')
        return
    }

    if (!canAccessTask(task)) {
        flash.error = "You cannot edit this task because it is assigned to another user."
        redirect(action: 'show', id: id)
        return
    }

    respond task
}

   def update(Long id) {
    def existingTask = taskService.getTask(id)
    if (!existingTask) {
        if (response.format == 'json') {
            render status: NOT_FOUND
        } else {
            flash.error = "Task not found."
            redirect action: 'list'
        }
        return
    }
    if (!canAccessTask(existingTask)) {
        if (response.format == 'json') {
            render status: FORBIDDEN
        } else {
            flash.error = "You are not allowed to edit this task."
            redirect action: 'show', id: existingTask.id
        }
        return
    }

    def taskParams = params.clone() as Map

    if (params.deadline instanceof String && params.deadline ==~ /\d{4}-\d{2}-\d{2}/) {
    taskParams.deadline = new java.text.SimpleDateFormat('yyyy-MM-dd').parse(params.deadline as String)
} else {
    taskParams.deadline = params.date('deadline')
}

    def task = taskService.updateTask(id, taskParams)
    if (task.hasErrors()) {
        respond task.errors, view: 'edit', status: UNPROCESSABLE_ENTITY
        return
    }

    if (response.format == 'json') {
        respond task, status: OK
    } else {
        flash.message = "Task '${task.title}' updated successfully."
        redirect action: 'show', id: task.id
    }
}

  def delete(Long id) {
    def task = taskService.getTask(id)
    if (!task) {
        if (response.format == 'json') {
            render status: NOT_FOUND
        } else {
            flash.error = "Task not found."
            redirect action: 'list'
        }
        return
    }
    if (!canAccessTask(task)) {
        if (response.format == 'json') {
            render status: FORBIDDEN
        } else {
            flash.error = "You are not allowed to delete this task."
            redirect action: 'show', id: task.id
        }
        return
    }

    taskService.deleteTask(id)

    if (response.format == 'json') {
        render status: NO_CONTENT
    } else {
        flash.message = "Task deleted successfully."
        redirect action: 'list'
    }
}

private boolean isAdmin() {
    springSecurityService.currentUser?.authorities*.authority?.contains('ROLE_ADMIN')
 }

private boolean canAccessTask(Task task) {
    isAdmin() || task.assignedUser?.id == springSecurityService.currentUser?.id
  }
}