require 'csv'

class Task
  attr_accessor :name, :completed
  def initialize(name, completed=false)
    @name = name
    @completed = completed
  end

end

class Record
  
  def add(task)
    CSV.open("list.csv",'a') do |csv|
        csv << [task.name, task.completed]
    end  
  end

  def index
    array_new= []
    CSV.foreach("list.csv") do |row|
      tarea = Task.new(row[0],row[1])
      array_new << tarea
    end
    array_new
  end

  def delete(num_del)
    num_del -=1
    array_new= []
    CSV.foreach("list.csv") do |row|
      tarea = Task.new(row[0],row[1])
      array_new << tarea
    end
    other_array= []
    task_delete =[]
    array_new.each.with_index do |value,index|
      if index != num_del
        other_array << value
      else
        task_delete = value
      end
    end
    CSV.open("list.csv",'wb') do |csv|
      other_array.each do |obj|
        csv << [obj.name, obj.completed]
      end  
    end
    task_delete    
  end
  
  def complete(num_completo)
    num_completo -=1
    array_new= []
    CSV.foreach("list.csv") do |row|
      tarea = Task.new(row[0],row[1])
      array_new << tarea
    end
    task_complete =[]
    print_task =[]
    array_new.each.with_index do |value,index|
      if index != num_completo
        task_complete << value
        
      else
        value.completed = true
        task_complete << value
        print_task = value
      end
    end
    CSV.open("list.csv",'wb') do |csv|
        task_complete.each do |obj|
          csv << [obj.name, obj.completed]
        end 
    end  
    
    print_task          
  end    
  
end



