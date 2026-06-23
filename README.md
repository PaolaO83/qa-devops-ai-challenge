# QA DevOps AI Challenge

Repositorio para automatización de pruebas con una estructura profesional que integra pruebas unitarias, de integración, UI, y pruebas de rendimiento.

## 📋 Descripción

Este proyecto proporciona una estructura completa y profesional para automatización de pruebas, incluyendo:

- ✅ **Pruebas de API**: Usando pytest + requests
- ✅ **Pruebas de UI**: Con Selenium o Playwright  
- ✅ **Pruebas de Rendimiento**: Con k6 y JMeter
- ✅ **Documentación**: Plan de pruebas, reporte de bugs, análisis con IA
- ✅ **Evidencias**: Captura de screenshots y logs
- ✅ **Configuración profesional**: Makefile, pytest.ini, entorno virtual

## 📁 Estructura del Proyecto

```
qa-devops-ai-challenge/
├── tests/                      # Pruebas automatizadas
│   ├── api/                   # Pruebas de API
│   │   ├── conftest.py
│   │   ├── test_example.py
│   │   └── README.md
│   └── ui/                    # Pruebas de UI
│       ├── conftest.py
│       ├── test_example.py
│       └── README.md
├── performance/               # Pruebas de rendimiento
│   ├── k6/
│   │   ├── example-load-test.js
│   │   └── README.md
│   └── jmeter/
│       ├── example-test-plan.jmx
│       └── README.md
├── docs/                      # Documentación
│   ├── test-plan.md          # Plan de pruebas
│   ├── bug-reports.md        # Reporte de bugs
│   ├── ai-analysis.md        # Análisis con IA
│   └── README.md
├── evidences/                 # Evidencias de pruebas
│   ├── screenshots/
│   └── logs/
├── config/                    # Configuración compartida
├── utils/                     # Utilidades compartidas
├── requirements.txt           # Dependencias de Python
├── pytest.ini                # Configuración de pytest
├── .env.example              # Variables de entorno
├── Makefile                  # Comandos útiles
└── .gitignore               # Ignorar archivos
```

## 🚀 Inicio Rápido

### 1. Clonar el repositorio
```bash
git clone <repositorio>
cd qa-devops-ai-challenge
```

### 2. Configurar el entorno
```bash
# Crear archivo .env desde la plantilla
cp .env.example .env

# Instalar dependencias
make install
# O manualmente:
# python3 -m venv venv
# source venv/bin/activate  (Linux/Mac)
# venv\Scripts\activate     (Windows)
# pip install -r requirements.txt
```

### 3. Ejecutar pruebas
```bash
# Todas las pruebas
make test

# Solo pruebas de API
make test-api

# Solo pruebas de UI
make test-ui

# Con cobertura
make test-cov
```

## 📊 Comandos Disponibles

### Pruebas
```bash
make test              # Ejecuta todas las pruebas
make test-api          # Solo pruebas de API
make test-ui           # Solo pruebas de UI
make test-cov          # Con reporte de cobertura
make test-parallel     # En paralelo (más rápido)
make test-smoke        # Pruebas de humo
make test-critical     # Pruebas críticas
```

### Calidad de Código
```bash
make lint              # Ejecuta linters
make format            # Formatea código
make check             # Lint + Format
```

### Performance
```bash
make run-k6            # Ejecuta pruebas k6
make run-jmeter        # Ejecuta pruebas JMeter
```

### Mantenimiento
```bash
make clean             # Limpia archivos temporales
make clean-reports     # Limpia reportes antiguos
make help              # Muestra todos los comandos
```

## 🔧 Configuración

### Variables de Entorno (.env)
```env
API_BASE_URL=http://localhost:8000
APP_BASE_URL=http://localhost:3000
BROWSER_TYPE=chrome
HEADLESS=False
```

Ver [.env.example](.env.example) para todas las opciones.

### Pytest
Configurado en [pytest.ini](pytest.ini) con:
- Markers personalizados
- Rutas de pruebas
- Cobertura automática
- Opciones de output

### Markers de Pruebas
```bash
pytest -m "api"              # Solo API
pytest -m "ui"               # Solo UI
pytest -m "not slow"         # Excluir pruebas lentas
pytest -m "critical"         # Solo críticas
```

## 📝 Documentación

- [Plan de Pruebas](docs/test-plan.md) - Estrategia y objetivos
- [Reporte de Bugs](docs/bug-reports.md) - Plantilla y registro de bugs
- [Análisis con IA](docs/ai-analysis.md) - Insights y optimizaciones
- [Guía de Pruebas de API](tests/api/README.md)
- [Guía de Pruebas de UI](tests/ui/README.md)
- [Guía de Performance](performance/README.md)

## 📦 Dependencias

Principales:
- `pytest` - Framework de pruebas
- `requests` - Cliente HTTP para API
- `python-dotenv` - Manejo de variables de entorno
- `selenium` / `playwright` - Automatización de UI (opcional)
- `k6` - Pruebas de carga (instalación separada)
- `jmeter` - Pruebas de rendimiento (instalación separada)

Ver [requirements.txt](requirements.txt) para la lista completa.

## 🎯 Ejemplos

### Ejecutar una prueba específica
```bash
pytest tests/api/test_example.py::TestExampleAPI::test_api_health_check -v
```

### Ejecutar con cobertura y reporte HTML
```bash
pytest tests/ --cov=. --cov-report=html
# Abrir: htmlcov/index.html
```

### Ejecutar pruebas de API en paralelo
```bash
pytest tests/api/ -n auto -v
```

### Generar reporte Allure
```bash
pytest tests/ --alluredir=allure-results
allure serve allure-results
```

## 🔍 Troubleshooting

### Las pruebas no se encuentran
```bash
# Asegúrate de estar en el directorio raíz
# Verifica que los archivos se llamen test_*.py
pytest --collect-only tests/
```

### Errores de importación
```bash
# Asegúrate de estar en el venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows

# Instala las dependencias
pip install -r requirements.txt
```

### Timeout en pruebas de UI
Aumenta `BROWSER_TIMEOUT` en `.env`:
```env
BROWSER_TIMEOUT=60
```

## 🤝 Contribuir

1. Crea una rama: `git checkout -b feature/mi-feature`
2. Haz commits: `git commit -am 'Añade mi feature'`
3. Pushea: `git push origin feature/mi-feature`
4. Abre un Pull Request

## 📋 Checklist de Buenas Prácticas

- [ ] Las pruebas tienen nombres descriptivos
- [ ] Cada prueba valida un solo concepto
- [ ] Se usan fixtures para datos compartidos
- [ ] Se incluyen aserciones claras
- [ ] El código está formateado (make format)
- [ ] No hay warnings de linting (make lint)
- [ ] Se incluyen docstrings
- [ ] Las pruebas son independientes

## 📞 Contacto

Para preguntas o problemas, abre un issue en el repositorio.

## 📄 Licencia

[Especificar licencia]

---

**Última actualización**: 2026-06-21
**Versión**: 1.0.0
