import unittest
from Valeur import Valeur

class ValeurTest(unittest.TestCase):

    def test_valeur(self):
        self.valeur = Valeur("5")
        self.assertEqual(self.valeur.val,"5")

    def test_evaluate(self):
        self.valeur = Valeur("5")
        self.assertEqual(self.valeur.evaluate_expr(),"5")


if __name__ == '__main__':
    unittest.main()
