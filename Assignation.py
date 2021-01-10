from Statement import Statement


class Assignation(Statement):

    def __init__(self,variable,expression):
        self.var=variable
        self.expr=expression
