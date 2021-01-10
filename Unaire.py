from Expression import Expression
class Unaire(Expression):
    



    def __init__(self, op, expr):
        self.operateur = op
        self.expr = expr


    def evaluate_expr(self):
       if isinstance(self.expr,int):
           return self.operateur+str(self.expr)
       else:
            return self.operateur+self.expr.evaluate_expr()
       
    
  
   
    
