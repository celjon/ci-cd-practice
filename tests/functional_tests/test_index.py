import requests
import pytest
import os


class TestBackend:

    def test_add(self, url):
        assert "Add 1 and 2. Got 3!" == requests.get(f'{url}/add/1&2').text

    def test_multiply(self, url):
        assert "Multiply 2 and 2. Got 4!" == requests.get(f'{url}/multiply/2&2').text

    def test_divide(self, url):
        assert "Divide 10 and 2. Got 5.0!" == requests.get(f'{url}/divide/10&2').text

    def test_subtract(self, url):
        assert "Subtract 9 and 2. Got 7!" == requests.get(f'{url}/subtract/9&2').text
