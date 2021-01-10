import unittest
from Unaire import Unaire
from Valeur import Valeur

class UnaireTest(unittest.TestCase):

    def test_Unaire(self):
        self.unaire = Unaire("+","5")
        self.assertEqual(self.unaire.operateur,"+")
        self.assertEqual(self.unaire.expr,"5")

    def test_evaluate(self):
        self.valeur = Valeur("5")
        self.unaire = Unaire("+",self.valeur)
        self.assertEqual(self.unaire.evaluate_expr(),"+5")


if __name__ == '__main__':
    unittest.main()
