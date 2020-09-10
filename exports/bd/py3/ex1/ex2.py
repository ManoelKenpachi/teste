def criar_conta (numero, titular, saldo, limite):    
    conta = {"numero": numero, "titular": titular, "saldo": saldo, "limite": limite}
    return conta

def depositar(conta, valor):
    conta["saldo"] += valor

def sacar(conta, valor):
    conta["saldo"] -= valor

def extrato(numero):
    print("Saldo é {}".format(conta["saldo"]))