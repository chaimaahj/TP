from Expression import Expression
class Valeur(Expression):


    def __init__(self,num):
        self.val=num



    def evaluate_expr(self):
        return self.val
