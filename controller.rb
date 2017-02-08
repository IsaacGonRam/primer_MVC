require_relative 'model.rb'
require_relative 'view.rb'

class Controller
  attr_accessor :model, :view

  def initialize(input)
    @model = Record.new
    @view = View.new
    action = input[0]
    task = input[1..-1]
    task = task.join(" ")
    @task = task
    menu(action)
  end

  def menu(input)
    case 
    when input == "add"
      add(@task)
    when input == "index"
      index 
    when input == "delete" 
      delete(@task) 
    when input == "complete"
      complete(@task)
    end
    
  end

  def add(task)
    new_task = Task.new(@task)
    @model.add(new_task)
    @view.add(new_task.name)
  end

  def index
    arreglo = @model.index
    @view.index(arreglo)
  end

  def delete(numero)
    numero = @task.to_i
    borrado = @model.delete(numero)
    @view.delete(borrado)
  end

  def complete(numero)
    numero = @task.to_i
    completo = @model.complete(numero)
    @view.complete(completo)
  end

end

seleccion = ARGV
Controller.new(seleccion)

