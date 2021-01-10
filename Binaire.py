from Expression import Expression
class Binaire(Expression):



    def __init__(self, operateur, expr1, expr2):
        self.operateur = operateur
        self.expr1 = expr1
        self.expr2 = expr2

    def evaluate_expr(self):
        return eval(self.expr1.evaluate_expr()+self.operateur+self.expr2.evaluate_expr())
    
  
   
 
