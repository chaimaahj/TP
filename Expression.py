from Statement import Statement
class Expression(Statement):



    def __mult__(self,expr1,expr2):
        return Binaire(self,"*",expr1,expr2)

    def __add__(self,expr1,expr2):
        return Binaire(self,"+",expr1,expr2)

    def __sub__(self,expr1,expr2):
        return Binaire(self,"-",expr1,expr2)

    def __truediv__(self,expr1,expr2):
        return Binaire(self,"/",expr1,expr2)
    
    
    
  
   
    
