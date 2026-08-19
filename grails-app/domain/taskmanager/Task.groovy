package taskmanager

class Task {

    String title
    String description
    Date deadline
    TaskStatus status
    User user_id

    static constraints = {
        title blank: false, maxSize: 255
        description nullable: true, maxSize: 1000
        deadline nullable: false
        status inList: TaskStatus.values() as List
        assignedUser nullable: false
    }

    enum TaskStatus {
        TO_DO, IN_PROGRESS, DONE
    }

    static mapping = {
        status enumType: "string"
    }
}
