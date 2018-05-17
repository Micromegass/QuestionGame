
# Vamos a construir un simple juego de reto 5 en Ruby con la interfaz de la linea de comando.
# El objetivo del juego es que un usuario pueda ingresar la respuesta a cada pregunta que le vamos haciendo y que
# el juego le responda si la respuesta fue correcta o no. En caso de que si sea correcta seguimos con una nueva pregunta,
# en caso de que no le indicamos al usuario que vuelva a intentar ingresando una nueva respuesta.
# Este es un ejemplo de como se vería el juego funcionando en la linea de comandos:

# 1. Read Archive into hash ==> answer: xyz , question: xyz
# 2. select random question for user
# 3. validate answer
    # 3a) if answer valid go back to to 4
    # 3b) if answer invalid, let user try again
#4. ask next question
#5. repeat 3
#6. when all questions are answered, end game.


class Game

  def initialize 
  @array = []
  end 

  def load_file(file)
    if File.file?(file)
      output = IO.readlines(file)
      output.each do |hash|
        question, answer = hash.chomp.split('-')
        hash = { question: question, answer: answer }
        @array << hash    
      end 
    else
      puts "------------------------------------------------------------------"
      p 'an error occured. Please speak to the administrator of this programme'
      puts "------------------------------------------------------------------"
    end
  end

  def print_file(file)
    file = load_file(file)
    return file
  end 

   
    
  def question!
    if @array == [] || @array == nil || @array == ""
      puts "-------------------------------------------------"
      puts "Congratulations! You finished the game!"
      puts "-------------------------------------------------"
      exit
    else 
      @array.shuffle!
      puts @array[0][:question]
      while @array != ""
        print "> "
        respuesta = gets.chomp
        if respuesta.downcase == @array[0][:answer] 
          puts
          puts "---------------------------"
          puts "AWESOME! That is correct!"
          puts "---------------------------"
          puts
          @array.shift
          question!

          elsif respuesta.downcase == "quit"
          puts "-------------------------------------------------"
          puts "Goodbye my friend! Come back soon and try again!"
          puts "-------------------------------------------------"
          exit 

          else 
          puts "-------------------------------------------------"
          puts "that's incorrect. Try again: "
          puts "-------------------------------------------------"
          puts @array[0][:question]
        end 
      end 
    end 
  end


    def menu
      puts
      puts
      puts "----------Welcome to the Programming Question Game-----------"
      puts "-----------Please be so kind and tell me your name: ----------"
      print "> "
      name = gets.chomp
      puts
      puts "Welcome #{name}"
      puts "In case you give up just enter 'quit', comprende compadre?! Super, What do you want to do? "
      puts "--------------------------------"
      puts "enter 'play' to play"
      puts "enter 'quit' to quit"
      puts "--------------------------------"
      print "> "

      start = gets.chomp
      if start.downcase == "quit"
        puts
        puts "Goodbye #{name}! Come back soon with more knowledge and try again!"
        puts
        exit
      elsif start.downcase == "play"
        puts "Lets begin"
      else 
        puts "#{name}, read the instruction. This is not a valid input"
        menu()
      end 
    end
end 


start = Game.new
start.print_file("archive.txt")
start.menu
start.question!

