"""
Configuración de pytest para pruebas de API
"""
import pytest
import requests
import os
from dotenv import load_dotenv

load_dotenv()


@pytest.fixture(scope="session")
def api_base_url():
    """Obtiene la URL base de la API desde variables de entorno"""
    return os.getenv("API_BASE_URL", "http://localhost:8000")


@pytest.fixture(scope="session")
def api_headers():
    """Configuración de headers por defecto para requests"""
    return {
        "Content-Type": "application/json",
        "Accept": "application/json"
    }


@pytest.fixture
def api_client(api_base_url, api_headers):
    """Cliente HTTP configurado para pruebas de API"""
    class APIClient:
        def __init__(self, base_url, headers):
            self.base_url = base_url
            self.headers = headers
            self.session = requests.Session()
        
        def get(self, endpoint, params=None):
            url = f"{self.base_url}{endpoint}"
            return self.session.get(url, headers=self.headers, params=params)
        
        def post(self, endpoint, data=None):
            url = f"{self.base_url}{endpoint}"
            return self.session.post(url, headers=self.headers, json=data)
        
        def put(self, endpoint, data=None):
            url = f"{self.base_url}{endpoint}"
            return self.session.put(url, headers=self.headers, json=data)
        
        def delete(self, endpoint):
            url = f"{self.base_url}{endpoint}"
            return self.session.delete(url, headers=self.headers)
    
    return APIClient(api_base_url, api_headers)
