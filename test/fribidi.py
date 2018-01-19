import unittest

import pyfribidi


class TestFribidi(unittest.TestCase):
    text = "سلام test تست"
    result = 'ﺖﺴﺗ test ﻡﻼ﻿ﺳ'


    def test_log2vis(self):
        result = pyfribidi.log2vis(self.text)
        self.assertEqual(self.result, result)
        

if __name__ == '__main__':
    unittest.main()