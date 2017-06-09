module PostsHelper
  include SessionsHelper
  include ApplicationHelper
  def blog_belongs_to_user?(blog)
    current_user.id == blog.user_id
  end

  def timer(t)
    aux = t.split(" ")

    if aux.count == 2
      if aux[1] == "minutes"
        aux[1] = "minutos"
      else
        aux[1] = "dias"
      end

    elsif aux.count == 3
      aux[0] = "alrededor de "
      aux[2] = "horas"

    end

    aux.join(" ")
  end

  def sacar_caracteres(array)

    array.each do |f|
        y = 0
        int = 0
        aux2 = []
        aux = f.content.split("")
        for i in 0..(249 + int)
          if aux[y] == "*"
            y = y + 1
            int = int + 1
          else
            aux2[i] = aux[y]
            y = y + 1
          end

        end
        f.content = aux2.join("")
    end
    array
  end
end
