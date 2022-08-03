defmodule Todos do
  def create_todos do
    {number_of_tasks,_q}= IO.gets("Enter the number of todos you want:") |> Integer.parse()

    for _ <- 1..number_of_tasks do
      IO.gets("Enter a task: ") |> String.trim()
    end

   end


  def contains?(tasks,task) do #to check if tasks exist in todo list
   Enum.member?(tasks,task)

  end
  def keyword_search(tasks,word) do #to find tasks containg the word
    for task <- tasks, String.contains?(tasks,word) do
      task
    end
  end
  def random_task(tasks) do #to return random task
    [task]= Enum.take_random(tasks,1)
    task
  end

  def complete_todo(tasks,task) do #to delete task from list once completed
    if contains?(tasks,task) do
      List.delete(tasks,task)
    else
      :not_found_error
    end
  end

  def add_new_todo(tasks,task) do
    List.insert_at(tasks,-1,task)
  end

  def save(tasks,filename) do #to save in file
    binary= :erlang.term_to_binary(tasks)
    File.write(filename,binary)
  end
  def read(filename) do
    case File.read(filename) do
      {:ok, binary}-> :erlang.binary_to_term(binary)
      {:error, _reason} ->"file does not exist"
    end
  end
end
