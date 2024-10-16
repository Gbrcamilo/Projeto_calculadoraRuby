# Requer a gem Sinatra para criar a aplicação web
require 'sinatra'

# Rota GET para a página inicial ('/')
get '/' do
  # Renderiza a visualização 'calculator.erb'
  erb :calculator
end

# Rota POST para processar o cálculo quando o formulário é enviado
post '/calculate' do
  # Obtém os valores dos parâmetros enviados pelo formulário e os converte para float
  @num1 = params[:num1].to_f
  @num2 = params[:num2].to_f
  @operation = params[:operation] # Obtém a operação selecionada (add, subtract, multiply, divide, percentage)

  # Realiza a operação com base na operação selecionada
  @result = case @operation
            when "add"          # Se a operação for "add"
              @num1 + @num2     # Soma os dois números
            when "subtract"     # Se a operação for "subtract"
              @num1 - @num2     # Subtrai o segundo número do primeiro
            when "multiply"     # Se a operação for "multiply"
              @num1 * @num2     # Multiplica os dois números
            when "divide"       # Se a operação for "divide"
              @num2 != 0 ? @num1 / @num2 : "Error: Division by zero" # Divide, mas verifica se o divisor é zero
            when "percentage"    # Se a operação for "percentage"
              (@num1 * @num2) / 100 # Calcula a porcentagem
            else
              "Invalid Operation" # Caso a operação não seja válida
            end

  # Renderiza novamente a visualização 'calculator.erb', agora com o resultado
  erb :calculator
end
