class View

  def add(print_tarea)
    puts "Agregaste la tarea: #{print_tarea} a la lista" 
  end

  def index(arreglo)
    number = 1
    arreglo.each do |obj|
      if obj.completed == "false"

        puts "#{number}.[ ]#{obj.name} "
        number +=1
      else
        puts "#{number}.[X]#{obj.name} "
        number +=1
      end

    end
  end

  def delete(item)
    puts "Eliminaste la tarea: #{item.name} de tu lista"
  end

  def complete(obj_completo)
    puts "Completaste la tarea: #{obj_completo.name}"
  end

end