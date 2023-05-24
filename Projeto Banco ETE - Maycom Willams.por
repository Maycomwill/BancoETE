programa
{
	//Inclusão da biblioteca para randomizar os números das contas
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		//Declaração das variáveis
		logico testeLogico = verdadeiro	
		logico autenticado = falso
		inteiro conta = 0, ag =0, dvcc = 0, dvcp = 1, depositoInicial
		real digitado, saldoCc = 0.0, saldoCp = 0.0, depositoCc, depositoCp, saqueCc, saqueCp, transferencia
		cadeia nomeDoUsuario = ""

		faca{
			
			inteiro menu
			//Menu de opções do banco
			escreva("-----------------------------------------\n")
			escreva("|\t   Bem vindo ao Banco ETE\t|\n")
			escreva("|Escolha uma opção:\t\t\t|\n")
			escreva("|1: Criar uma conta\t\t\t|\n")
			escreva("|2: Mostrar saldo\t\t\t|\n")
			escreva("|3: Depositar na Conta corrente\t\t|\n")
			escreva("|4: Sacar na Conta corrente\t\t|\n")
			escreva("|5: Aplicar na Conta poupança\t\t|\n")
			escreva("|6: Resgatar da Conta poupança\t\t|\n")
			escreva("|7: Exibir contas\t\t\t|\n")
			escreva("|0: Para sair\t\t\t\t|\n")
			escreva("-----------------------------------------\n")
			leia(menu)


			//Dada a escolha do usuário pelo menu, as operações serão inicializadas
			escolha(menu){
				
			//Criação da conta
			caso 1:
				se(nomeDoUsuario == ""){
					escreva("Digite seu nome: ")
					leia(nomeDoUsuario)
	
					escreva("Digite o número de sua agência: ")
					leia(ag)
					escreva("Digite o número da sua conta: ")
					leia(conta)

					//Apresentação ao usuário de suas contas que foram criadas
					escreva("\nBem vindo ao Banco ETE: " + nomeDoUsuario + "\n")
					escreva("Sua agência é : " + ag + "\n")
					escreva("Sua conta corrente é a: " + conta + "-" + dvcc + "\n")
					escreva("Sua conta poupança é a: " + conta + "-" + dvcp + "\n")

					//Libera as outras funções do banco
					autenticado = verdadeiro
		
					//Questão obrigatória, perguntando se o usuário deseja realizar um depósito inicial
					escreva("\nVocê deseja fazer um depósito inicial? 1: Sim, 2: Não: ")
					leia(depositoInicial)
					
					//Estrutura condicional baseada na resposta do usuário
					escolha(depositoInicial){
					caso 1:
					escreva("\nDigite o valor do depósito: R$")
					leia(saldoCc)
					
					escreva("Seu saldo atual é: \n" + "Conta corrente: R$" + saldoCc + "\tConta poupança: R$" + saldoCp + "\n")
					pare
					caso 2:
					escreva("Tudo bem, escolha uma opção de nosso menu \n\n")
					pare
					}	
				}senao{
					escreva("Desculpe, você já possui uma conta, é permitido apenas um usuário por execução \n\n")
				}
			pare
			
			//Opção de mostrar o saldo das contas em tela
			caso 2:
				//Verificação de autenticação do usuário
				se(autenticado == verdadeiro){
					escreva("Seu saldo atual na Conta corrente é: R$" + saldoCc + "\n")
					escreva("Seu saldo atual na Conta poupança é: R$" + saldoCp + "\n")
				}senao{
					escreva("Desculpe, você precisa criar uma conta, antes de realizar qualquer operação!\n")	
				}
				
			pare

			//Opção de depósito em conta corrente
			caso 3:
				se(autenticado == verdadeiro){
					escreva("Digite o valor de depósito: R$")
					leia(depositoCc)
	
					//Lógica para o depósito na conta
					saldoCc = saldoCc + depositoCc
					depositoCc = 0.0
	
					escreva("Operação realizada com sucesso\n\n")
					escreva("Seu novo saldo é: R$" + saldoCc + "\n")
				}senao{
					escreva("Desculpe, você precisa criar uma conta, antes de realizar qualquer operação!\n")	
				}
					
			pare

			//Opção de saque na conta corrente
			caso 4:
				se(autenticado == verdadeiro){
					escreva("Digite o valor que você deseja sacar: R$")
					leia(saqueCc)
	
					//Lógica para garantir que o saque não será maior que o saldo atual na cc
					se(saqueCc > saldoCc){
						escreva("Você não possui saldo suficiente para o saque!\n")
					} senao{
						saldoCc = saldoCc - saqueCc
						saqueCc = 0.0
						escreva("Operação realizada com sucesso\n\n")
						escreva("Seu novo saldo é de: R$" + saldoCc + "\n")
					}
				}senao{
					escreva("Desculpe, você precisa criar uma conta, antes de realizar qualquer operação!\n")	
				}
				
			pare

			//Opção de aplicação na conta poupança
			caso 5:
				se(autenticado == verdadeiro){
					escreva("Digite o valor que você deseja transferir para a conta poupança: R$")
					leia(depositoCp)
	
					//Lógica para garantir que a aplicação não será maior que o saldo atual na cc
					se(depositoCp > saldoCc){
						escreva("Você não possui saldo suficiente para a transferência!\n")
					}senao {
						saldoCc = saldoCc - depositoCp
						saldoCp = saldoCp + depositoCp
						depositoCp = 0.0
						escreva("Operação realizada com sucesso\n\n")
						escreva("Seu novo saldo na Conta corrente é de: R$" + saldoCc + "\n")
						escreva("Seu novo saldo na Conta poupança é de: R$" + saldoCp + "\n")
					}
				}senao{
					escreva("Desculpe, você precisa criar uma conta, antes de realizar qualquer operação!\n")	
				}
			pare

			//Opção de resgate da conta poupança
			caso 6:
				se(autenticado == verdadeiro){
					escreva("Digite o valor que você deseja resgatar da conta poupança: R$")
					leia(saqueCp)
	
					//Lógica para garantir que o resgate não será maior que o saldo atual na cp
					se(saqueCp > saldoCp){
						escreva("Você não possui saldo suficiente para resgatar!\n")
					}senao {
						saldoCp = saldoCp - saqueCp
						saldoCc = saldoCc + saqueCp
						saqueCp = 0.0
						escreva("Operação realizada com sucesso\n\n")
						escreva("Seu novo saldo na Conta corrente é de: R$" + saldoCc + "\n")
						escreva("Seu novo saldo na Conta poupança é de: R$" + saldoCp + "\n")
					}
				}senao{
					escreva("Desculpe, você precisa criar uma conta, antes de realizar qualquer operação!\n")	
				}
			pare
			
			//Opção para exibir o número das contas corrente e poupança
			caso 7:
				se(autenticado == verdadeiro){
					escreva("\n\nSuas contas são:\n")
					escreva("Conta corrente: " + conta + "-" + dvcc + "\n")
					escreva("Conta poupança: " + conta + "-" + dvcp + "\n\n")	
				}senao{
					escreva("Desculpe, você precisa criar uma conta, antes de realizar qualquer operação!\n")	
				}
			pare

			//Opção SAIR
			caso 0:
				escreva("Obrigado por usar o Banco ETE, volte sempre!\n\n")
				
				//Remoção da autenticação do usuário
				autenticado = falso
				
				//Alteração do valor da variável, responsável pelo fim do loop do menu
				testeLogico = falso				
			pare
			caso contrario:
				escreva("\n\nOpção inválida, por favor, selecione um opção apresentada no menu\n\n")
			}
			
		}enquanto(testeLogico == verdadeiro)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 6237; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */