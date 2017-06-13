module PostsHelper
  include SessionsHelper

  def blog_belongs_to_user?(blog)
    current_user.id == blog.user_id
  end

  def timer(t)
    aux = t.split(" ")

    if aux.count == 2
      if aux[1] == "minutes"
        aux[1] = "minutos"
      elsif aux[1] == "minute"
        aux[1] = "Minuto"
        else
        aux[1] = "dias"
      end

    elsif aux.count == 3
      aux[0] = "alrededor de "
      aux[2] = "horas"
    elsif aux.count == 4
      aux[0] = "menos"
      aux[1] = "de"
      aux[2] = "un"
      aux[3] = "Minuto"


    end

    aux.join(" ")
  end

  def sacar_caracteres(array)

    array.each do |f|
        aux2 = []
        aux = f.content.split("")
        for i in 0..249
          aux2[i] = aux[i]
        end
        f.content = aux2.join("")
    end
    array
  end
end
