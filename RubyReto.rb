
# Vamos a construir un simple juego de reto 5 en Ruby con la interfaz de la linea de comando.
# El objetivo del juego es que un usuario pueda ingresar la respuesta a cada pregunta que le vamos haciendo y que
# el juego le responda si la respuesta fue correcta o no. En caso de que si sea correcta seguimos con una nueva pregunta,
# en caso de que no le indicamos al usuario que vuelva a intentar ingresando una nueva respuesta.
# Este es un ejemplo de como se vería el juego funcionando en la linea de comandos:

# Algunas preguntas que te puedes hacer:
# Entiendes completamente la logica del juego?
# que clases (estado y comportamiento) necesitas?
# Cuales son las responsabilidades de cada clase?
# Que metodos deberían ser publicos? cuales deberian ser privados?

# 1. Read Archive into hash ==> answer: xyz , question: xyz
# 2. select random question for user
# 3. validate answer
    # 3a) if answer valid go back to to 
    # 3b) if answer invalid, let user try again
#4. 



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
    p 'an error occured. Please speak to the administrator of this programme'
  end
end


    def print_file(file)
        file = load_file(file)
        return file
    end 




     def question!
      @array.shuffle!
      p @array.shift[:question]
     end 



end 

random_question = Game.new
random_question.print_file("archive.txt")
random_question.question!