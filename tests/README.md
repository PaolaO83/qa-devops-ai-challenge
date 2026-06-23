# Pruebas Automatizadas

Este directorio contiene todas las pruebas automatizadas del proyecto.

## Estructura

```
tests/
├── api/           # Pruebas de API REST
├── ui/            # Pruebas de interfaz de usuario
└── conftest.py    # Configuración compartida de pytest
```

## Cómo ejecutar las pruebas

### Todas las pruebas
```bash
pytest tests/
```

### Solo pruebas de API
```bash
pytest tests/api/ -v
```

### Solo pruebas de UI
```bash
pytest tests/ui/ -v
```

### Con cobertura
```bash
pytest tests/ --cov=. --cov-report=html
```

### En paralelo
```bash
pytest tests/ -n auto
```

### Con markers específicos
```bash
pytest tests/ -m "api and not slow"
```

## Markers disponibles

- `@pytest.mark.api` - Pruebas de API
- `@pytest.mark.ui` - Pruebas de UI
- `@pytest.mark.performance` - Pruebas de rendimiento
- `@pytest.mark.critical` - Pruebas críticas
- `@pytest.mark.smoke` - Pruebas básicas
- `@pytest.mark.slow` - Pruebas lentas

## Convenciones

- Los archivos de prueba deben nombrarse `test_*.py` o `*_test.py`
- Los métodos de prueba deben empezar con `test_`
- Las clases de prueba deben empezar con `Test`

## Configuración

Consulta `pytest.ini` para la configuración de pytest.
Consulta `.env.example` para variables de entorno.

## Más información

- [test-plan.md](../docs/test-plan.md) - Plan detallado de pruebas
- [README.md](../README.md) - Documentación general del proyecto
