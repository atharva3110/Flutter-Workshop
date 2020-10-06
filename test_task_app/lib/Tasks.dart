class Task
{
  final String task_name,description,type, time;
  Task(this.task_name, this.description, this.type, this.time);
}

class Task_list {
 static List<Task> task_list = [];

  static List get_list() {
    return task_list;
  }

  static add_to_list(task) {

    task_list.add(task);
  }

 static  remove_item(index){
    task_list.removeAt(index);
  }

  static get_task_info(index)
  {
    Task task=task_list[index];
    Map m={
      "task": task.task_name,
      "task_description": task.description,
      "task_type": task.type,
      "task_time": task.time
    };
    return m;
  }

  static get_description(index)
  {

  }
}