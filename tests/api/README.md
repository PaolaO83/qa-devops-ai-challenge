# Pruebas de API

Pruebas automatizadas para endpoints de REST API.

## Estructura

```
api/
├── conftest.py         # Configuración y fixtures de pytest
├── test_example.py     # Ejemplo de pruebas
└── README.md          # Este archivo
```

## Requisitos

```bash
pip install -r requirements.txt
```

Dependencias principales:
- `pytest` - Framework de pruebas
- `requests` - Cliente HTTP
- `python-dotenv` - Manejo de variables de entorno

## Cómo ejecutar

```bash
# Todas las pruebas de API
pytest tests/api/

# Con salida detallada
pytest tests/api/ -v

# Solo pruebas rápidas
pytest tests/api/ -m "not slow"
```

## Estructura de una prueba de API

```python
def test_get_users(api_client):
    """Prueba para obtener lista de usuarios"""
    response = api_client.get("/users")
    assert response.status_code == 200
    assert isinstance(response.json(), list)
```

## Fixtures disponibles

### `api_client`
Cliente HTTP preconfigurado con headers y URL base.

```python
def test_something(api_client):
    response = api_client.get("/endpoint")
    response = api_client.post("/endpoint", data={...})
```

### `api_base_url`
URL base de la API desde `.env`.

### `api_headers`
Headers por defecto para requests.

## Convenciones

- Usar nombres descriptivos: `test_get_user_returns_200`
- Agrupar en clases: `class TestUserAPI`
- Un concepto por prueba
- Usar `arrange-act-assert` pattern

## Ejemplo completo

```python
class TestUserAPI:
    def test_get_user_by_id(self, api_client):
        # Arrange
        user_id = 1
        
        # Act
        response = api_client.get(f"/users/{user_id}")
        
        # Assert
        assert response.status_code == 200
        data = response.json()
        assert data['id'] == user_id
        assert 'name' in data
```

## Más información

- [pytest documentation](https://docs.pytest.org/)
- [requests documentation](https://docs.python-requests.org/)
