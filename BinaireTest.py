import unittest
from Valeur import Valeur
from Binaire import Binaire
from Unaire import Unaire

class BinaireTest(unittest.TestCase):


    def test_binaire(self):
        self.valeur = Valeur("5")
        self.valeur2 = Valeur("6")
        self.unaire = Unaire("-",self.valeur)
        self.binaire = Binaire("+",self.unaire,self.valeur2)
        self.assertEqual(self.binaire.evaluate_expr(),1)




if __name__ == '__main__':
    unittest.main()
