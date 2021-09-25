
class MeLembra
  @@meiahora = 1800
  def initialize()
    @usuarios = Hash.new(nil)
  end
  
  def lembrete(command, user)
    if command == "comece"
      criando_thread = Thread.new{temporizador(user)}
      criando_thread.abort_on_exception = true
      @usuarios[user] = criando_thread
      return 0
  
    elsif command == "pare"
      @usuarios[user].kill
      return 1
  
    end
  
  end
  
  def temporizador(user)
    tempo_de_comeco = Time.now
    tempo_de_lembrar =  tempo_de_comeco + @@meiahora
    contagem = 0

    while contagem < 10 do
    
      if tempo_de_lembrar - Time.now  <= 0 
        user.pm("Bebe agua la, namoralzinha!")
        tempo_de_comeco = Time.now
        tempo_de_lembrar = tempo_de_comeco + @@meiahora
        contagem = contagem + 1
      end
 
    end

  end

end


