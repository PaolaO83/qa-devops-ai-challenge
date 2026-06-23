# GUÍA DE INICIO RÁPIDO
# QA DevOps AI Challenge

## ⚡ 5 Minutos para Empezar

### Paso 1: Configuración Inicial (1 minuto)
```bash
# Copiar archivo de configuración
cp .env.example .env

# Instalar dependencias
make install
```

### Paso 2: Ejecutar Pruebas (1 minuto)
```bash
# Ejecutar todas las pruebas
make test

# O ver el estado de las pruebas de ejemplo
make test-api
```

### Paso 3: Ver Estructura del Proyecto (2 minutos)
- `tests/api/` - Pruebas de API
- `tests/ui/` - Pruebas de UI
- `performance/` - Pruebas de rendimiento
- `docs/` - Documentación

### Paso 4: Explorar la Documentación (1 minuto)
- Leer: [docs/test-plan.md](docs/test-plan.md)
- Copiar: Plantilla de bug en [docs/bug-reports.md](docs/bug-reports.md)

---

## 📚 Pasos Siguientes

### Para Crear Nuevas Pruebas de API

1. Abre `tests/api/test_example.py`
2. Reemplaza el contenido con tus pruebas
3. Usa el fixture `api_client` disponible en `conftest.py`

**Ejemplo:**
```python
def test_get_users(api_client):
    response = api_client.get("/users")
    assert response.status_code == 200
```

### Para Crear Nuevas Pruebas de UI

1. Abre `tests/ui/test_example.py`
2. Configura `BROWSER_TYPE` en `.env`
3. Implementa tus pruebas con Selenium o Playwright

### Para Ejecutar Pruebas de Performance

```bash
# k6
make run-k6

# JMeter
make run-jmeter
```

---

## 🆘 Problemas Comunes

### "pytest: command not found"
```bash
source venv/bin/activate  # Linux/Mac
# o
venv\Scripts\activate     # Windows
```

### "ModuleNotFoundError"
```bash
pip install -r requirements.txt
```

### Las pruebas no se encuentran
```bash
# Asegúrate de que los archivos se llamen test_*.py
pytest --collect-only tests/
```

---

## 📖 Documentación Completa

- [README.md](README.md) - Documentación general
- [docs/test-plan.md](docs/test-plan.md) - Plan de pruebas
- [tests/api/README.md](tests/api/README.md) - Guía de pruebas de API
- [tests/ui/README.md](tests/ui/README.md) - Guía de pruebas de UI
- [performance/README.md](performance/README.md) - Guía de performance

---

## 💡 Tips

1. Usa `make help` para ver todos los comandos disponibles
2. Usa markers: `pytest -m "api"` para filtrar pruebas
3. Genera cobertura: `make test-cov` y abre `htmlcov/index.html`
4. Formatea código: `make format` antes de commits

---

**¡Listo para comenzar! 🚀**

Si necesitas ayuda, consulta la documentación completa en el README.md
