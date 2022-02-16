require "pony"
require "io/console"

my_mail = "dk1996g@mail.ru"

puts "Введите пароль от вашей почты #{my_mail} для отправки письма:"

password = STDIN.noecho(&:gets).chomp

puts "Кому отправить письмо? "

send_to = STDIN.gets.chomp

puts "Введите тему письма"

theme = STDIN.gets.chomp

puts "Что написать в письме?"
body = STDIN.gets.chomp

    Pony.mail(
        subject: theme, # тема письма
        body: body, # текст письма, его тело
        to: send_to, # кому отправить письмо
        from: my_mail, # от кого письмо (наш обратный адрес)
      
        
        via: :smtp,
        via_options: {
          address: 'smtp.mail.ru', # это хост, сервер отправки почты
          port: '465', # порт
          tls: true, # если сервер работает в режиме TLS
          user_name: my_mail, # используем наш адрес почты как логин
          password: password, # задаем введенный в консоли пароль
          authentication: :plain # "обычный" тип авторизации по паролю
        }
    )

puts 'Письмо успешно отправлено'